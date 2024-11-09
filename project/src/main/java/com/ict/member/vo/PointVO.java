package com.ict.member.vo;

public class PointVO {
	private int point_idx, user_idx, points_amount;	
	private String points_type, description, created_at;
	
	public int getPoint_idx() {
		return point_idx;
	}
	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getPoints_amount() {
		return points_amount;
	}
	public void setPoints_amount(int points_amount) {
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
