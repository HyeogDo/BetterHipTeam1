package com.betterhip.command.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.notice.NoticeDao;

public class NoticeUpdateCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int notice_id = Integer.parseInt(request.getParameter("notice_id"));
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		NoticeDao dao = new NoticeDao();
		dao.update(notice_id, notice_content, notice_title, notice_content);
	}

}
