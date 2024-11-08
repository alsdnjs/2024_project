package com.ict.member.vo;

public class MemberVO {
	private String user_idx;               // 사용자 인덱스
    private String user_id;             // 사용자 아이디
	private String username, email, password, phone_number, basic_address, created_at, updated_at, deleted, is_verified, user_role, last_login, warned_user, warn_cause, warn_start_at, warn_end_at ;

	

	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getBasic_address() {
		return basic_address;
	}

	public void setBasic_address(String basic_address) {
		this.basic_address = basic_address;
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

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getIs_verified() {
		return is_verified;
	}

	public void setIs_verified(String is_verified) {
		this.is_verified = is_verified;
	}

	public String getUser_role() {
		return user_role;
	}

	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}

	public String getLast_login() {
		return last_login;
	}

	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}

	public String getWarned_user() {
		return warned_user;
	}

	public void setWarned_user(String warned_user) {
		this.warned_user = warned_user;
	}

	public String getWarn_cause() {
		return warn_cause;
	}

	public void setWarn_cause(String warn_cause) {
		this.warn_cause = warn_cause;
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
	
	@Override
	public String toString() {
	    return "MemberVO{" +
	            "user_idx=" + user_idx +
	            ", user_id='" + user_id + '\'' +
	            ", username='" + username + '\'' +
	            ", email='" + email + '\'' +
	            ", password='" + password + '\'' +
	            ", phone_number='" + phone_number + '\'' +
	            ", basic_address='" + basic_address + '\'' +
	            ", created_at='" + created_at + '\'' +
	            ", updated_at='" + updated_at + '\'' +
	            ", deleted='" + deleted + '\'' +
	            ", is_verified='" + is_verified + '\'' +
	            ", user_role='" + user_role + '\'' +
	            ", last_login='" + last_login + '\'' +
	            ", warned_user='" + warned_user + '\'' +
	            ", warn_cause='" + warn_cause + '\'' +
	            ", warn_start_at='" + warn_start_at + '\'' +
	            ", warn_end_at='" + warn_end_at + '\'' +
	            '}';
	
	
	}
	
	

}
