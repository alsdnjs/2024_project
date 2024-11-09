package com.ict.point.vo;

public class PointVO {
	private String point_idx, user_idx, user_id, points_amount, points_type, description, created_at;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPoint_idx() {
		return point_idx;
	}

	public void setPoint_idx(String point_idx) {
		this.point_idx = point_idx;
	}

	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}

	public String getPoints_amount() {
		return points_amount;
	}

	public void setPoints_amount(String points_amount) {
		this.points_amount = points_amount;
	}

	public String getPoints_type() {
		return points_type;
	}

	public void setPoints_type(String points_type) {
		this.points_type = points_type;
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
	
	
}
