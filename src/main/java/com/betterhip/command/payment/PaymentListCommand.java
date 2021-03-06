package com.betterhip.command.payment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.payment.PaymentDao;
import com.betterhip.dto.payment.PaymentDto;


public class PaymentListCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// user_id 받아오기
//		String user_id = request.getParameter("user_id");
		
		HttpSession session = request.getSession();
		String USER_ID = (String) session.getAttribute("USER_ID"); 
		
		// dao 선언
		PaymentDao dao = new PaymentDao();
		
		// paymentList 매서드 연결 (주문 목록 리스트)
		ArrayList<PaymentDto> dtos_purchase_list = dao.paymentList(USER_ID);
		request.setAttribute("paymentList", dtos_purchase_list);
		
		// paymentUserList 매서드 연결 (유저 정보)
		PaymentDto dto_purchase_user = dao.paymentUserList(USER_ID);
		request.setAttribute("paymentUserList", dto_purchase_user);
		
		// paymentPriceList 매서드 연결 (주문 총 가격)
		int dto_purchase_price = dao.paymentPriceList(USER_ID);
		request.setAttribute("total_price", dto_purchase_price);
		
		

	}

}