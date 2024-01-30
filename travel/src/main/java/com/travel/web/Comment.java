package com.travel.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.travel.dao.CommentDAO;
import com.travel.dto.CommentDTO;
import com.travel.util.Util;

@WebServlet("/comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Comment() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
		request.setCharacterEncoding("UTF-8"); // 한글처리
		HttpSession session = request.getSession(); // session 연결

		if (request.getParameter("commentcontent") != null && request.getParameter("bno") != null
				&& session.getAttribute("mid") != null) {
			// 오는 값 받기

			String commentcontent = request.getParameter("commentcontent"); // 댓글내용

			commentcontent = Util.removeTag(commentcontent);

			commentcontent = Util.addBR(commentcontent);

			String bno = request.getParameter("bno"); // 글번호

			// 저장하기
			CommentDTO dto = new CommentDTO();
			dto.setCcoment(commentcontent);
			dto.setTboard_no(Util.str2Int(bno));
			dto.setMid((String) session.getAttribute("mid"));

			CommentDAO dao = new CommentDAO();
			dao.commentWrite(dto);

			// 이동해주세요.
			response.sendRedirect("./detail?no=" + bno);
		} else {
			response.sendRedirect("./login");
		}
	}
}
