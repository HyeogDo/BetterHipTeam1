package com.betterhip.command.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.mypage.PurchaseImgListPopupDao;
import com.betterhip.dto.mypage.PurchaseImgListPopupDto;


public class PurchaseImgListPopupCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		
	
		//purchase_id 받기 
		int purchase_id = Integer.parseInt(request.getParameter("purchase_id"));
		
		//purchase_id의 구매 이미지 가져오기 
		PurchaseImgListPopupDao dao = new PurchaseImgListPopupDao();
		PurchaseImgListPopupDto dto = dao.purchaseImgList(purchase_id);
		request.setAttribute("Purchase_Img", dto);
	
		
	}//

}
