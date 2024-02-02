package com.travel.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travel.dao.BoardDAO;
import com.travel.dto.BoardDTO;
import com.travel.dto.CommentDTO;
import com.travel.util.Util;

@WebServlet("/detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Detail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 상세보기 불러오기
		int no = Util.str2Int(request.getParameter("no"));
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.detail(no);
		
		request.setAttribute("detail", dto);

		// 댓글목록 가져오기
		List<CommentDTO> commentList = dao.commentList(no);

		if (commentList.size() > 0) {
			request.setAttribute("commentList", commentList);
		}

		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
