package com.pojo;

public class UserAccount {

    private String name;
    private String mobile;
    private String username;
    private String email;
    private String password;

    public UserAccount() {
    }

    public UserAccount(String name, String mobile, String username, String email, String password) {
        if (!validate(name, mobile, username, email, password)) {
            throw new IllegalArgumentException("Invalid user data. Please check inputs.");
        }
        this.name = name.trim();
        this.mobile = mobile.trim();
        this.username = username.trim();
        this.email = email.trim();
        this.password = password;
    }

    private boolean validate(String name, String mobile, String username, String email, String password) {
        if (name == null || name.trim().isEmpty()) return false;
        if (mobile == null || !mobile.matches("\\d{10}")) return false;
        if (username == null || username.trim().isEmpty()) return false;
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) return false;
        if (password == null || password.trim().length() < 8) return false;
        return true;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Invalid name");
        }
        this.name = name.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        if (mobile == null || !mobile.matches("\\d{10}")) {
            throw new IllegalArgumentException("Invalid mobile number");
        }
        this.mobile = mobile.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("Invalid username");
        }
        this.username = username.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            throw new IllegalArgumentException("Invalid email");
        }
        this.email = email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (password == null || password.trim().length() < 8) {
            throw new IllegalArgumentException("Invalid password (minimum 8 characters)");
        }
        this.password = password;
    }
}
