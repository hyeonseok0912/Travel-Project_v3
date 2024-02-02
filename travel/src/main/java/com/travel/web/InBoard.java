package com.travel.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.travel.dao.BoardDAO;
import com.travel.dto.BoardDTO;
import com.travel.util.Util;

@WebServlet("/inboard")
public class InBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InBoard() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		BoardDAO dao = new BoardDAO();
		list = dao.inboardList();

		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("inboard.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		BoardDTO dto = new BoardDTO();

		dto.setMid((String) session.getAttribute("mid"));
		dto.setMname((String) session.getAttribute("mid"));
		dto.setInout(Util.str2Int(request.getParameter("write")));
		RequestDispatcher rd = request.getRequestDispatcher("./write?write=" + request.getParameter("write"));
		rd.forward(request, response);
	}

}
