package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.product.bean.AdminBean;

public class AdminLoginDao {

	public AdminBean login(String aName, String pWord) {
		AdminBean ab=null;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from admin_info where NAME=? and PASSWORD=?");
			ps.setString(1, aName);
			ps.setString(2, pWord);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				ab=new AdminBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getLong(6));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}

}
