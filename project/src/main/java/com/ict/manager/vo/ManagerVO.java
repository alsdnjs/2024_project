package com.ict.manager.vo;


public class ManagerVO {
	// DB 컬럼와 같아야 한다. 
	private String manager_id, manager_pw, manager_type, manager_email, manager_name;

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_pw() {
		return manager_pw;
	}

	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}

	public String getManager_type() {
		return manager_type;
	}

	public void setManager_type(String manager_type) {
		this.manager_type = manager_type;
	}

	public String getManager_email() {
		return manager_email;
	}

	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	
	
	
}
