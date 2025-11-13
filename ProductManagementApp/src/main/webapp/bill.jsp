<%@page import="com.product.bean.BuyProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Buy Product - Review</title>
  <style>
    :root{
      --bg: #f5f7fb;
      --card: #ffffff;
      --primary: #3b82f6;
      --muted: #6b7280;
      --accent: #eef2ff;
    }
    *{box-sizing:border-box}
    body{
      margin:0; font-family: Inter, system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial;
      background: linear-gradient(135deg,var(--accent),var(--bg));
      color:#111827; -webkit-font-smoothing:antialiased; -moz-osx-font-smoothing:grayscale;
      min-height:100vh; display:flex; align-items:center; justify-content:center; padding:32px;
    }
    .card{
      width:100%; max-width:760px; background:var(--card); border-radius:12px; box-shadow:0 8px 30px rgba(16,24,40,0.08);
      padding:28px; display:grid; grid-template-columns: 1fr 320px; gap:24px; align-items:start;
    }
    .header{
      grid-column:1/-1; display:flex; justify-content:space-between; align-items:center; margin-bottom:6px;
    }
    .title{font-size:20px; font-weight:600}
    .subtitle{font-size:13px; color:var(--muted)}
    form{display:flex; flex-direction:column; gap:18px}
    .group{display:flex; flex-wrap:wrap; gap:12px}
    label{display:block; font-size:13px; color:var(--muted); margin-bottom:6px}
    .field{flex:1 1 220px}
    input[type="text"], input[type="number"]{
      width:100%; padding:10px 12px; border-radius:8px; border:1px solid #e6e9ef; background:#fafbff; font-size:14px;
    }
    input[readonly]{background:#f3f4f6; color:#111827; border:1px dashed #e5e7eb}
    .right-card{background:linear-gradient(180deg,#fbfbff,#ffffff); border-radius:10px; padding:18px; height:100%; box-shadow:inset 0 1px 0 rgba(255,255,255,0.6)}
    .summary-row{display:flex; justify-content:space-between; margin:10px 0; font-size:14px}
    .total{font-weight:700; font-size:18px}
    .actions{display:flex; gap:12px; margin-top:14px}
    .btn{display:inline-block; text-decoration:none; padding:10px 14px; border-radius:8px; font-weight:600; cursor:pointer; border:none}
    .btn-primary{background:var(--primary); color:white}
    .btn-ghost{background:transparent; border:1px solid #e6e9ef; color:var(--muted)}
    .note{font-size:12px; color:var(--muted)}
    @media (max-width:860px){
      .card{grid-template-columns:1fr;}
      .right-card{order: -1}
    }
  </style>
</head>
<body>
<%
    BuyProductBean pb= (BuyProductBean)request.getAttribute("pbean");
%>
<div class="card">
  <div class="header">
    <div>
      <div class="title">Confirm Purchase</div>
      <div class="subtitle">Review the product details below before proceeding to payment.</div>
    </div>
    <div class="note">Order preview — fields are read-only to prevent accidental changes.</div>
  </div>

  <form action="bill_servlet" method="post" autocomplete="off">
    <div class="group">
      <div class="field">
        <label for="pid">Product ID</label>
        <input type="text" id="pid" name="pid" value="<%=pb.getpId()%>" readonly />
      </div>

      <div class="field">
        <label for="pname">Product Name</label>
        <input type="text" id="pname" name="pname" value="<%=pb.getName()%>" readonly />
      </div>

      <div class="field">
        <label for="price">Price (₹)</label>
        <input type="text" id="price" name="price" value="<%=pb.getPrice()%>" readonly />
      </div>

      <div class="field">
        <label for="rqty">Required Quantity</label>
        <input type="number" id="rqty" name="rqty" value="<%=pb.getRqty()%>" readonly />
      </div>

      <div class="field">
        <label for="amount">Total Amount (₹)</label>
        <input type="text" id="amount" name="amount" value="<%=pb.getTotalAmount()%>" readonly />
      </div>
    </div>

    <!-- Hidden fallback in case you want server-only values (optional) -->
    <!-- <input type="hidden" name="productCode" value="<%=pb.getpId()%>" /> -->

    <div class="actions">
      <button type="submit" class="btn btn-primary">Proceed to Payment</button>
      <a class="btn btn-ghost" href="buyProduct.jsp">Back</a>
    </div>
  </form>

  <aside class="right-card">
    <h3 style="margin:0 0 8px 0">Order Summary</h3>
    <div class="summary-row"><span>Product</span><span><%=pb.getName()%></span></div>
    <div class="summary-row"><span>Unit Price</span><span>₹ <%=pb.getPrice()%></span></div>
    <div class="summary-row"><span>Quantity</span><span><%=pb.getRqty()%></span></div>
    <hr style="border:none;border-top:1px solid #eef2f7;margin:12px 0">
    <div class="summary-row total"><span>Total</span><span>₹ <%=pb.getTotalAmount()%></span></div>
    <p class="note" style="margin-top:12px">If you need to change quantity, click Back and update your selection.</p>
  </aside>
</div>

</body>
</html>
