package com.betterhip.command.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.login.FindPwDao;

public class FindPwCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		
		FindPwDao dao = new FindPwDao();
		String user_pw = dao.findPw(user_id, user_name, user_email);
		request.setAttribute("USER_PW", user_pw);
		request.setAttribute("USER_NAME", user_name);
	}

}
