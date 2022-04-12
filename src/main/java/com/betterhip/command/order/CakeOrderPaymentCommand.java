package com.betterhip.command.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.order.CakeListDao;

public class CakeOrderPaymentCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
//		String purchase_user_id = session.getAttribute("USER_ID").toString();
//		int purchase_cake_id = Integer.parseInt(session.getAttribute("CAKE_ID").toString());
		String purchase_user_id = "test11";
		int purchase_cake_id = 1;
		
		int pucahse_customize_id = Integer.parseInt(request.getParameter("customize_id"));
		int purchase_quantity = Integer.parseInt(request.getParameter("purchase_quantity"));
		int purchase_price = Integer.parseInt(request.getParameter("cake_saleprice"));
		String puchase_text = request.getParameter("purchase_text");
		
		int purchase_status = 2;
		
		CakeListDao dao = new CakeListDao();
		String result = dao.purchase(purchase_user_id, purchase_cake_id, pucahse_customize_id, purchase_quantity, purchase_price, puchase_text, purchase_status);
		System.out.println(result);
	}

}
