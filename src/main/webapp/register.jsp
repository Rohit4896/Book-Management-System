<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="icon" href="img/icon.jpeg" type="img/icon.jpeg">
<%@include file="components/cdn.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<%@include file="components/cdn.jsp"%>
</head>
<body style="background-color: #f0f1f2">
    <%@include file="components/navbar.jsp"%>

    <div class="container pt-2">
        <div class="row">
            <div class="col-md-4 offset-md-4 col-lg-4 offset-lg-4 col-xl-4 offset-xl-4 col-sm-4 offset-sm-4">
                <div class="card" style="background-color: #F0F8FF; border: 1px solid #00FFFF; border-radius: 20px">
                    <div class="card-body">
                        <h4 class="text-center mt-1">Registration Form</h4>
                        <hr>
                        <form action="register" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" class="form-control" placeholder="Enter Full Name" required="required" name="name">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" placeholder="Enter email" required="required" name="email" id="email">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone No</label>
                                <input type="text" class="form-control" placeholder="Enter Phone No" required="required" name="phone" id="phone">
                            </div>
                            <div class="form-group">
                                <label for="question">Security Question</label>
                                <select class="form-control" required="required" name="question">
                                    <option>Where Are You From?</option>
                                    <option>What is Your Favorite Color?</option>
                                    <option>How Old You Are?</option>
                                    <option>What Is Your Favorite Food?</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="answer">Answer</label>
                                <input type="text" class="form-control" placeholder="Enter Answer" required="required" name="answer">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" placeholder="Password" required="required" name="password" id="password">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <br/>
    <%@include file="components/footer.jsp"%>

    <script>
    function validateForm() {
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const password = document.getElementById('password').value;

        // Email validation
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            showToast("Please enter a valid email address.");
            return false;
        }

        // Phone number validation
        const phonePattern = /^[0-9]{10}$/; // Assuming a 10-digit phone number
        if (!phonePattern.test(phone)) {
            showToast("Please enter a valid 10-digit phone number.");
            return false;
        }

        // Password validation
        const minLength = 8;
        const hasUpperCase = /[A-Z]/.test(password);
        const hasLowerCase = /[a-z]/.test(password);
        const hasNumber = /[0-9]/.test(password);
        const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

        if (password.length < minLength) {
            showToast("Password must be at least 8 characters long.");
            return false;
        }
        if (!hasUpperCase) {
            showToast("Password must contain at least one uppercase letter.");
            return false;
        }
        if (!hasLowerCase) {
            showToast("Password must contain at least one lowercase letter.");
            return false;
        }
        if (!hasNumber) {
            showToast("Password must contain at least one number.");
            return false;
        }
        if (!hasSpecialChar) {
            showToast("Password must contain at least one special character.");
            return false;
        }

       /*  // Form is valid
        showToast("Registration done Successfully!", "success");
        return true; */
    }

    function showToast(message, type = "error") {
        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "top", 
            position: "right",
            backgroundColor: type === "success" ? "green" : "red",
        }).showToast();
    }

    // Function to get URL parameters
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        const regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        const results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }

    // Check the status parameter on page load and show toast if needed
    window.onload = function() {
        const status = getUrlParameter('status');
        if (status === '2') {
            showToast("Something Went Wrong !! Please Try Again");
        }
        if (status === '3') {
            showToast("Username Existed . Please Try With Different Username");
        }
        if (status === '4') {
            showToast("Password Existed . Please Try With Different Password");
        }
        if (status === '5') {
            showToast("Phone No Existed . Please Try With Different Phone No");
        }

    };
    </script>
</body>
</html>
