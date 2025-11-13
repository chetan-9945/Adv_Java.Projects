package com.dao;

import java.sql.*;
import java.util.*;
import com.pojo.UserAccount;

public class UserDAO {
    
    private Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "chetan", "India4599");
    }

    public boolean registerUser(UserAccount user) {
        String sql = "INSERT INTO USERS (NAME, MOBILE, USERNAME, EMAIL, PASSWORD) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getMobile());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Login validation
    public UserAccount loginUser(String username, String password) {
        String sql = "SELECT NAME, MOBILE, USERNAME, EMAIL, PASSWORD FROM USERS WHERE USERNAME = ? AND PASSWORD = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    UserAccount user = new UserAccount();
                    user.setName(rs.getString("NAME"));
                    user.setMobile(rs.getString("MOBILE"));
                    user.setUsername(rs.getString("USERNAME"));
                    user.setEmail(rs.getString("EMAIL"));
                    user.setPassword(rs.getString("PASSWORD"));
                    return user;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    // ✅ Get all users
    public List<UserAccount> getAllUsers() {
        List<UserAccount> list = new ArrayList<>();
        String sql = "SELECT * FROM USERS ORDER BY USERNAME";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                UserAccount user = new UserAccount();
                user.setName(rs.getString("NAME"));
                user.setMobile(rs.getString("MOBILE"));
                user.setUsername(rs.getString("USERNAME"));
                user.setEmail(rs.getString("EMAIL"));
                user.setPassword(rs.getString("PASSWORD"));
                list.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Update user details
    public boolean updateUser(UserAccount user) {
        String sql = "UPDATE USERS SET NAME=?, MOBILE=?, EMAIL=?, PASSWORD=? WHERE USERNAME=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getMobile());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getUsername());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Delete user
    public boolean deleteUser(String username) {
        String sql = "DELETE FROM USERS WHERE USERNAME=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
