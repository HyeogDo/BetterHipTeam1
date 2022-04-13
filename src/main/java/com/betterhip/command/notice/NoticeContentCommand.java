package com.betterhip.command.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.notice.NoticeDao;
import com.betterhip.dto.notice.NoticeDto;

public class NoticeContentCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("jlslhjsl");
		String notice_id = request.getParameter("notice_id");
		NoticeDao dao = new NoticeDao();
		NoticeDto dto = dao.noticeContent(notice_id);
		
		request.setAttribute("noticeContent", dto);
	}

}
