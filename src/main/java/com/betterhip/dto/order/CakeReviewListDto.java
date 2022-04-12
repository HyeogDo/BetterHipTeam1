package com.betterhip.dto.order;

public class CakeReviewListDto {
	int review_id;
	String review_content;
	String review_date;
	int review_star;
	String purchase_user_id;
	
	public CakeReviewListDto(int review_id, String review_content, String review_date, int review_star,
			String purchase_user_id) {
		super();
		this.review_id = review_id;
		this.review_content = review_content;
		this.review_date = review_date;
		this.review_star = review_star;
		this.purchase_user_id = purchase_user_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public String getPurchase_user_id() {
		return purchase_user_id;
	}

	public void setPurchase_user_id(String purchase_user_id) {
		this.purchase_user_id = purchase_user_id;
	}
	
	
}
