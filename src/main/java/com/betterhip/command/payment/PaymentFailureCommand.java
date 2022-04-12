package com.betterhip.command.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.payment.PaymentDao;

public class PaymentFailureCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// user_id 보내기
//		String user_id = request.getParameter("user_id");
		
		HttpSession session = request.getSession();
		String USER_ID = (String) session.getAttribute("USER_ID");
		session.invalidate();
		// dao 선언
		PaymentDao dao = new PaymentDao();
		
		// payFailure 메서드 연결
		dao.payFailure(USER_ID);

	}

}
