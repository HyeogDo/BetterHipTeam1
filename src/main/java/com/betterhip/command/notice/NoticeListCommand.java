package com.betterhip.command.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.notice.NoticeDao;
import com.betterhip.dto.notice.NoticeDto;

public class NoticeListCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		
		NoticeDao dao = new NoticeDao();
		ArrayList<NoticeDto> dtos = dao.list();
		request.setAttribute("list", dtos);
	}

}
