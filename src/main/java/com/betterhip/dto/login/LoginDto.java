package com.betterhip.dto.login;

public class LoginDto {
	
	// Field
	String meassage;
	String viewPage;
	
	// Constructor
	public LoginDto(String meassage, String viewPage) {
		super();
		this.meassage = meassage;
		this.viewPage = viewPage;
	}

	// Method
	public String getMeassage() {
		return meassage;
	}

	public void setMeassage(String meassage) {
		this.meassage = meassage;
	}

	public String getViewPage() {
		return viewPage;
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	
	
	
	

}
