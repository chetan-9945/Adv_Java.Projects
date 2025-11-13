<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.product.bean.ProductBean,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    table { width: 80%; border-collapse: collapse; margin: auto; }
    th, td { padding: 10px; text-align: center; border: 1px solid #ccc; }
    th { background-color: #f2f2f2; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    .btn {
        padding: 6px 12px;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
    }
    .edit-btn { background-color: #4CAF50; color: white; }
    .delete-btn { background-color: #f44336; color: white; }
</style>
</head>
<body>
    <h2 style="text-align:center;">Product List</h2>

    <%
        List<ProductBean> list = (List<ProductBean>) request.getAttribute("products");
        if (list != null && !list.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        <%
            for (ProductBean pb : list) {
        %>
        <tr>
        
            <td><%= pb.getpId() %></td>
            <td><%= pb.getpName() %></td>
            <td><%= pb.getPrice() %></td>
            <td><%= pb.getQty() %></td>
            <td>
                <a href="buyservlet?id=<%= pb.getpId() %>" class="btn edit-btn">Buy</a>
                
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
    %>
        <p style="text-align:center; color:red;">No products found!</p>
    <%
        }
    %>
    <a href="logout">LogOut</a>
</body>
</html>
