<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Supplier</title>
    <!-- ======= Styles ====== -->

    <style>
    
     
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

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
.close  a 
{
	text-decoration:none;
}

form {
    display:flex;
    flex-direction: column;
}

label {
    margin-top: 10px;
}

input[type="text"],
input[type="email"],
input[type="tel"] {
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

.navigation ul li a .icon {
	top: 15px;
}
h2 {
	font-weight: 600;
	font-size: 28px;
	color: var(--blue);
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
.cardBox .card:hover .numbers,
.cardBox .card:hover .cardName,
.cardBox .card:hover .iconBx {
  color: var(--white);
}


.form-group
{
	border: none;

}

#submit_btn{
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: fit-content;
    }

    </style>
</head>

<body>
    <!--Link Navigation Bar-->
	<%@include file="navbar.jsp" %>
	
    <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                    <div class="modal">
        			<div class="modal-content">
             <span class="close" ><a href="supplier-list">&times;</a></span>
             
             
                        <form action="${supplier != null ? 'updateSupplier' : 'insertSupplier'}" method="post"  onsubmit="return validateForm()">
                            <caption>
                                <h2>${supplier != null ? 'Edit Supplier' : 'Add New Supplier'}</h2>
                            </caption>
                        <c:if test="${supplier != null}">
                            <input type="hidden" name="id" value="<c:out value='${supplier.id}' />" />
                        </c:if>

                        <fieldset class="form-group" style="margin-top: 20px;">
                            <label for="name">Name</label> 
                            <br>
                            <input type="text" placeholder="supplier name" value="<c:out value='${supplier.name}' />" id="name" name="name" required="required">
                        </fieldset>
                        
						<fieldset class="form-group">
                            <label for="address">Address</label> 
                            <br>
                            <input type="text" placeholder="address" value="<c:out value='${supplier.address}' />" id="address" name="address" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label for="email">Email</label> 
                            <br>
                            <input type="text" placeholder="ex: myname@example.com" value="<c:out value='${supplier.email}' />" id="email" name="email" required >
                        </fieldset>

                        <fieldset class="form-group">
                            <label for="phone">Contact</label> 
                            <br>
                            <input type="tel" placeholder="0xx xxxxxxx" value="<c:out value='${supplier.phone}' />" id="phone" name="phone"  pattern="0\d{9}" 
         					  title="Enter a valid 10-digit phone number starting with 0" required>
                        </fieldset>

											<script>
											//Email Validation
											function validateForm() {
											    const emailField = document.getElementById("email");
											    const email = emailField.value;
											
											    // Simple regex to validate email format
											    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
											
											    if (!emailPattern.test(email)) {
											        alert("Please enter a valid email address.\n(e.g., user@example.com)");
											        emailField.focus();
											        return false; // Prevent form submission
											    }
											
											    return true; // Allow form submission
											}
											</script>
											
                        <button type="submit" id="submit_btn">Submit</button>
                        </form>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>