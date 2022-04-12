package com.betterhip.dto.notice;

import java.sql.Timestamp;

public class NoticeDto {
	// No. 제목 게시자 게시일 콘텐트 카운트
	int notice_id; 
	String notice_title; 
	String notice_name; 
	Timestamp notice_date;
	String notice_content;
	int notice_count;
	String notice_user_id;
	
	

	public NoticeDto(int notice_id, String notice_title, String notice_name, Timestamp notice_date,
			String notice_content, int notice_count, String notice_user_id) {
		super();
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_name = notice_name;
		this.notice_date = notice_date;
		this.notice_content = notice_content;
		this.notice_count = notice_count;
		this.notice_user_id = notice_user_id;
	}
	
	


	public NoticeDto(int notice_id, String notice_title, Timestamp notice_date, String notice_content,
			String notice_user_id) {
		super();
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_date = notice_date;
		this.notice_content = notice_content;
		this.notice_user_id = notice_user_id;
	}




	public int getNotice_id() {
		return notice_id;
	}


	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_name() {
		return notice_name;
	}


	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}


	public Timestamp getNotice_date() {
		return notice_date;
	}


	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}


	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}


	public int getNotice_count() {
		return notice_count;
	}


	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}


	public String getNotice_user_id() {
		return notice_user_id;
	}


	public void setNotice_user_id(String notice_user_id) {
		this.notice_user_id = notice_user_id;
	}
	
	

}
