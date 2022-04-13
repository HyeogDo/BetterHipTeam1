package com.betterhip.command.order;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.order.CakeInfoDao;
import com.betterhip.dao.order.CakeListDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CakeOrderCartCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String purchase_user_id = session.getAttribute("USER_ID").toString();
		int purchase_cake_id = Integer.parseInt(session.getAttribute("CAKE_ID").toString());

		

		String savePath = "/Volumes/Data/eicas/TeamProject/BetterHip/src/main/webapp/assets/img";
		System.out.println(savePath);
		int sizeLimit = 1024*1024*15;

		int purchase_status = 1;
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			String img_fileName = multi.getFilesystemName("purchase_img");
			String img_fileFullPath = savePath + "/" + img_fileName;
			int purchase_customize_id = Integer.parseInt(multi.getParameter("customize_id"));
			int purchase_quantity = Integer.parseInt(multi.getParameter("purchase_quantity"));
			int purchase_price = Integer.parseInt(multi.getParameter("cake_saleprice"));
			String purchase_text = multi.getParameter("purchase_text");
			String purchase_date = multi.getParameter("cake_pickupDate").toString();
			System.out.println("purchase_date commnad :" + purchase_date);
			
			CakeInfoDao dao = new CakeInfoDao();
			String result = dao.purchase(purchase_user_id, purchase_cake_id, purchase_customize_id, purchase_quantity,  purchase_price, purchase_text, purchase_status, img_fileFullPath, img_fileName, purchase_date);
			System.out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
