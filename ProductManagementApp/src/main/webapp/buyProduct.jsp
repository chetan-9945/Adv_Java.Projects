<%@page import="com.product.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Product</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background: #fff;
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        width: 400px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    .form-group {
        margin-bottom: 15px;
        text-align: left;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-weight: bold;
        color: #444;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box;
        font-size: 14px;
    }

    input[readonly] {
        background: #f3f3f3;
    }

    .btn-submit {
        background: #2575fc;
        color: #fff;
        padding: 12px 18px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s;
        width: 100%;
    }

    .btn-submit:hover {
        background: #1b5edb;
    }
</style>
</head>
<body>
<%
    ProductBean pb = (ProductBean) request.getAttribute("pbean");
%>
<div class="form-container">
    <h2>Buy Product</h2>
    <form action="buy_p" method="post">
        <div class="form-group">
            <label>Product Id</label>
            <input type="text" name="pid" value="<%=pb.getpId()%>" readonly>
        </div>

        <div class="form-group">
            <label>Product Name</label>
            <input type="text" name="pname" value="<%=pb.getpName()%>" readonly>
        </div>

        <div class="form-group">
            <label>Price</label>
            <input type="text" name="price" value="<%=pb.getPrice()%>" readonly>
        </div>

        <div class="form-group">
            <label>Available Quantity</label>
            <input type="text" name="qty" value="<%=pb.getQty()%>" readonly>
        </div>

        <div class="form-group">
            <label>Required Quantity</label>
            <input type="text" name="rqty" placeholder="Enter quantity">
        </div>

        <button type="submit" class="btn-submit">Buy Product</button>
    </form>
</div>
</body>
</html>
