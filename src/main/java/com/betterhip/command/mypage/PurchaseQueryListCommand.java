package com.betterhip.command.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.mypage.PurchaseQueryListDao;
import com.betterhip.dao.mypage.UserInfoViewDao;
import com.betterhip.dto.mypage.PurchaseListDto;
import com.betterhip.dto.mypage.UserInfoDto;

public class PurchaseQueryListCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		//USER_ID 받기 
		
		//겟파라미터로 받을 때 
//		String USER_ID = request.getParameter("user_id");
		
		//세션에 넣기 
//		HttpSession session = request.getSession();
//		session.setAttribute("USER_ID", USER_ID);
		
		//세션으로 받을 때 
		HttpSession session = request.getSession();
		String USER_ID = (String) session.getAttribute("USER_ID"); 
		
		//회원정보 가져오기  
		UserInfoViewDao dao = new UserInfoViewDao();
		UserInfoDto dto = dao.userInfoView(USER_ID); 
		request.setAttribute("userInfo", dto);
		
		//사용자 지정 쿼리 날짜 받기 
		String queryStartDate = request.getParameter("startDate").toString();
		String queryEndDate = request.getParameter("endDate").toString();
		
		System.out.println(queryStartDate);
		System.out.println(queryEndDate);
		//구매정보 가져오기 
		PurchaseQueryListDao dao1 = new PurchaseQueryListDao();
		ArrayList<PurchaseListDto> dtos = dao1.purchaseList(USER_ID, queryStartDate, queryEndDate);
		request.setAttribute("purchaseList", dtos);
		
		//주문 상태별 카운트 가져오기 
		PurchaseQueryListDao dao2 = new PurchaseQueryListDao();
		int purchase_status_count_3 = dao2.purchase_status_count_3(USER_ID, queryStartDate, queryEndDate);
		request.setAttribute("purchase_status_count_3", purchase_status_count_3);
		
		PurchaseQueryListDao dao3 = new PurchaseQueryListDao();
		int purchase_status_count_101 = dao3.purchase_status_count_101(USER_ID, queryStartDate, queryEndDate);
		request.setAttribute("purchase_status_count_101", purchase_status_count_101);
		
		PurchaseQueryListDao dao4 = new PurchaseQueryListDao();
		int purchase_status_count_103 = dao4.purchase_status_count_103(USER_ID, queryStartDate, queryEndDate);
		request.setAttribute("purchase_status_count_103", purchase_status_count_103);
		
		
	}

}
