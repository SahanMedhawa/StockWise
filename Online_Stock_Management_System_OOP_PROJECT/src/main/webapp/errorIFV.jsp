<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error!</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    text-align: center;
  }
  .error-container {
    margin-top: 50px;
  }
  .error-heading {
    font-size: 24px;
    color: #e53935; /* Red color for error */
    margin-bottom: 20px;
  }
  .error-message {
    font-size: 18px;
    color: #333;
  }
</style>
</head>
<body>
  <!-- Include Navigation Bar -->
  <%@include file="navbar.jsp"%>
  
  <div class="error-container">
    <h1 class="error-heading">Invalid Field Value</h1>
    <p class="error-message">Please enter a valid value for the field.</p>
  </div>
</body>
</html>
