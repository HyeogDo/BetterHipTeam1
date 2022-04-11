package com.betterhip.command.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.order.CakeInfoDao;

public class CakeChoiceCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		CakeInfoDao dao = new CakeInfoDao();
		HttpSession session = request.getSession();
		String user_id = session.getAttribute("USER_ID").toString();
		
		
	}

}
