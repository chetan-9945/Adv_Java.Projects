<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.product.bean.ProductBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f6f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .form-container {
        background: #fff;
        padding: 25px 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        width: 350px;
    }
    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }
    label {
        font-weight: bold;
        display: block;
        margin-bottom: 6px;
        color: #444;
    }
    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: border 0.3s;
    }
    input[type="text"]:focus {
        border: 1px solid #007bff;
    }
    .btn {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
    }
    .update-btn {
        background-color: #28a745;
        color: white;
    }
    .update-btn:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
<%
    ProductBean pb = (ProductBean) request.getAttribute("pb");
%>
<div class="form-container">
    <h2>Edit Product</h2>
    <form action="product_edit" method="post">
        <input type="hidden" name="pid" value="<%=pb.getpId()%>">

        <label>Price:</label>
        <input type="text" name="price" value="<%=pb.getPrice()%>" required>

        <label>Quantity:</label>
        <input type="text" name="qty" value="<%=pb.getQty()%>" required>

        <input type="submit" value="Update" class="btn update-btn">
    </form>
</div>
</body>
</html>
