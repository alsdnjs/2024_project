package com.ict.manager.seller.vo;

public class ManagerSellerVO {
private String sellers_idx, store_name, store_description, create_at, 
update_at, contact_number, seller_rep_name, user_id;

public String getSellers_idx() {
	return sellers_idx;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public void setSellers_idx(String sellers_idx) {
	this.sellers_idx = sellers_idx;
}

public String getStore_name() {
	return store_name;
}

public void setStore_name(String store_name) {
	this.store_name = store_name;
}

public String getStore_description() {
	return store_description;
}

public void setStore_description(String store_description) {
	this.store_description = store_description;
}

public String getCreate_at() {
	return create_at;
}

public void setCreate_at(String create_at) {
	this.create_at = create_at;
}

public String getUpdate_at() {
	return update_at;
}

public void setUpdate_at(String update_at) {
	this.update_at = update_at;
}

public String getContact_number() {
	return contact_number;
}

public void setContact_number(String contact_number) {
	this.contact_number = contact_number;
}

public String getSeller_rep_name() {
	return seller_rep_name;
}

public void setSeller_rep_name(String seller_rep_name) {
	this.seller_rep_name = seller_rep_name;
}


}
