<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="icon" href="img/icon.jpeg" type="img/icon.jpeg">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<%@include file="components/cdn.jsp"%>
<style>
#captcha {
    font-family: Tahoma, Geneva, sans-serif;
    font-size: 24px;
    color: #000;
    font-weight: bold;
    letter-spacing: 2px;
    background-color: white;
    border: 1px solid #ccc;
    padding: 5px;
    display: inline-block;
    text-align: center;
    border: 1px solid #00FFFF;
    border-radius: 10px;
}

label {
    font-weight: bold;
    color: purple;
}
.input-group-text {
    background: none;
    border: none;
}
</style>

</head>
<body style="background-color: #f0f1f2">
    <%@include file="components/navbar.jsp"%>

    <br />
    <div class="container pt-2">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-5">
                <div class="card" style="background-color: #F0F8FF; border: 1px solid #00FFFF; border-radius: 20px">
                    <div class="card-body">
                        <h4 class="text-center mt-1">Login Form</h4>
                        <hr>
                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label> 
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" required="required" value="${mail}" name="mail">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="password">
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="togglePassword" style="cursor: pointer;"> <i class="fa fa-eye"></i> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputCaptcha">Captcha <i class="fas fa-shield-alt"></i></label> 
                                <input type="text" class="form-control" id="cap" required="required" readonly="readonly" style="font-weight: bold; text-align: center" name="cap1">
                                <i class="fa-solid fa-arrows-rotate" onclick="generateCaptcha()" style="cursor: pointer;"></i>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputCaptcha">Enter Captcha</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="exampleInputCaptcha" placeholder="Enter Captcha" required="required" name="cap2" onpaste="return false;">
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="toggleCaptcha" style="cursor: pointer;"> <i class="fa fa-eye"></i> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success">Login</button>
                                <br /> <a href="register.jsp" style="color: red">Don't Have Account?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <%@include file="components/footer.jsp"%>

    <script>
        function generateCaptcha() {
            const characters = 'ABCDEFGHJKLMNOPQRSTUVWXYZ0123456789';
            let captchaCode = '';
            for (let i = 0; i < 6; i++) {
                const randomIndex = Math.floor(Math.random() * characters.length);
                captchaCode += characters.charAt(randomIndex);
            }
            document.getElementById('cap').value = captchaCode;
        }

        window.onload = function() {
            generateCaptcha();
            const status = getUrlParameter('status');
            if (status === '2') {
                showToast("Invalid Captcha !! Please Try Again");
            }
            if (status === '3') {
                showToast("Invalid Username Or Password Please Try Again");
            }
        };

        document.getElementById('togglePassword').addEventListener('click', function () {
            const passwordInput = document.getElementById('exampleInputPassword1');
            const icon = this.querySelector('i');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });

        document.getElementById('toggleCaptcha').addEventListener('click', function () {
            const captchaInput = document.getElementById('exampleInputCaptcha');
            const icon = this.querySelector('i');
            if (captchaInput.type === 'password') {
                captchaInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                captchaInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });

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

        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            const regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            const results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        }
        
      
    </script>

</body>
</html>
