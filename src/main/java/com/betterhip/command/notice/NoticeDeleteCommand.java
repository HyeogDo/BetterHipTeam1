package com.betterhip.command.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.notice.NoticeDao;

public class NoticeDeleteCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("noticeDeleteCommand");
		int notice_id = Integer.parseInt(request.getParameter("notice_id"));
		NoticeDao dao = new NoticeDao();
		dao.delete(notice_id);
	}

}
