package com.travel.web;

import java.io.IOException;

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

@WebServlet("/writeedit")
public class WriteEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WriteEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null &&Util.intCheck(request.getParameter("no"))) {
			// no잡기
			int no = Util.str2Int(request.getParameter("no"));
			// dao에 질의 하기
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = dao.detail(no);

			//if (dto.getMid().equals(session.getAttribute("mid"))) {
				request.setAttribute("write", dto);
				
				RequestDispatcher rd = request.getRequestDispatcher("writeedit.jsp");
				rd.forward(request, response);
			//} else {
			//	response.sendRedirect("./error.jsp");
			//}
		} else {
			response.sendRedirect("./error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(request.getParameter("title") != null
				&& request.getParameter("content") != null
				&& Util.intCheck(request.getParameter("no"))) {
			
			BoardDTO dto = new BoardDTO();
			dto.setContent(request.getParameter("content"));
			dto.setTitle(request.getParameter("title"));
			dto.setNo(Util.str2Int(request.getParameter("no")));
			dto.setMid((String)session.getAttribute("mid"));
			BoardDAO dao = new BoardDAO();
			int result = dao.writeedit(dto);
			System.out.println(result);
//			if(result == 1) {
//				
//			}
			//request.setAttribute("content", request.getParameter("content"));
			//request.setAttribute("title", request.getParameter("title"));
			
			
			response.sendRedirect("./detail?no="+ request.getParameter("no"));
			
		} else {
			//error
			response.sendRedirect("./error.jsp");
		}
		
		
		
		

	}

}
