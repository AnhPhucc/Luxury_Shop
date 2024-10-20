<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury</title>
    <link rel="shortcut icon" href="./assets/images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./assets/css/style.css">
    <style>
        body {
            background-color: #f8f9fa; /* N?n trang sáng */
        }

        .section-p1 {
            margin: 20px 0;
        }

        .single-pro-details h4 {
            font-weight: bold;
            font-size: 1.5rem;
            color: #343a40; /* Màu ch? ??m */
        }

        .single-pro-details h2 {
            font-weight: bold;
            color: #dc3545; /* Màu ?? cho giá */
        }

        .normal {
            background-color: #007bff; /* Màu xanh cho nút */
            color: white; /* Màu ch? tr?ng */
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s; /* Hi?u ?ng chuy?n ti?p */
        }

        .normal:hover {
            background-color: #0056b3; /* Màu khi hover */
        }

        .single-pro-img {
            position: relative; /* ??t v? trí t??ng ??i cho ph?n ?nh */
            overflow: hidden; /* ?n ph?n ?nh b? phóng to ra ngoài */
            border-radius: 10px; /* Bo góc cho ?nh */
        }

        .single-pro-img img {
            transition: transform 0.3s ease; /* Hi?u ?ng chuy?n ti?p cho ?nh */
        }

        .single-pro-img:hover img {
            transform: scale(1.1); /* Phóng to ?nh khi hover */
        }

        .prod {
            border: 1px solid #dee2e6; /* Vi?n cho s?n ph?m */
            border-radius: 10px;
            overflow: hidden; /* ?n ph?n vi?n */
            transition: transform 0.2s; /* Hi?u ?ng khi hover */
        }

        .prod:hover {
            transform: scale(1.05); /* Phóng to khi hover */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* ?? bóng */
        }

        .prod img {
            width: 100%; /* ??m b?o hình ?nh v?a khung */
            height: auto; /* Gi? t? l? */
            transition: transform 0.3s ease; /* Hi?u ?ng chuy?n ti?p cho ?nh s?n ph?m */
        }

        .des {
            padding: 15px; /* ??m cho ph?n mô t? s?n ph?m */
        }

        .star i {
            color: #ffc107; /* Màu vàng cho sao */
        }
    </style>
</head>

<body>

<%@include file="./inc/header.jsp"%>

<section id="prodetails" class="section-p1">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="single-pro-img">
                    <img src="${product.thumbnail}" alt="" id="MainImg" width="100%">
                    <div class="small-img-group">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <form action="CartServlet" method="post" class="single-pro-details">
                    <input type="hidden" name="action" value="create"/>
                    <input type="hidden" name="productId" value="${product.id}"/>
                    <input type="hidden" name="price" value="${product.price}"/>
                    <h6>Home / T-Shirt</h6>
                    <h4>${product.name}</h4>
                    <h2>$${product.price}</h2>
                    
                    <!-- Size selection dropdown -->
                    <select name="size" required>
                        <option value="" disabled selected>Select Size</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                        <option value="XXL">XXL</option>
                    </select>
                    
                    <!-- Quantity input -->
                    <input name="quantity" type="number" value="1" min="1">
                    <button class="normal">Add To Cart</button>
                    
                    <h4>Product Details</h4>
                    <span>${product.description}</span>
                </form>
            </div>
        </div>
    </div>
</section>

<section id="product1" class="section-p1">
    <h2>Related products</h2>
    <p>Luxury Collection New Modern Design</p>
    <div class="prod-cont">
        <!-- L?p qua danh sách s?n ph?m và ch? hi?n th? t?i ?a 8 s?n ph?m -->
        <c:forEach items="${newsProductList}" var="product" varStatus="status">
            <c:if test="${status.index < 8}">
                <div class="prod">
                    <a href="ProductServlet?productId=${product.id}">
                        <img src="${product.thumbnail}" alt="${product.name}">
                    </a>
                    <div class="des">
                        <span>${product.description}</span>
                        <h5>${product.name}</h5>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h4>$${product.price}</h4>
                    </div>
                    <a href="#"><i class="fa-solid fa-cart-shopping cart"></i></a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>


<%@include file="./inc/footer.jsp"%>

</body>

</html>
    