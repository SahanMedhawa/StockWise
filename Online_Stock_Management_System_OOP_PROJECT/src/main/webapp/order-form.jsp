<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Purchase</title>
<!-- ======= Styles ====== -->

<style>

/*Supplier-list.css*/
.button1, .button2, .button3 {
	display: inline-flex;
	height: 40px;
	padding: 0px -10px;
	background: #009578;
	border: none;
	border-radius: 5px;
	overflow: hidden;
	font-family: 'Quicksand', sans-serif;
	font-size: 16px;
	font-weight: 500;
	cursor: pointer;
	margin: 10px 1px 30px 10px;
}

.button1 :hover {
	background: #008168;
}

.button1 :active {
	background: #006e58;
}

.button2 {
	background: #f11e0feb;
}

.button2 :hover {
	background: #e11c0eeb;
}

.button2 :active {
	background: #cf291deb;
}

.button3 {
	background: #209ee0;
}

.button3 :hover {
	background: #1d8bc7;
}

.button3 :active {
	background: #186894;
}

.button__text, .button__icon {
	display: inline-flex;
	align-items: center;
	padding: 0 24px;
	color: #fff;
	height: 100%;
}

.button__icon {
	font-size: 1.5em;
	background-color: rgb(0, 0, 0, 0.08);
}

.container2 {
	position: relative;
	display: flex;
	flex-direction: column;
}

.box {
	position: relative;
	min-height: 500px;
	background: var(--white);
	padding: 20px;
	margin: 20px;
	margin-top: 10px;
	box-shadow: 0 7px 25px rgba(0, 0, 0, 0.12);
	border-radius: 20px;
}

h2 {
	font-weight: 600;
	font-size: 28px;
	color: var(--blue);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5;
}

th {
	background-color: #f2f2f2;
	color: #333;
}

/* CSS for the popup form */
.modal {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal-content {
	background-color: #fefefe;
	padding: 20px;
	border: 1px solid #888;
	width: 25%;
	border-radius: 16px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.close  a {
	text-decoration: none;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-top: 10px;
}

input[type="text"], input[type="email"], input[type="tel"] {
	margin-bottom: 10px;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

#dFieldset {
	margin-top: 10px;
}

.navigation ul li a .icon {
	top: 15px;
}

/*dashboard.css*/
/* =========== Google Fonts ============ */
@import
	url("https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap")
	;

/* =============== Globals ============== */
* {
	font-family: "Ubuntu", sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

:root {
	--blue: #2a2185;
	--white: #fff;
	--gray: #f5f5f5;
	--black1: #222;
	--black2: #999;
}

body {
	min-height: 100vh;
	overflow-x: hidden;
}

.container {
	position: relative;
	width: 100%;
}

/* =============== Navigation ================ */
.navigation {
	position: fixed;
	width: 280px;
	height: 100%;
	background: var(--blue);
	border-left: 10px solid var(--blue);
	transition: 0.5s;
	overflow: hidden;
}

.navigation.active {
	width: 80px;
}

.navigation ul {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
}

.navigation ul li {
	position: relative;
	width: 100%;
	list-style: none;
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
}

.navigation ul li:hover, .navigation ul li.hovered {
	background-color: var(--white);
}

.navigation ul li:nth-child(1) {
	margin-bottom: 40px;
	pointer-events: none;
}

.navigation ul li a {
	position: relative;
	display: block;
	width: 100%;
	display: flex;
	text-decoration: none;
	color: var(--white);
}

.navigation ul li:hover a, .navigation ul li.hovered a {
	color: var(--blue);
}

.navigation ul li a .icon {
	position: relative;
	display: block;
	min-width: 60px;
	height: 60px;
	line-height: 75px;
	text-align: center;
}

.navigation ul li a .icon ion-icon {
	font-size: 1.75rem;
}

.navigation ul li a .title {
	position: relative;
	display: block;
	padding: 0 10px;
	height: 60px;
	line-height: 60px;
	text-align: start;
	white-space: nowrap;
}

/* --------- curve outside ---------- */
.navigation ul li:hover a::before, .navigation ul li.hovered a::before {
	content: "";
	position: absolute;
	right: 0;
	top: -50px;
	width: 50px;
	height: 50px;
	background-color: transparent;
	border-radius: 50%;
	box-shadow: 35px 35px 0 10px var(--white);
	pointer-events: none;
}

.navigation ul li:hover a::after, .navigation ul li.hovered a::after {
	content: "";
	position: absolute;
	right: 0;
	bottom: -50px;
	width: 50px;
	height: 50px;
	background-color: transparent;
	border-radius: 50%;
	box-shadow: 35px -35px 0 10px var(--white);
	pointer-events: none;
}

/* ===================== Main ===================== */
.main {
	position: absolute;
	width: calc(100% - 300px);
	left: 300px;
	min-height: 100vh;
	background: var(--white);
	transition: 0.5s;
}

.main.active {
	width: calc(100% - 80px);
	left: 80px;
}

.topbar {
	width: 100%;
	height: 60px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 10px;
}

.toggle {
	position: relative;
	width: 60px;
	height: 60px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 2.5rem;
	cursor: pointer;
}

.search {
	position: relative;
	width: 400px;
	margin: 0 10px;
}

.search label {
	position: relative;
	width: 100%;
}

.search label input {
	width: 100%;
	height: 40px;
	border-radius: 40px;
	padding: 5px 20px;
	padding-left: 35px;
	font-size: 18px;
	outline: none;
	border: 1px solid var(--black2);
}

.search label ion-icon {
	position: absolute;
	top: 0;
	left: 10px;
	font-size: 1.2rem;
}

.user {
	position: relative;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	overflow: hidden;
	cursor: pointer;
}

.user img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* ======================= Cards ====================== */
.cardBox {
	position: relative;
	width: 100%;
	padding: 20px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 30px;
}

.cardBox .card {
	position: relative;
	background: var(--white);
	padding: 30px;
	border-radius: 20px;
	display: flex;
	justify-content: space-between;
	cursor: pointer;
	box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
}

.cardBox .card .numbers {
	position: relative;
	font-weight: 500;
	font-size: 2.5rem;
	color: var(--blue);
}

.cardBox .card .cardName {
	color: var(--black2);
	font-size: 1.1rem;
	margin-top: 5px;
}

.cardBox .card .iconBx {
	font-size: 3.5rem;
	color: var(--black2);
}

.cardBox .card:hover {
	background: var(--blue);
}

.cardBox .card:hover .numbers, .cardBox .card:hover .cardName, .cardBox .card:hover .iconBx
	{
	color: var(--white);
}

.form-group {
	border: none;
}

#submit_btn {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: fit-content;
}

/* ================== Order Details List ============== */
.details {
	position: relative;
	width: 100%;
	padding: 20px;
	display: grid;
	grid-template-columns: 2fr 1fr;
	grid-gap: 30px;
	/* margin-top: 10px; */
}

.details .recentOrders {
	position: relative;
	display: grid;
	min-height: 500px;
	background: var(--white);
	padding: 20px;
	box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
	border-radius: 20px;
}

.details .cardHeader {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
}

.cardHeader h2 {
	font-weight: 600;
	color: var(--blue);
}

.cardHeader .btn {
	position: relative;
	padding: 5px 10px;
	background: var(--blue);
	text-decoration: none;
	color: var(--white);
	border-radius: 6px;
}

.details table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

.details table thead td {
	font-weight: 600;
}

.details .recentOrders table tr {
	color: var(--black1);
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

.details .recentOrders table tr:last-child {
	border-bottom: none;
}

.details .recentOrders table tbody tr:hover {
	background: var(--blue);
	color: var(--white);
}

.details .recentOrders table tr td {
	padding: 10px;
}

.details .recentOrders table tr td:last-child {
	text-align: end;
}

.details .recentOrders table tr td:nth-child(2) {
	text-align: end;
}

.details .recentOrders table tr td:nth-child(3) {
	text-align: center;
}

.status.delivered {
	padding: 2px 4px;
	background: #8de02c;
	color: var(--white);
	border-radius: 4px;
	font-size: 14px;
	font-weight: 500;
}

.status.pending {
	padding: 2px 4px;
	background: #e9b10a;
	color: var(--white);
	border-radius: 4px;
	font-size: 14px;
	font-weight: 500;
}

.status.return {
	padding: 2px 4px;
	background: #f00;
	color: var(--white);
	border-radius: 4px;
	font-size: 14px;
	font-weight: 500;
}

.status.inProgress {
	padding: 2px 4px;
	background: #1795ce;
	color: var(--white);
	border-radius: 4px;
	font-size: 14px;
	font-weight: 500;
}

.recentCustomers {
	position: relative;
	display: grid;
	min-height: 500px;
	padding: 20px;
	background: var(--white);
	box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
	border-radius: 20px;
}

.recentCustomers .imgBx {
	position: relative;
	width: 40px;
	height: 40px;
	border-radius: 50px;
	overflow: hidden;
}

.recentCustomers .imgBx img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.recentCustomers table tr td {
	padding: 12px 10px;
}

.recentCustomers table tr td h4 {
	font-size: 16px;
	font-weight: 500;
	line-height: 1.2rem;
}

.recentCustomers table tr td h4 span {
	font-size: 14px;
	color: var(--black2);
}

.recentCustomers table tr:hover {
	background: var(--blue);
	color: var(--white);
}

.recentCustomers table tr:hover td h4 span {
	color: var(--white);
}

/* ====================== Responsive Design ========================== */
@media ( max-width : 991px) {
	.navigation {
		left: -300px;
	}
	.navigation.active {
		width: 300px;
		left: 0;
	}
	.main {
		width: 100%;
		left: 0;
	}
	.main.active {
		left: 300px;
	}
	.cardBox {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 768px) {
	.details {
		grid-template-columns: 1fr;
	}
	.recentOrders {
		overflow-x: auto;
	}
	.status.inProgress {
		white-space: nowrap;
	}
}

@media ( max-width : 480px) {
	.cardBox {
		grid-template-columns: repeat(1, 1fr);
	}
	.cardHeader h2 {
		font-size: 20px;
	}
	.user {
		min-width: 40px;
	}
	.navigation {
		width: 100%;
		left: -100%;
		z-index: 1000;
	}
	.navigation.active {
		width: 100%;
		left: 0;
	}
	.toggle {
		z-index: 10001;
	}
	.main.active .toggle {
		color: #fff;
		position: fixed;
		right: 0;
		left: initial;
	}
}
</style>
</head>

<body>
	<!--Link Navigation Bar-->
	<%@include file="navbar.jsp"%>

	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span class="close"><a href="order-list">&times;</a></span>
						<form action="${order != null ? 'updateOrder' : 'insertOrder'} "
							method="post">
							<caption>
								<h2>${order != null ? 'Edit Order' : 'Add New Order'}</h2>
							</caption>

							<c:if test="${order != null}">
								<input type="hidden" name="id"
									value="<c:out value='${order.id}' />" />
							</c:if>

							<fieldset class="form-group" style="margin-top: 20px;">
								<label for="purchase">Product</label> <br> 
									<select name="purchase">
										<c:forEach var="purchase" items="${listPurchase}">
								        <option value="${purchase.products}" ><c:out value="${purchase.products} : ${purchase.supplier}" /></option>
								       </c:forEach>
									</select>

							</fieldset>

							<br>
							<fieldset class="form-group" id="dFieldset">
								<label for="qty">Quantity</label> <br> <input type="number"
									value="<c:out value='${order.qty}' />" id="qty" name="qty" required>
							</fieldset>

							<%String todayDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());%>
							<fieldset class="form-group" id="dFieldset">
								<label for="date">Date</label> <br> <input type="date"
									value="<c:out value='${order.date}' />" id="date"
									name="date" required min="<%=todayDate%>">
							</fieldset>
							
							<fieldset class="form-group">
								<br>
							</fieldset>
		
							<button type="submit" id="submit_btn">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>