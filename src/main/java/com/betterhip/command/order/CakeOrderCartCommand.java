package com.betterhip.command.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.order.CakeListDao;

public class CakeOrderCartCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String purchase_user_id = session.getAttribute("USER_ID").toString();
		int purchase_cake_id = Integer.parseInt(session.getAttribute("CAKE_ID").toString());

		
		int purchase_customize_id = Integer.parseInt(request.getParameter("customize_id"));
		int purchase_quantity = Integer.parseInt(request.getParameter("purchase_quantity"));
		int purchase_price = Integer.parseInt(request.getParameter("cake_saleprice"));
		String purchase_text = request.getParameter("purchase_text");
		
		System.out.println("user id : " + purchase_user_id);
		System.out.println("cake_id : " + purchase_cake_id);
		System.out.println("customize id : " + purchase_customize_id);
		System.out.println("text : " + purchase_text);
		
		int purchase_status = 1;
		
		CakeListDao dao = new CakeListDao();
		String result = dao.purchase(purchase_user_id, purchase_cake_id, purchase_customize_id, purchase_quantity, purchase_price, purchase_text, purchase_status);
		System.out.println(result);
	}

}
