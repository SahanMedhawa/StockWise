<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>

</head>

<body>
	<!--Link Navigation Bar-->
	<%@include file="navbar.jsp"%>
	<br>
	<!-- ======================= Cards ================== -->
	<div class="cardBox">
		<a href="#" style="text-decoration: none;">
			<div class="card">
				<div>
					<div class="numbers">92</div>
					<div class="cardName">Total Purchases</div>
				</div>

				<div class="iconBx">
					<ion-icon name="trending-down-outline"></ion-icon>
				</div>
			</div>
		</a> <a href="Product-list" style="text-decoration: none;">
			<div class="card">
				<div>
					<div class="numbers">68</div>
					<div class="cardName">Total Orders</div>
				</div>

				<div class="iconBx">
					<ion-icon name="trending-up-outline"></ion-icon>
				</div>
			</div>
		</a> <a href="#" style="text-decoration: none;">
			<div class="card">
				<div>
					<div class="numbers">284</div>
					<div class="cardName">Product Reorders</div>
				</div>

				<div class="iconBx">
					<ion-icon name="layers-outline"></ion-icon>
				</div>
			</div>
		</a> <a href="#" style="text-decoration: none;">
			<div class="card">
				<div>
					<div class="numbers">13</div>
					<div class="cardName">Admin Comments</div>
				</div>

				<div class="iconBx">
					<ion-icon name="chatbubble-outline"></ion-icon>
				</div>
			</div>
		</a>
	</div>
	<br><br><br>
	<div style="display:flex;">
    <div class="appBox">
        <p><u>Make a Purchase</u></p>
        <div class="iconBxDash">
			<ion-icon name="trending-down-outline"></ion-icon>
		</div><br>
        <a href="purchase-list"><button type="button" class="buttonDash">Proceed to Purchase</button></a><br><br>
        <a href="dashboard-view">Details</a> <br>
    </div>
    <div class="resBox">
        <p><u>Make an Order</u></p>
         <div class="iconBxDash">
			<ion-icon name="trending-up-outline"></ion-icon>
		</div><br>
        <a href="order-list"><button type="button" class="buttonDash">Proceed to Order</button></a><br><br>
        <a href="dashboard-view">Details</a> <br>
    </div>
</div>




</body>
</html>