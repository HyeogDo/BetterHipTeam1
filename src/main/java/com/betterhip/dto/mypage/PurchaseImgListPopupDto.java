package com.betterhip.dto.mypage;

public class PurchaseImgListPopupDto {
	
	

	//field 
	String purchase_img_fileName;
	String purchase_img_base64Image; 

	
	//constructor 
	public PurchaseImgListPopupDto(String purchase_img_fileName, String purchase_img_base64Image) {
		super();
		this.purchase_img_fileName = purchase_img_fileName;
		this.purchase_img_base64Image = purchase_img_base64Image;
	}


	
	//getters and setters 
	
	public String getPurchase_img_fileName() {
		return purchase_img_fileName;
	}


	public void setPurchase_img_fileName(String purchase_img_fileName) {
		this.purchase_img_fileName = purchase_img_fileName;
	}


	public String getPurchase_img_base64Image() {
		return purchase_img_base64Image;
	}


	public void setPurchase_img_base64Image(String purchase_img_base64Image) {
		this.purchase_img_base64Image = purchase_img_base64Image;
	}
	
	
	
}//
