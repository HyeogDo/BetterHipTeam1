package com.betterhip.dto.main;

import java.sql.Blob;

public class CakeAdDto {
	String curate_title;
	int cake_id;
	String base64Image;
	String cake_name;
	int cake_saleprice;
	
	public CakeAdDto(String curate_title, int cake_id, String base64Image, String cake_name, int cake_saleprice) {
		super();
		this.curate_title = curate_title;
		this.cake_id = cake_id;
		this.base64Image = base64Image;
		this.cake_name = cake_name;
		this.cake_saleprice = cake_saleprice;
	}

	public String getCurate_title() {
		return curate_title;
	}

	public void setCurate_title(String curate_title) {
		this.curate_title = curate_title;
	}

	public int getCake_id() {
		return cake_id;
	}

	public void setCake_id(int cake_id) {
		this.cake_id = cake_id;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
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
	
}
