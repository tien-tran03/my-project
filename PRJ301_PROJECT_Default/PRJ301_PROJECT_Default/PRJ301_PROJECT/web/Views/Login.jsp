<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/3514407.png" type="image/x-icon">
        <title>Login Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <style>
        body{
            background-color: #f0f0f0;
        }
        .panel-login {
            border-color: #ccc;
            -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
        }
        .panel-login>.panel-heading {
            color: #00415d;
            background-color: #fff;
            border-color: #fff;
            text-align:center;
        }
        .panel-login>.panel-heading a{
            text-decoration: none;
            color: #666;
            font-weight: bold;
            font-size: 15px;
            -webkit-transition: all 0.1s linear;
            -moz-transition: all 0.1s linear;
            transition: all 0.1s linear;
        }
        .panel-login>.panel-heading a.active{
            color: #029f5b;
            font-size: 18px;
        }
        .panel-login>.panel-heading hr{
            margin-top: 10px;
            margin-bottom: 0px;
            clear: both;
            border: 0;
            height: 1px;
            background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
            background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
        }
        .panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
            height: 45px;
            border: 1px solid #ddd;
            font-size: 16px;
            -webkit-transition: all 0.1s linear;
            -moz-transition: all 0.1s linear;
            transition: all 0.1s linear;
        }
        .panel-login input:hover,
        .panel-login input:focus {
            outline:none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            border-color: #ccc;
        }
        .btn-login {
            background-color: #59B2E0;
            outline: none;
            color: #fff;
            font-size: 14px;
            height: auto;
            font-weight: normal;
            padding: 14px 0;
            text-transform: uppercase;
            border-color: #59B2E6;
        }
        .btn-login:hover,
        .btn-login:focus {
            color: #fff;
            background-color: #53A3CD;
            border-color: #53A3CD;
        }
        .forgot-password {
            text-decoration: underline;
            color: #888;
        }
        .forgot-password:hover,
        .forgot-password:focus {
            text-decoration: underline;
            color: #666;
        }

        .btn-register {
            background-color: #1CB94E;
            outline: none;
            color: #fff;
            font-size: 14px;
            height: auto;
            font-weight: normal;
            padding: 14px 0;
            text-transform: uppercase;
            border-color: #1CB94A;
        }
        .btn-register:hover,
        .btn-register:focus {
            color: #fff;
            background-color: #1CA347;
            border-color: #1CA347;
        }

        .header__top__left {
            display: flex;
            justify-content: flex-start;
            padding: 10px 0 13px;
        }

        .header__top__left__back-button {
            text-align: left;
            text-decoration: none;
            color: #000;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .header__top__left__back-button:hover {
            background-color: #f0f0f0;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
    <body>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>
        <div class="container">
            <div class="row">

                <div class="header__top__left">
                    <a href="/PRJ301_PROJECT/Home" class="header__top__left__back-button">
                        <i class="fa fa-home"></i> Back Home
                    </a>
                </div>

                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="active" id="login-form-link" required>Login</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="#" id="register-form-link" required>Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <span style="color: red">${sessionScope.success}</span>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="Login" method="post" role="form" style="display: block;">
                                        <p class="text-danger">${error1}</p>
                                        <div class="form-group">
                                            <input type="text" name="user" id="user" tabindex="1" class="form-control" placeholder="Username" value="${cookie.cuser.value}"required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pass" id="pass" tabindex="2" class="form-control" placeholder="Password" value="${cookie.cpass.value}" required>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Remember -->
                                        
                                        <div class="w-50 text-left" style="text-align: center">
                                            <input type="checkbox" value="ON" name="remember">
                                            <label class="checkbox-wrap checkbox-primary mb-0" >Remember Me
                           
                                                </label>
                                            </div>
                                        
                                        
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <c:choose>
                                                            <c:when test="${tag == 1}">
                                                                <a href="Active?u=${user}" tabindex="5" class="forgot-password">Activate Account</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="register-form" action="Signup" method="post" role="form" style="display: none;">
                                        <p class="text-danger">${error2}</p>
                                        <div class="form-group">
                                            <input type="text" name="fname" id="username" tabindex="1" class="form-control" placeholder="First Name" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="lname" id="username" tabindex="1" class="form-control" placeholder="Last Name" value="">
                                            
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="phonenumber" id="phonenumber" tabindex="2" class="form-control" placeholder="PhoneNumber" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="user" id="username" tabindex="1" class="form-control" placeholder="Username" value="" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pass" id="password" tabindex="2" class="form-control" placeholder="Password" required>
                                        </div>
                                         
                                        <div class="form-group">
                                            <input type="password" name="confirm" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
                                        </div>
                                        <div class="alert-danger" role="alert">

                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        $(function () {
            $('#login-form-link').click(function (e) {
                $("#login-form").delay(100).fadeIn(100);
                $("#register-form").fadeOut(100);
                $('#register-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });
            $('#register-form-link').click(function (e) {
                $("#register-form").delay(100).fadeIn(100);
                $("#login-form").fadeOut(100);
                $('#login-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });
        });
    </script>
</html>