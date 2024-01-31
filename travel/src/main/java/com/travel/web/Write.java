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


@WebServlet("/write")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Write() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		int in = 0;
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setMid((String)session.getAttribute("mid"));
		dto.setInout(in);
		dto.setMname((String)session.getAttribute("mid"));
		
		int result = dao.write(dto);
		if (result == 1) {
			response.sendRedirect("./inboard");
		} else {
			response.sendRedirect("error.jsp");
		}
		
		
		
	}

}
