package com.betterhip.command.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.mypage.RefundQueryListDao;
import com.betterhip.dao.mypage.UserInfoViewDao;
import com.betterhip.dto.mypage.PurchaseListDto;
import com.betterhip.dto.mypage.UserInfoDto;

public class RefundQueryListCommand implements BetterhipCommand {

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
		
		//주문상태가 '취소'인 구매정보 가져오기 
		RefundQueryListDao dao1 = new RefundQueryListDao();
		ArrayList<PurchaseListDto> dtos1 = dao1.cancelList(USER_ID, queryStartDate, queryEndDate);
		request.setAttribute("cancelList", dtos1);
		
		//주문상태가 '취소'인 구매정보 가져오기 
		RefundQueryListDao dao2 = new RefundQueryListDao();
		ArrayList<PurchaseListDto> dtos2 = dao2.refundList(USER_ID, queryStartDate, queryEndDate);
		request.setAttribute("refundList", dtos2);
		
		
		
	}

}
