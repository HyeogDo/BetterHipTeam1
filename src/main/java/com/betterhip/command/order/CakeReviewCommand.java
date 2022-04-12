package com.betterhip.command.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.order.CakeInfoDao;

public class CakeReviewCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String user_id = session.getAttribute("USER_ID").toString();
		int cake_id = Integer.parseInt(session.getAttribute("CAKE_ID").toString());
		
		CakeInfoDao dao = new CakeInfoDao();
		ArrayList<String> resultArr = dao.reviewPermission(user_id, cake_id);
		String result = resultArr.get(0);
		request.setAttribute("RESULT",result);
		session.setAttribute("PURCHASE_ID", resultArr.get(1));
	}

}
