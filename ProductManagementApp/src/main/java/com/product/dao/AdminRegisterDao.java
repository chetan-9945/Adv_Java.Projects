package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.product.bean.AdminBean;

public class AdminRegisterDao 
{
	int k=0;
	public int register(AdminBean adminBean)
	{
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into admin_info values(?,?,?,?,?,?)");
		    ps.setString(1, adminBean.getName());
		    ps.setString(2, adminBean.getpWord());
		    ps.setString(3, adminBean.getfName());
		    ps.setString(4, adminBean.getlName());
		    ps.setString(5, adminBean.getmId());
		    ps.setLong(6, adminBean.getPhNo());
		    k=ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}
