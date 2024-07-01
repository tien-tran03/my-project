
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Super market</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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
                <a href="#"><img src="img/logo.png" alt=""></a>
            </div>
            <div class="humberger__menu__cart">
                <div class="header__cart__price">item: <span>$150.00</span></div>
            </div>
            <div class="humberger__menu__widget">
                <div class="header__top__right__language">
                    <img src="img/language.png" alt="">
                    <div>English</div>
                    <span class="arrow_carrot-down"></span>
                    <ul>
                        <li><a href="#">Spanis</a></li>
                        <li><a href="#">English</a></li>
                    </ul>
                </div>
                <div class="header__top__right__auth">
                    <a href="#"><i class="fa fa-user"></i> Login</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                <ul>
                    <li class="active"><a href="./index.html">Home</a></li>
                    <li><a href="./shop-grid.html">Shop</a></li>
                    <li><a href="#">Pages</a>
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
            <div class="header__top__right__social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-pinterest-p"></i></a>
            </div>
            <div class="humberger__menu__contact">
                <ul>
                    <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                    <li>Free Shipping for all Order of $99</li>
                </ul>
            </div>
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
                                    <a href="/PRJ301_PROJECT/Login"><i class="fa fa-user"></i> Login</a>
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
<!--                                                <a class="dropdown-item" href="#">My Profile</a>
                                                <a class="dropdown-item" href="#">Change Password</a>-->
                                                <a class="dropdown-item" href="../Logout">Logout</a>
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
                    <div class="col-lg-6">
                        <div class="header__menu">
                            <nav class="header__menu">
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
                        </div>

                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart">
                            <div class="header__cart">
                                <ul>
                                    <li><a href="/PRJ301_PROJECT/Member/Cart"><i class="fa fa-shopping-bag"></i> </a></li>
                                </ul>
                                
                            </div>
                        </div>
                    </div>
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
                                    <li><a href="Category?cid=${c.categoryID}">${c.categoryName}</a></li>
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
                                <a href="#" class="primary-btn">SHOP NOW</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="${tag == 0?"active":""}" data-filter="*"><a href="Category?cid=0" style="color: black;">All</a></li>
                                <c:forEach items="${category}" var="c">
                                <li class="${tag == c.categoryID?"active":""}"><a href="Category?cid=${c.categoryID}" style="color: black;">${c.categoryName}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>

                                
                                
                                   
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                 src="img/${p.image_url}" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${p.productName}</h3>
                        <div class="product__details__price">${p.price}VNÐ</div>
                        <c:choose>
                            <c:when test="${user.isAdmin == 1}">
                                <li>
                                    <a href="/PRJ301_PROJECT/Admin/Edit?type=0&pid=${p.productID}" class="primary-btn" style="font-weight: 600;">Edit</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <div class="product__details__quantity">
                                    <div class="quantity">
                                            <div class="pro-qty">
                                            <input type="text" value="1">
                                           
                                        </div>
                                        <!-- <span style="color: red ">Hết hàng!</span> -->    
                                    </div>
                                </div>
                                <c:url value="/Member/AddToCart?pid=${p.productID}" var="addToCart"/>
                                
                                <c:if test="${p.stockQuantity>0}">
                                    <a href="${addToCart}" class="primary-btn">ADD TO CART</a>
                                </c:if>
                                    

                                     
                            </c:otherwise>
                        </c:choose>
                                     <c:if test="${p.stockQuantity>0}">
                                         <ul>
                                    
                                    <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>${p.quantity} kg</span></li>
                               
                                
                           
                            
                        </ul>
                           </c:if>
                                      <c:if test="${p.stockQuantity==0}">
                                         <ul>
                                    
                                             <li><b>Availability</b> <span style="color: red">Unavalable</span></li>
                            
                            <li><b>Weight</b> <span style="color: red">No Update</span></li>
                               
                                
                           
                            
                        </ul>
                           </c:if>
                            
                                               

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <c:forEach items="${pcateid}" var="p">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/${p.image_url}">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="Shopdetail?categoryid=${p.categoryID}&detailpid=${p.productID}">${p.productName}</a></h6>
                                <h5>${p.price}</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

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
                            <li>Address: Khu Giáo dục và Đào tạo Khu Công nghệ cao Hòa Lạc Km29, Đại lộ Thăng Long, Thạch Hoà, Thạch Thất, Hà Nội 13100</li>
                            <li>Phone: 024 7300 1866</li>
                            <li>Email: tuyensinhfpt@gmail.com</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(document).ready(function () {
            // Lấy các phần tử DOM
            var dropdownBtnText = $("#drop-text");
            var list = $("#list");
            var icon = $("#icon");
            var span = $("#span");
            var input = $("#search-input");
            var listItems = $(".dropdown-list-item");

            // Sự kiện khi nhấp vào dropdown button
            dropdownBtnText.click(function () {
                list.toggleClass("show");
                icon.toggleClass("rotate"); // Đặt góc quay của biểu tượng
            });

            // Sự kiện khi nhấp bất kỳ nơi nào trên trang
            $(document).click(function (e) {
                if (
                        e.target.id !== "drop-text" &&
                        e.target.id !== "icon" &&
                        e.target.id !== "span"
                        ) {
                    list.removeClass("show");
                    icon.removeClass("rotate"); // Đặt góc quay về ban đầu
                }
            });

            // Sự kiện khi chọn một mục trong dropdown
            listItems.click(function (e) {
                span.text(e.target.innerText);
                input.attr("placeholder", "Search in " + e.target.innerText);
                list.removeClass("show"); // Ẩn dropdown khi mục được chọn
                icon.removeClass("rotate"); // Đặt góc quay về ban đầu
            });
        });
    </script>


</body>

</html>
