package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.product.bean.ProductBean;

public class ProductDao {

	public int addProduct(ProductBean pb) {
		int k=0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into product_details values(?,?,?,?)");
			ps.setInt(1, pb.getpId());
			ps.setString(2, pb.getpName());
			ps.setDouble(3, pb.getPrice());
			ps.setInt(4, pb.getQty());
			 k = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}

	public List<ProductBean> viewAllProduct() {
		List<ProductBean> list=new ArrayList<ProductBean>();
	 try {
		Connection con = DBConnection.getConnection(); 
		PreparedStatement ps = con.prepareStatement("select * from product_details");
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			list.add(new ProductBean(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4)));
		}
	 }
	 catch (Exception e) {
		e.printStackTrace();
	}
	return list;
	}

	public ProductBean getById(int id) {
		try {
			Connection con = DBConnection.getConnection(); 
			PreparedStatement ps = con.prepareStatement("select * from product_details where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery(); 
			if(rs.next())
			{
				return new ProductBean(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4));
			}
		 }
		 catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

	public int update(int id, double price, int qty) {
		int k=0;
		try {
			Connection con = DBConnection.getConnection(); 
			PreparedStatement ps = con.prepareStatement("update product_details set PRICE=?,QUANTITY=? where id=?");
			ps.setDouble(1, price);
			ps.setInt(2, qty);
			ps.setInt(3, id);
			k = ps.executeUpdate();
		 }
		 catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}

	public int delete(int id) {
		int k=0;
		try {
			Connection con = DBConnection.getConnection();
		    PreparedStatement ps = con.prepareStatement("delete from product_details where id=?");
		    ps.setInt(1, id);
		    k = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}

	public ProductBean buy(int id) {
		ProductBean pb=null;
		try {
			Connection con = DBConnection.getConnection();
		   PreparedStatement ps= con.prepareStatement("select * from product_details where id=?");
		   ps.setInt(1, id);
		   ResultSet rs = ps.executeQuery();
		   if(rs.next())
		   {
			 pb=new ProductBean(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4));  
		   }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return pb;
	}

	public int updateQty(String pid, String qty) {
		int k=0;
		try {
			Connection con = DBConnection.getConnection();
		   PreparedStatement ps= con.prepareStatement("update product_details set QUANTITY =QUANTITY-? where id=?");
		   ps.setInt(1, Integer.parseInt(qty));
		   ps.setInt(2, Integer.parseInt(pid));
		   k = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return k;
		
	}

	
}
