package com.betterhip.command.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.payment.PaymentDao;

public class PaymentListPopupCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		int purchase_id = Integer.parseInt(request.getParameter("purchase_id"));
		
		PaymentDao dao= new PaymentDao();
		
		String purchase_img = dao.paymentListPopup(purchase_id);
		request.setAttribute("purchase_img", purchase_img);

	}

}
