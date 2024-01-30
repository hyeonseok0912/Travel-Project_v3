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

import com.travel.dao.BoardDAO;
import com.travel.dto.BoardDTO;

@WebServlet("/outboard")
public class Outboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Outboard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BoardDTO> list = new ArrayList<BoardDTO>();	
		BoardDAO dao = new BoardDAO();
		
		list = dao.outboardList();
		
		request.setAttribute("list", list);
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("outboard.jsp");
		rd.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
