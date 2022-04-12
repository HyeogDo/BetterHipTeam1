package com.betterhip.command.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.login.LoginDao;
import com.betterhip.dto.login.LoginDto;



public class LoginCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		String loginMethod = request.getParameter("loginMethod"); // 카카오, 일반 로그인 구별
			
		HttpSession session = request.getSession();	
	
		LoginDao dao = new LoginDao();
		LoginDto dto = dao.Login(user_id, user_pw, loginMethod, request, response);
		
		
	
		request.setAttribute("viewPage", dto.getViewPage());
		session.setAttribute("message", dto.getMeassage());;
		
		// 회원으로 확인되면 session에 user_id 저장 
		if(dto.getMeassage().equals("success")) {
			session.setAttribute("USER_ID", user_id);
			System.out.println("USER_ID Set : " + user_id);
		}
	
			
	}

}