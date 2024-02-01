package com.travel.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travel.dao.MemberDAO;
import com.travel.dto.MemberDTO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Join() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//AJAX 통해서 post로 보낸거 받아주시면 되시잖아 한잔해~
		if(request.getParameter("id") != null && request.getParameter("pw1") != null 
				&& request.getParameter("name") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setMid(request.getParameter("id"));
			dto.setMpw(request.getParameter("pw1"));
			dto.setMname(request.getParameter("name"));
			
			MemberDAO dao = new MemberDAO();
			int result = dao.join(dto);
			
			if(result == 1) {
				//로그인 페이지로
				response.sendRedirect("./login");
			} else {
				//에러 페이지로
				response.sendRedirect("./error");
			}
		}
	}

}
