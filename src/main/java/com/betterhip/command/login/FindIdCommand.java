package com.betterhip.command.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.login.FindIdDao;

public class FindIdCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		
		FindIdDao dao = new FindIdDao();
		String user_id = dao.findId(user_name, user_email);
		request.setAttribute("USER_ID", user_id);
		request.setAttribute("USER_NAME", user_name);
	}

}
