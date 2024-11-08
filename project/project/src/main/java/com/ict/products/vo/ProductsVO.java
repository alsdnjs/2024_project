package com.ict.products.vo;

public class ProductsVO {
	
	private String product_idx, product_name, seller_idx, description, price, stock, category_idx, created_at, updated_at, status, thumbnail_url, is_featured, is_active;
	
	//reviews에서 가져온 값
	private String avg_rating;
	
	// likes에 필요한 값

	public String getProduct_idx() {
		return product_idx;
	}


	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getSeller_idx() {
		return seller_idx;
	}


	public void setSeller_idx(String seller_idx) {
		this.seller_idx = seller_idx;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getStock() {
		return stock;
	}


	public void setStock(String stock) {
		this.stock = stock;
	}


	public String getCategory_idx() {
		return category_idx;
	}


	public void setCategory_idx(String category_idx) {
		this.category_idx = category_idx;
	}


	public String getCreated_at() {
		return created_at;
	}


	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}


	public String getUpdated_at() {
		return updated_at;
	}


	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getThumbnail_url() {
		return thumbnail_url;
	}


	public void setThumbnail_url(String thumbnail_url) {
		this.thumbnail_url = thumbnail_url;
	}


	public String getIs_featured() {
		return is_featured;
	}


	public void setIs_featured(String is_featured) {
		this.is_featured = is_featured;
	}


	public String getIs_active() {
		return is_active;
	}


	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}


	public String getAvg_rating() {
		return avg_rating;
	}


	public void setAvg_rating(String avg_rating) {
		this.avg_rating = avg_rating;
	}



}
