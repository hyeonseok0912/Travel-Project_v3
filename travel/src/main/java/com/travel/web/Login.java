package com.travel.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.travel.dao.MemberDAO;
import com.travel.dto.MemberDTO;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		HttpSession session = request.getSession();
		dto.setMid(request.getParameter("id"));
		dto.setMpw(request.getParameter("pw"));
		
		MemberDAO dao = new MemberDAO();
		dto = dao.login(dto);
		
		if(dto.getCount() == 1) {
			session.setAttribute("mname", dto.getMname());
			session.setAttribute("mid", dto.getMid());
			
			response.sendRedirect("./index");
		}else {
			response.sendRedirect("./login?error=000");
		}
	}

	
}
