package com.betterhip.dto.order;

public class CakeInfoDto {
	String cake_name;
	int cake_saleprice;
	String cake_status;
	String base64Image;
	int customize_id;
	String customize_taste;
	String customize_size;
	String customize_cream_type;
	String customize_cream_color;
	int customize_saleprice;
	public CakeInfoDto(String cake_name, int cake_saleprice, String cake_status, String base64Image, int customize_id,
			String customize_taste, String customize_size, String customize_cream_type, String customize_cream_color,
			int customize_saleprice) {
		super();
		this.cake_name = cake_name;
		this.cake_saleprice = cake_saleprice;
		this.cake_status = cake_status;
		this.base64Image = base64Image;
		this.customize_id = customize_id;
		this.customize_taste = customize_taste;
		this.customize_size = customize_size;
		this.customize_cream_type = customize_cream_type;
		this.customize_cream_color = customize_cream_color;
		this.customize_saleprice = customize_saleprice;
	}
	public String getCake_name() {
		return cake_name;
	}
	public void setCake_name(String cake_name) {
		this.cake_name = cake_name;
	}
	public int getCake_saleprice() {
		return cake_saleprice;
	}
	public void setCake_saleprice(int cake_saleprice) {
		this.cake_saleprice = cake_saleprice;
	}
	public String getCake_status() {
		return cake_status;
	}
	public void setCake_status(String cake_status) {
		this.cake_status = cake_status;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public int getCustomize_id() {
		return customize_id;
	}
	public void setCustomize_id(int customize_id) {
		this.customize_id = customize_id;
	}
	public String getCustomize_taste() {
		return customize_taste;
	}
	public void setCustomize_taste(String customize_taste) {
		this.customize_taste = customize_taste;
	}
	public String getCustomize_size() {
		return customize_size;
	}
	public void setCustomize_size(String customize_size) {
		this.customize_size = customize_size;
	}
	public String getCustomize_cream_type() {
		return customize_cream_type;
	}
	public void setCustomize_cream_type(String customize_cream_type) {
		this.customize_cream_type = customize_cream_type;
	}
	public String getCustomize_cream_color() {
		return customize_cream_color;
	}
	public void setCustomize_cream_color(String customize_cream_color) {
		this.customize_cream_color = customize_cream_color;
	}
	public int getCustomize_saleprice() {
		return customize_saleprice;
	}
	public void setCustomize_saleprice(int customize_saleprice) {
		this.customize_saleprice = customize_saleprice;
	}
	
	

}
