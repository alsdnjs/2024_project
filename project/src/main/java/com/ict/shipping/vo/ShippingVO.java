package com.ict.shipping.vo;

public class ShippingVO {
	private String shipping_date, carrier, estimated_delivery, shipping_idx, orders_idx, tracking_number;
	
	private String user_idx, total_amount, order_date, product_idx, product_name, status; // orders, Products 테이블의 컬럼

	
	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}

	public String getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}

	public String getShipping_date() {
		return shipping_date;
	}

	public void setShipping_date(String shipping_date) {
		this.shipping_date = shipping_date;
	}

	public String getCarrier() {
		return carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public String getEstimated_delivery() {
		return estimated_delivery;
	}

	public void setEstimated_delivery(String estimated_delivery) {
		this.estimated_delivery = estimated_delivery;
	}

	public String getShipping_idx() {
		return shipping_idx;
	}

	public void setShipping_idx(String shipping_idx) {
		this.shipping_idx = shipping_idx;
	}

	public String getOrders_idx() {
		return orders_idx;
	}

	public void setOrders_idx(String orders_idx) {
		this.orders_idx = orders_idx;
	}

	public String getTracking_number() {
		return tracking_number;
	}

	public void setTracking_number(String tracking_number) {
		this.tracking_number = tracking_number;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
