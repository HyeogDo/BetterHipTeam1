package com.betterhip.command.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.mypage.PurchaseListDao;
import com.betterhip.dao.mypage.UserInfoViewDao;
import com.betterhip.dto.mypage.PurchaseListDto;
import com.betterhip.dto.mypage.UserInfoDto;

public class PurchaseListCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

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
		
		//구매정보 가져오기 
		PurchaseListDao dao1 = new PurchaseListDao();
		ArrayList<PurchaseListDto> dtos = dao1.purchaseList(USER_ID);
		request.setAttribute("purchaseList", dtos);
		
		//주문 상태별 카운트 가져오기 
		PurchaseListDao dao2 = new PurchaseListDao();
		int purchase_status_count_3 = dao2.purchase_status_count_3(USER_ID);
		request.setAttribute("purchase_status_count_3", purchase_status_count_3);
		
		PurchaseListDao dao3 = new PurchaseListDao();
		int purchase_status_count_101 = dao3.purchase_status_count_101(USER_ID);
		request.setAttribute("purchase_status_count_101", purchase_status_count_101);
		
		PurchaseListDao dao4 = new PurchaseListDao();
		int purchase_status_count_103 = dao4.purchase_status_count_103(USER_ID);
		request.setAttribute("purchase_status_count_103", purchase_status_count_103);
		
		
	}

}
