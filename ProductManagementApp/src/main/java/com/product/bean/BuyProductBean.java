package com.product.bean;

public class BuyProductBean {

	private int pId,rqty;
	private double price,totalAmount;
	private String name;
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getRqty() {
		return rqty;
	}
	public void setRqty(int rqty) {
		this.rqty = rqty;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BuyProductBean(int pId, int rqty, double price, double totalAmount, String name) {
		super();
		this.pId = pId;
		this.rqty = rqty;
		this.price = price;
		this.totalAmount = totalAmount;
		this.name = name;
	}
	
}
