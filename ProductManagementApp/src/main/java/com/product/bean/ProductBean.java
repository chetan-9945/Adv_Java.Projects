package com.product.bean;

import java.io.Serializable;

public class ProductBean implements Serializable{

	private int pId;
	private String pName;
	private double price;
	private int qty;
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public ProductBean(int pId, String pName, double price, int qty) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.price = price;
		this.qty = qty;
	}
	@Override
	public String toString() {
		return "ProductBean [pId=" + pId + ", pName=" + pName + ", price=" + price + ", qty=" + qty + "]";
	}
	
}
