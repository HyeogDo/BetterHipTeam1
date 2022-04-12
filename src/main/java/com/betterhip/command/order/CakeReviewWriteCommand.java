package com.betterhip.command.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.order.CakeInfoDao;

public class CakeReviewWriteCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int cake_id = Integer.parseInt(session.getAttribute("CAKE_ID").toString());
		int purchase_id = Integer.parseInt( session.getAttribute("PURCHASE_ID").toString());
		
		String review_content = request.getParameter("review_content");
		int review_star = Integer.parseInt(request.getParameter("review_star"));
		
		CakeInfoDao dao = new CakeInfoDao();
		String result = dao.reviewInput(purchase_id, cake_id, review_content, review_star);
		request.setAttribute("WRITE_RESULT", result);
	}

}
