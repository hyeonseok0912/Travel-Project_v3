package com.travel.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travel.dao.MemberDAO;
import com.travel.dto.MemberDTO;

@WebServlet("/pwFind")
public class PwFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PwFind() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/find.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		//System.out.println("이름 : " + name);
		//System.out.println("아이디는 : " + id);
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		dto.setMname(name);
		dto.setMid(id);
		
		String result = dao.pwFind(dto);
		if(result == null) {
			result = "";
		}

		PrintWriter pw = response.getWriter();
		pw.print(result);
		pw.close();
	}

}
