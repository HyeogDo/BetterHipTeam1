package com.betterhip.command.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.payment.PaymentDao;

public class PaymentSuccessCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// user_id, purchase_kakao_id 보내기
		String user_id = request.getParameter("user_id");
		String purchase_kakao_id = request.getParameter("purchase_kakao_id");
		
		// dao 선언
		PaymentDao dao = new PaymentDao();
		
		// paySuccess 매서드 연결
		dao.paySuccess(user_id, purchase_kakao_id);

	}

}
