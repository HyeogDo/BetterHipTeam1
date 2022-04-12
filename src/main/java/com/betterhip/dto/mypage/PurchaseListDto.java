package com.betterhip.dto.mypage;

public class PurchaseListDto {
	
	
	


	//field 
	int purchase_id;
	String purchase_date; 
	String cake_name; 
	String cake_img_base64Image;
	String cake_option; 
	String purchase_text;
	int purchase_quantity; 
	int purchase_price;
	String purchase_status;
	String purchase_pickup_date; 


	//constructor 
	public PurchaseListDto(int purchase_id, String purchase_date, String cake_name, String cake_img_base64Image,
			String cake_option, String purchase_text, int purchase_quantity, int purchase_price, String purchase_status,
			String purchase_pickup_date) {
		super();
		this.purchase_id = purchase_id;
		this.purchase_date = purchase_date;
		this.cake_name = cake_name;
		this.cake_img_base64Image = cake_img_base64Image;
		this.cake_option = cake_option;
		this.purchase_text = purchase_text;
		this.purchase_quantity = purchase_quantity;
		this.purchase_price = purchase_price;
		this.purchase_status = purchase_status;
		this.purchase_pickup_date = purchase_pickup_date;
	}



	//getters and setters 
	public int getPurchase_id() {
		return purchase_id;
	}


	public void setPurchase_id(int purchase_id) {
		this.purchase_id = purchase_id;
	}


	public String getPurchase_date() {
		return purchase_date;
	}


	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}


	public String getCake_name() {
		return cake_name;
	}


	public void setCake_name(String cake_name) {
		this.cake_name = cake_name;
	}


	public String getCake_img_base64Image() {
		return cake_img_base64Image;
	}


	public void setCake_img_base64Image(String cake_img_base64Image) {
		this.cake_img_base64Image = cake_img_base64Image;
	}


	public String getCake_option() {
		return cake_option;
	}


	public void setCake_option(String cake_option) {
		this.cake_option = cake_option;
	}


	public String getPurchase_text() {
		return purchase_text;
	}


	public void setPurchase_text(String purchase_text) {
		this.purchase_text = purchase_text;
	}


	public int getPurchase_quantity() {
		return purchase_quantity;
	}


	public void setPurchase_quantity(int purchase_quantity) {
		this.purchase_quantity = purchase_quantity;
	}


	public int getPurchase_price() {
		return purchase_price;
	}


	public void setPurchase_price(int purchase_price) {
		this.purchase_price = purchase_price;
	}


	public String getPurchase_status() {
		return purchase_status;
	}


	public void setPurchase_status(String purchase_status) {
		this.purchase_status = purchase_status;
	}


	public String getPurchase_pickup_date() {
		return purchase_pickup_date;
	}


	public void setPurchase_pickup_date(String purchase_pickup_date) {
		this.purchase_pickup_date = purchase_pickup_date;
	}
	

	
	
}//PurchaseListDto