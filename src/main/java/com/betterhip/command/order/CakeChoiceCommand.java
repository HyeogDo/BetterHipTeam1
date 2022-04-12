package com.betterhip.command.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.order.CakeInfoDao;
import com.betterhip.dto.order.CakeInfoDto;
import com.betterhip.dto.order.CakeReviewListDto;

public class CakeChoiceCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		CakeInfoDao dao = new CakeInfoDao();
		HttpSession session = request.getSession();
		String user_id = session.getAttribute("USER_ID").toString();			
		int cake_id = Integer.parseInt(session.getAttribute("CAKE_ID").toString());		
		
		ArrayList<CakeInfoDto> dtos = dao.list(user_id, cake_id);
		ArrayList<CakeReviewListDto> dtos2 = dao.reviewList(user_id, cake_id);
		request.setAttribute("LIST", dtos);
		request.setAttribute("REVIEWLIST", dtos2);
		request.setAttribute("COUNTREVIEW", dtos2.size());
		
		
	}

}
