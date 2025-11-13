<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #43cea2, #185a9d);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background: #fff;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        width: 400px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 8px;
        outline: none;
        transition: border 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="number"]:focus {
        border: 1px solid #43cea2;
        box-shadow: 0 0 8px rgba(67, 206, 162, 0.4);
    }

    .btn-submit {
        width: 100%;
        padding: 12px;
        background: #43cea2;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    .btn-submit:hover {
        background: #2ebf91;
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }
</style>
</head>
<body>
<div class="form-container">
    <h2>➕ Add Product</h2>
    <form action="add_Product" method="post">
        <label for="pid">Product ID</label>
        <input type="text" id="pid" name="pid" required>

        <label for="pname">Product Name</label>
        <input type="text" id="pname" name="pname" required>

        <label for="price">Product Price</label>
        <input type="text" id="price" name="price" required>

        <label for="qty">Product Quantity</label>
        <input type="number" id="qty" name="qty" required>

        <button type="submit" class="btn-submit">Add Product</button>
    </form>
</div>
</body>
</html>
