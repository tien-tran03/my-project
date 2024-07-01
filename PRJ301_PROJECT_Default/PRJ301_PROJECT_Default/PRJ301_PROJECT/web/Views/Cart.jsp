<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="icon" href="../img/3514407.png" type="image/x-icon">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
        <!-- Css Styles -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="../css/style.css" type="text/css">
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
                <a href="Home"><img src="../img/supermarket-shopping-cart-logo-02D26535D8-seeklogo.com.png" alt=""></a>
            </div>
            <div class="humberger__menu__cart">
                <ul>
                    <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                    <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                </ul>
                <div class="header__cart__price">item: <span>$150.00</span></div>
            </div>
            <div class="humberger__menu__widget">
                <div class="header__top__right__auth">
                    <a href="#"><i class="fa fa-user"></i> Login</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                <ul>
                    <li class="active"><a href="PRJ301_PROJECT/Home">Home</a></li>
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
                                                    <a class="dropdown-item" href="/PRJ301_PROJECT/Logout">Logout</a>
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
                            <a href="/PRJ301_PROJECT/Home"><img src="../img/supermarket-shopping-cart-logo-02D26535D8-seeklogo.com.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6" style="display: flex; align-items: center; justify-content: center;">
                        <div class="header__menu">
                            <nav class="header__menu">
                                <ul>
                                    <li class="active"><a href="/PRJ301_PROJECT/Home">Home</a></li>
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
                                    <li><a href="../Category?cid=${c.categoryID}">${c.categoryName}</a></li>
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

                        <div class="hero__item set-bg" data-setbg="../img/hero/banner.jpg">
                            <div class="hero__text">
                                <span>FRUIT FRESH</span>
                                <h2>Vegetable <br />100% Organic</h2>
                                <p>Free Pickup and Delivery Available</p>
                                <a href="../Home" class="primary-btn">SHOP NOW</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Shoping Cart Section Begin -->
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th></th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty sessionScope.cart}">
                                            <c:set var="cartTotal" value="0" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="cartTotal" value="0" />
                                            <c:forEach items="${sessionScope.cart}" var="entry">
                                                <tr>
                                                    <td class="shoping__cart__item">
                                                        <img src="../img/${entry.value.product.image_url}" style="width: 150px; height: 150px;" alt="">
                                                    </td>
                                                    <td class="shoping__cart__name">
                                                        <h5>${entry.value.product.productName}</h5>
                                                    </td>
                                                    <td class="shoping__cart__price">
                                                        <fmt:formatNumber value="${entry.value.product.sellprice}" pattern="0.0" />
                                                    </td>
                                                    <c:set var="quantity" value="${entry.value.productQuantity}" />
                                                    <td class="shoping__cart__quantity">
                                                        <div class="quantity">
                                                            <div class="pro-qty">
                                                                <input type="text" value="${quantity}">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="shoping__cart__total" id="total_${entry.key}">
                                                        <fmt:formatNumber value="${entry.value.product.sellprice * entry.value.productQuantity}" pattern="0.0" />
                                                    </td>

                                                    <td class="shoping__cart__item__close">
                                                        <a href="DeleteCart?key=${entry.key}"><span class="icon_close"></span></a>
                                                    </td>
                                                </tr>
                                                <c:set var="productTotal" value="${entry.value.product.sellprice * entry.value.productQuantity}" />
                                                <c:set var="cartTotal" value="${cartTotal + productTotal}" />
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="/PRJ301_PROJECT/Home" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                            <a href="/PRJ301_PROJECT/Member/Cart" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                                Upadate Cart</a>
                        </div>
                    </div>
                    <div class="col-lg-6"></div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Cart Total</h5>
                            <ul>
                                <li>Total <span><fmt:formatNumber value="${cartTotal}" pattern="0.00" /> VNÐ</span></li>
                            </ul>
                            <ul>
                                <li>Name <span>${sessionScope.acc.first_name} ${sessionScope.acc.last_name}</span></li>
                            </ul>
                            <ul>
                                <li>Shipping
                                    <span>
                                        <form action="AddToOrder" method="post">
                                            <input type="radio" name="location" value="HaNoi"> Hà Nội <br>
                                            <input type="radio" name="location" value="HungYen"> Hưng Yên <br>
                                            <input type="radio" name="location" value="SonTay"> Sơn Tây <br>
                                        </form>
                                    </span>
                                </li>
                            </ul>
                            <script src="../js/jquery.slicknav.js" type="text/javascript"></script>
                            <a href="/PRJ301_PROJECT/Member/AddToOrder" class="primary-btn">PROCEED TO CHECKOUT</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.nice-select.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
        <script src="../js/jquery.slicknav.js"></script>
        <script src="../js/mixitup.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/main.js"></script>
        <script>
            var proQty = $('.pro-qty');
            var proQtyIn = $('.pro-qty input');
            proQty.prepend('<span class="dec qtybtn">-</span>');
            proQty.append('<span class="inc qtybtn">+</span>');
            proQty.on('click', '.qtybtn', function () {
                var $button = $(this);
//                var oldValue = $button.parent().find('input').val();
                if ($button.hasClass('inc')) {
                    var newVal = parseFloat(${quantity}) + 1;
                } else {
                    // Don't allow decrementing below zero
                    if (${quantity} > 0) {
                        var newVal = parseFloat(${quantity}) - 1;
                    } else {
                        newVal = 0;
                    }
                }
                $button.parent().find('input').val(newVal);
            });
        </script>
    </body>
</html>
