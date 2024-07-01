<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manager</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="../css/manager.css" rel="stylesheet" type="text/css">
    </head>

    <style>
        body {
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 18px;
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
        }


        .header__top__right {
            display: flex;
            justify-content: flex-end;
            padding: 10px 0 13px;
            text-align: right;
        }

        .header__top__right__auth {
            display: inline-block;
            padding: 5px;
            position: relative;
            text-decoration: none;
        }

        .header__top__right__auth a {
            display: block;
            font-size: 22px;
            color: #1c1c1c;
        }

        .header__top__right__auth a i {
            margin-right: 6px;
        }

        /* Đặt dropdown ở vị trí tương đối để nổi lên trên bề mặt web */
        .header__top__right__auth .dropdown-menu {
            position: absolute;
            top: 100%;
            left: -50px;
            display: none;
            background-color: #fff;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        /* Hiển thị dropdown khi hover vào nút */
        .header__top__right__auth:hover .dropdown-menu {
            display: block;
        }

        /* CSS cho các mục trong dropdown */
        .header__top__right__auth .dropdown-menu a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        /* Thay đổi màu sắc khi hover vào các mục trong dropdown */
        .header__top__right__auth .dropdown-menu a:hover {
            background-color: #ddd;
        }

        .table-responsive{
            margin: 20px 0;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            width: 100%;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-scroll {
            max-width: 100%; /* Đảm bảo bảng không tràn ra ngoài phần chứa */
            overflow-x: auto; /* Kích hoạt cuộn ngang nếu bảng quá rộng */
        }

        .table-title {
            padding-bottom: 15px;
            color: black;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn-group {
            float: right;
            background: #7fad39;
        }
        .table-title .btn-info {
            background-color: #7fad39;
        }
        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }
        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }
        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table tr th:first-child {
            width: 60px;
        }
        table.table tr th:last-child {
            width: 100px;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }
        table.table td a {
            font-weight: bold;
            color: #7fad39;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }
        table.table td a:hover {
            color: #2196F3;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td a.delete {
            color: #F44336;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        /* Modal styles */
        .modal .modal-dialog {
            max-width: 500px; /* Tăng kích thước của modal */
            margin: 0 auto; /* Căn giữa modal theo chiều ngang */
        }
        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px; /* Điều chỉnh padding cho phần header, body và footer */
            color: black; /* Đặt màu chữ cho modal */
        }
        .modal .modal-content {
            border-radius: 3px;
            font-size: 14px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Thêm hiệu ứng bóng đổ */
        }
        .modal .modal-footer {
            background: #f5f5f5; /* Màu nền cho footer */
            padding: 10px; /* Điều chỉnh padding cho footer */
            border-radius: 0 0 3px 3px;
        }
        .modal-footer .btn-info{
            width: 100%;
            background: #7fad39;
        }
        .modal .modal-title {
            font-size: 18px; /* Tăng kích thước font cho tiêu đề */
            display: inline-block;
        }
        .modal .form-control {
            border-radius: 5px; /* Tăng độ bo tròn cho input */
            box-shadow: none; /* Loại bỏ bóng đổ cho input */
            border-color: #dddddd;
        }
        .modal textarea.form-control {
            resize: vertical;
        }
        .modal .btn {
            border-radius: 5px; /* Tăng độ bo tròn cho button */
            min-width: 100px;
        }
        .modal form label {
            font-weight: bold; /* Tăng độ đậm cho label */
        }

        table.modal-body {
            width: 100%;
            border-collapse: collapse;
        }

        table.modal-body tr {
            border-bottom: 1px solid #ddd;
        }

        table.modal-body td {
            padding: 10px;
        }
        .button {
            text-align: center;
            display: inline-block;
            padding: 5px;
            border: 1px solid #ccc;
            margin: 5px;
            background-color: #f5f5f5;
            transition: background-color 0.3s, border-color 0.3s, color 0.3s;
        }

        .button a {
            text-decoration: none;
            color: black;
        }

        .button:hover {
            background-color: #D9FAF4;
            border-color: #0077b6;
            color: #fff;
        }

        .active {
            background-color: #D9FAF4;
            border-color: #0077b6;
            color: white;
        }

        .button-paging {
            display: flex;
            justify-content: space-around;
            align-items: center;

        }
    </style>

    <script>
        var showE = false;
        function formatFloat(inputName, regexPattern) {
            var input = document.querySelector('input[name="' + inputName + '"]');
            var error = document.getElementById('error-message-' + inputName);
            var inputValue = input.value;
            // Loại bỏ tất cả các kí tự không phải số hoặc dấu chấm (".")
            var regex = /^[0-9]+(\.[0-9]+)?$/;
            if (!regex.test(inputValue)) {
                showE = true; // Đặt biến này thành true nếu có giá trị trùng lặp
                error.style.display = 'block';
                input.value = '';
            } else {
                if (showE) {
                    error.style.display = 'none'; // Ẩn thông báo lỗi nếu không còn giá trị trùng lặp
                    showE = false; // Đặt biến này thành false
                }
            }
        }

        function checkSellPrice(input) {
            var priceInput = document.querySelector('input[name="price"]');
            var sellPriceInput = document.querySelector('input[name="sellprice"]');
            var price = parseFloat(priceInput.value);
            var sellPrice = parseFloat(sellPriceInput.value);

            var errorMessageCompare = document.getElementById('error-message-compare');

            if (sellPrice <= price) {
                errorMessageCompare.style.display = 'block';
                sellPriceInput.value = ''; // Xoá giá trị nhập cho sell price
            } else if (sellPrice == null) {
                errorMessageCompare.style.display = 'none';
            } else {
                errorMessageCompare.style.display = 'none';
            }
        }

    </script>

    <body>
        <div class="header__top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <a href="/PRJ301_PROJECT/Home" class="header__top__left__back-button">
                                <i class="fa fa-home"></i> Back Home
                            </a>
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
                                                <a class="dropdown-item" href="#">My Profile</a>
                                                <a class="dropdown-item" href="#">Change Password</a>
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
        <div class="container-fluid">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h2>Manager <b>Products</b></h2>
                                <h6 style="color: red;">${mess1}</h6>
                                <h6 style="color: red;">${mess2}</h6>
                                <h6 style="color: red;">${mess3}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:forEach items="${products}" var="p">
            <c:if test="${p.productID == update}">
                <c:set var="pro" value='${p}'/>
            </c:if>
        </c:forEach>
        <!-- Edit Modal HTML -->
        <div>
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="Edit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Product</h4>
                        </div>
                        <table class="modal-body">
                            <tr style="display: none;">
                                <td>Product ID</td>
                                <td><input value='${pro.productID}' name="productID" type="number" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>Product Name</td>
                                <td><input value='${pro.productName}' name="productName" type="text" class="form-control" required></td>
                            </tr>
                            <tr>
                                <td>Category</td>
                                <td>
                                    <select name="category" class="form-control" required>
                                        <c:forEach items="${category}" var="ca">
                                            <option value="${ca.categoryID}" ${pro.categoryID == ca.categoryID?"selected":""}>${ca.categoryID}. ${ca.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Price</td>
                                <td>
                                    <input value='${pro.price}' name="price" type="text" class="form-control" required
                                           onblur="formatFloat('price', ' /^[0-9]+(\.[0-9]+)?$/')">
                                    <span id="error-message-price" style="color: red; display: none;font-size: 15px">Vui lòng nhập đúng định dạng</span>
                                </td>
                            </tr>
                            <tr>
                                <td>Stock Quantity</td>
                                <td><input value='${pro.stockQuantity}' name="stockQuantity" type="text" class="form-control" required></td>
                            </tr>

                            <tr>
                                <td>Link image</td>
                                <td><input value='${pro.image_url}' name="imageURL" type="text" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Quantity</td>
                                <td><input value='${pro.quantity}' name="quantity" type="number" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Sell price</td>
                                <td>
                                    <input value='${pro.sellprice}' name="sellprice" type="text" class="form-control" required
                                           onblur="formatFloat('sellprice', ' /^[0-9]+(\.[0-9]+)?$/'); checkSellPrice(this);">
                                    <span id="error-message-sellprice" style="color: red; display: none; font-size: 15px">Vui lòng nhập đúng định dạng</span>
                                    <span id="error-message-compare" style="color: red; display: none; font-size: 15px">Giá bán phải lớn hơn giá gốc</span>
                                </td>
                            </tr>
                        </table>
                        <div class="modal-footer">
                            <input type="submit" name="save" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
