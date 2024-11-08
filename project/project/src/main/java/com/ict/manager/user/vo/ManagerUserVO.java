package com.ict.manager.user.vo;

public class ManagerUserVO {
	private String user_id, username, password, phone_number, email, created_at, basic_address, 
	userrank, warned_user, warn_start_at, warn_end_at, warn_cause, user_role;

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBasic_address() {
		return basic_address;
	}

	public void setBasic_address(String basic_address) {
		this.basic_address = basic_address;
	}

	public String getUserrank() {
		return userrank;
	}

	public void setUserrank(String userrank) {
		this.userrank = userrank;
	}

	public String getWarned_user() {
		return warned_user;
	}

	public void setWarned_user(String warned_user) {
		this.warned_user = warned_user;
	}

	public String getWarn_start_at() {
		return warn_start_at;
	}

	public void setWarn_start_at(String warn_start_at) {
		this.warn_start_at = warn_start_at;
	}

	public String getWarn_end_at() {
		return warn_end_at;
	}

	public void setWarn_end_at(String warn_end_at) {
		this.warn_end_at = warn_end_at;
	}

	public String getWarn_cause() {
		return warn_cause;
	}

	public void setWarn_cause(String warn_cause) {
		this.warn_cause = warn_cause;
	}

	public String getUser_role() {
		return user_role;
	}

	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
}
