package com.ict.products.vo;

public class CategoryVO {
	private String category_idx, category_name, parent_idx, description, created_at, updated_at, is_active;

	public String getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(String category_idx) {
		this.category_idx = category_idx;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getParent_idx() {
		return parent_idx;
	}

	public void setParent_idx(String parent_idx) {
		this.parent_idx = parent_idx;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getIs_active() {
		return is_active;
	}

	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}

}