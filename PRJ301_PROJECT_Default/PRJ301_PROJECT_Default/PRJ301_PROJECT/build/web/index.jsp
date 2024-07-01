<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" href="img/3514407.png" type="image/x-icon">
        <title>SUPER MARKET</title>

        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
        <!-- Css Styles -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Humberger Begin -->
        <div class="humberger__menu__overlay"></div>
        <div class="humberger__menu__wrapper">
            <div class="humberger__menu__logo">
                <a href="Home"><img src="img/supermarket-shopping-cart-logo-02D26535D8-seeklogo.com.png" alt=""></a>
            </div>
            <div class="humberger__menu__cart">
                <ul>
                    <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                </ul>

            </div>
            <div class="humberger__menu__widget">
                <div class="header__top__right__auth">
                    <a href="#"><i class="fa fa-user"></i> Login</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                <ul>
                    <li class="active"><a href="Home">Home</a></li>
                    <li><a href="./shop-grid.html">Page</a></li>
                    <li><a href="#">Shop</a>
                        <ul class="header__menu__dropdown">
                            <li><a href="./shop-details.html">Shop Details</a></li>
                            <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                            <li><a href="./checkout.html">Check Out</a></li>
                            <li><a href="./blog-details.html">Blog Details</a></li>
                        </ul>
                    </li>
                    <li><a href="./blog.html">Blog</a></li>
                    <li><a href="./contact.html">Contact</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
        </div>
        <!-- Humberger End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <c:if test="${sessionScope.acc == null}">
                                    <div class="header__top__right__auth">
                                        <a href="Login"><i class="fa fa-user"></i> Login</a>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.acc != null}">
                                    <div class="header__top__right__auth">
                                        <ul class="nav navbar-nav ml-auto">
                                            <!-- Dropdown -->
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbardrop"
                                                   data-toggle="dropdown"><i class="fa fa-user"></i> ${sessionScope.acc.username}</a>
                                                <div class="dropdown-menu" style="margin-left:-50px;">
                                                    <a class="dropdown-item" href="/PRJ301_PROJECT/Admin/ManagerProduct"
                                                       style="display: ${user.isAdmin == 1 ? 'block' : 'none' };">Manager Product</a>
                                                       <a class="dropdown-item" href="/PRJ301_PROJECT/ChangePassword"
                                                       style="display: ${user.isAdmin == 1 ? 'block' : 'none' };">Change Password</a>
                                                       <a class="dropdown-item" href="/PRJ301_PROJECT/ChangePassword"
                                                       style="display: ${user.isAdmin == 0 ? 'block' : 'none' };">Change Password</a>
                                                    <a class="dropdown-item" href="Logout">Logout</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href="Home"><img src="img/supermarket-shopping-cart-logo-02D26535D8-seeklogo.com.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6" style="display: flex; align-items: center; justify-content: center;">
                        <div class="header__menu">
                            <nav class="header__menu">
                                <ul>
                                    <li class="active"><a href="Home">Home</a></li>
                                    <li><a href="./shop-grid.html">Page</a></li>
                                    <li><a href="#">Shop</a>
                                        <ul class="header__menu__dropdown">
                                            <li><a href="./shop-details.html">Shop Details</a></li>
                                            <li><a href="/PRJ301_PROJECT/Member/Cart" 
                                                   style="display: ${user.isAdmin == 0 ? 'block' : 'none' };">Shoping Cart</a></li>
                                            <li><a href="./checkout.html">Check Out</a></li>
                                            <li><a href="./blog-details.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="./blog.html">Blog</a></li>
                                    <li><a href="./contact.html">Contact</a></li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                    <c:choose>
                        <c:when test="${user.isAdmin == 1}"></c:when>
                        <c:otherwise>
                            <div class="col-lg-3">
                                <div class="header__cart">
                                    <div class="header__cart">
                                        <c:choose>
                                            <c:when test="${empty sessionScope.cart}">
                                                <c:set var="cartTotal" value="0" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="cartTotal" value="0" />
                                                <c:forEach items="${sessionScope.cart}" var="entry">
                                                    <c:set var="productTotal" value="${entry.value.product.sellprice * entry.value.productQuantity}" />
                                                    <c:set var="cartTotal" value="${cartTotal + productTotal}" />
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        <ul>
                                            <li><a href="/PRJ301_PROJECT/Member/Cart"><i class="fa fa-shopping-bag"></i></a></li>
                                        </ul>
                                        <div class="header__cart__price">item: <span><fmt:formatNumber value="${cartTotal}" pattern="0.00" /> VNÐ</span></div>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>All product</span>
                            </div>
                            <c:forEach items="${category}" var="c">
                                <ul>
                                    <li><a href="/PRJ301_PROJECT/Category?cid=${c.categoryID}">${c.categoryName}</a></li>
                                </ul>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="col-lg-9">
                        <!-- Search Bar start -->
                        <div class="search-bar">
                            <form action="Search" method="post">
                                <input name="txtsearch" type="text" placeholder="What do yo u need?">
                                <select name="searchID" class="form-select">
                                    <option class="${tag == 0?"active":""}" value="0">All categories</option>
                                    <c:forEach items="${category}" var="c">
                                        <option value="${c.categoryID}" ${tag == c.categoryID?"selected":""}>${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                                <input name='btnSearch' type="submit" class="site-btn" value='Search'>
                            </form>
                        </div>
                        <!-- Search Bar ends -->

                        <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                            <div class="hero__text">
                                <span>FRUIT FRESH</span>
                                <h2>Vegetable <br />100% Organic</h2>
                                <p>Free Pickup and Delivery Available</p>
                                <a href="Home" class="primary-btn">SHOP NOW</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Categories Section Begin -->
        <section class="categories">
            <div class="container">
                <div class="row">
                    <div class="categories__slider owl-carousel">
                        <c:forEach items="${category}" var="c">
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/${c.img_url}">
                                    <h5><a href="Category?cid=${c.categoryID}">${c.categoryName}</a></h5>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <!-- Categories Section End -->

        <!-- Featured Section Begin -->
        <section class="featured spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Featured Product</h2>
                        </div>
                        <div class="featured__controls">
                            <ul>
                                <li class="${tag == 0?"active":""}" data-filter="*">
                                    <a href="Category?cid=0" style="color: black;">All</a>
                                </li>
                                <c:forEach items="${category}" var="c">
                                    <li class="${tag == c.categoryID?"active":""}">
                                        <a href="Category?cid=${c.categoryID}" style="color: black;">${c.categoryName}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row featured__filter">
                    <c:choose>
                        <c:when test="${empty products}">
                            <p style="text-align: center;">Không có kết quả phù hợp.</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${products}" var="p">
                                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                                    <div class="featured__item">
                                        <div class="featured__item__pic set-bg" data-setbg="img/${p.image_url}">
                                            <ul class="featured__item__pic__hover">
                                                <!--<li><a href="#"><i class="fa fa-heart"></i></a></li>-->
                                                <!--<li><a href="#"><i class="fa fa-retweet"></i></a></li>-->
                                                <c:choose>
                                                    <c:when test="${user.isAdmin == 1}">
                                                        <li>
                                                            <a href="/PRJ301_PROJECT/Admin/Edit?type=0&pid=${p.productID}"
                                                               style="font-weight: 600;">Edit</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${p.stockQuantity == 0 }">
                                                                <li>
                                                                    <a>
                                                                        <i>Hết hàng</i>
                                                                    </a>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="it" value="${sessionScope.cart[p.productID]}" />
                                                                <c:choose>
                                                                    <c:when test="${it ne null and it.productQuantity ge p.stockQuantity}">
                                                                        <li>
                                                                            <a>
                                                                                <i>Hết hàng</i>
                                                                            </a>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li>
                                                                            <c:url value="/Member/AddToCart?pid=${p.productID}" var="addToCart"/>
                                                                            <a href="${addToCart}">
                                                                                <i class="fa fa-shopping-cart"></i>
                                                                            </a>
                                                                        </li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </div>
                                        <div class="featured__item__text">
                                            <h6><a href="Shopdetail?categoryid=${p.categoryID}&detailpid=${p.productID}">${p.productName}</a></h6>
                                            <h5>${p.sellprice}đ</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
        </section>
        <!-- Featured Section End -->

        <!-- Banner Begin -->
        <div class="banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <img src="img/banner/banner-1.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <img src="img/banner/banner-2.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner End -->

        <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="footer__about">
                        <div class="footer__about__logo col-md-6">
                            <a href="./index.html"><img src="img/supermarket-shopping-cart-logo-02D26535D8-seeklogo.com.png" alt=""></a>
                        </div>
                        <div class="footer__about__right col-md-6">
                            <ul>
                                <li>Address: Khu Giáo dục và Đào tạo Khu Công nghệ cao Hòa Lạc Km29, Đại lộ Thăng Long, Thạch Hoà, Thạch Thất, Hà Nội</li>
                                <li>Phone: 0975 489 030</li>
                                <li>Email: duynkhe170075@fpt.edu.vn</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var dropdownBtnText = document.getElementById("drop-text");
                var list = document.getElementById("list");
                var span = document.getElementById("span");
                var listItems = document.querySelectorAll(".dropdown-list-item");

                // Sự kiện khi nhấp vào "All categories"
                dropdownBtnText.addEventListener("click", function () {
                    list.style.display = "block"; // Hiển thị dropdown

                    // Ẩn các tùy chọn hiện tại
                    listItems.forEach(function (item) {
                        item.style.display = "none";
                    });

                    // Hiển thị tất cả tùy chọn của category
                    listItems.forEach(function (item) {
                        item.style.display = "block";
                    });
                });

                // Sự kiện khi chọn một mục trong dropdown
                listItems.forEach(function (item) {
                    item.addEventListener("click", function () {
                        span.textContent = item.textContent;
                        list.style.display = "none"; // Ẩn dropdown khi mục được chọn
                    });
                });
            });

        </script>
    </body>

</html>