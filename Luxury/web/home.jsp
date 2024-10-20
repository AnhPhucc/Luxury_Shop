<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury</title>
    <link rel="shortcut icon" href="./assets/images/favicon.ico">
    
    <!-- Bootstrap and FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="./assets/css/style.css">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

    <style>
        body {
            background-color: #0a0a0a; /* Rich black */
            color: #f5f5f5; /* Off-white for readability */
            font-family: 'Roboto', sans-serif;
        }

        h1, h2, h3, h4, h5, h6, p {
            color: #e0e0e0; /* Light grey for headings */
            font-family: 'Playfair Display', serif; /* Luxury serif font for headings */
        }

        a {
            color: #d4af37; /* Gold for links */
            text-decoration: none;
        }

        a:hover {
            color: #f1c40f; /* Brighter gold on hover */
        }

        button {
            background-color: #0a0a0a;
            color: #d4af37;
            border: 2px solid #d4af37;
            padding: 10px 20px;
            font-size: 1rem;
            font-family: 'Roboto', sans-serif;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        button:hover {
            background-color: #d4af37;
            color: #0a0a0a;
        }

        /* Featured Products Section */
        #product1 {
            padding: 40px 0; /* Kho?ng cách trên và d??i */
        }

        .prod-cont {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* B? c?c l??i */
            gap: 2rem; /* Kho?ng cách gi?a các s?n ph?m */
        }

        .prod {
            background-color: #1a1a1a;
            padding: 15px;
            border: 1px solid #333;
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative; /* ?? bi?u t??ng gi? hàng có th? ??t ? v? trí tuy?t ??i */
            overflow: hidden; /* ?n ph?n vi?n b? phóng to */
        }

        .prod:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
        }

        .prod img {
            border-bottom: 2px solid #d4af37;
            margin-bottom: 10px;
            width: 100%;
            border-radius: 5px;
            transition: transform 0.3s ease; /* Hi?u ?ng chuy?n ti?p cho ?nh s?n ph?m */
        }

        .prod img:hover {
            transform: scale(1.05); /* Phóng to hình ?nh khi hover */
        }

        .des h5 a {
            color: #ffffff;
            font-size: 1.2rem;
        }

        .des .star i {
            color: #f1c40f;
        }

        .des h4 {
            color: #d4af37;
        }

        /* Slider Section */
        .slider-section {
            margin-top: 40px; /* Kho?ng cách v?i các ph?n khác */
        }

        .swiper {
            width: 100%;
            height: 600px; /* Chi?u cao cho slider */
        }

        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            width: 100%; /* Chi?u r?ng 100% cho ?nh trong slide */
            height: auto; /* T? ??ng ?i?u ch?nh chi?u cao */
            border-radius: 10px; /* Bo tròn các góc ?nh */
        }
        .swiper-button-next, .swiper-button-prev {
            color: white;
        }
        

        /* Banner Section */
        #banner, #sm-banner, #l-banner {
            background: linear-gradient(to right, #0a0a0a, #333333);
            color: #d4af37;
            padding: 40px 0;
            text-align: center;
            margin-top: 40px; /* Kho?ng cách gi?a các ph?n */
        }

        #banner h2 span, #sm-banner h2, #l-banner h2 {
            color: #f1c40f;
        }

        .banner-box {
            background: #222;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s; /* Hi?u ?ng chuy?n ti?p cho banner */
        }

        .banner-box:hover {
            transform: scale(1.05); /* Phóng to khi hover */
        }

        .banner-box button {
            background-color: transparent;
            border: 2px solid #d4af37;
            color: #d4af37;
        }

        .banner-box button:hover {
            background-color: #d4af37;
            color: #0a0a0a;
        }
    </style>
</head>

<body>

    <%@include file="./inc/header.jsp"%>

    <!-- Hero Section with Slider -->
    <section id="" class="slider-section">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <!-- Slide 1 -->
                <div class="swiper-slide">
                    <img src="./assets/img/hero05.png" alt="Slide 1">
                </div>
                <!-- Slide 2 -->
                <div class="swiper-slide">
                    <img src="./assets/img/sp5.png" alt="Slide 2">
                </div>
                <!-- Slide 3 -->
                <div class="swiper-slide">
                    <img src="./assets/img/sp6.png" alt="Slide 3">
                </div>
            </div>
            <!-- Swiper Controls -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section id="product1" class="section-p1">
        <h2>Featured Products</h2>
        <p>Summer Collection New Modern Design</p>
        <div class="prod-cont">
            <c:forEach items="${newsProductList}" var="product" varStatus="status">
                <c:if test="${status.index < 4}"> 
                    <div class="prod">
                        <a href="ProductServlet?productId=${product.id}">
                            <img id="product-img-${product.id}" src="${product.thumbnail}" alt="${product.name}">
                        </a>
                        <div class="des">
                            <span>${description}</span>
                            <h5><a href="ProductServlet?productId=${product.id}">${product.name}</a></h5>
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

    <!-- Banner Section -->
    <section id="banner" class="section-m1">
        <h4>Repair Services</h4>
        <h2>Up to <span>70% Off</span> - All Accessories and Clothing</h2>
        <a href="ShopServlet">
            <button class="normal">Explore More</button>
        </a>
    </section>

    <!-- Small Banner Section -->
    <section id="sm-banner" class="section-p1">
        <div class="banner-box">
            <h4>crazy deals</h4>
            <h2>buy 1 get 1 free</h2>
            <button class="normal">Learn More</button>
        </div>
        <div class="banner-box banner-box2">
            <h4>spring/summer</h4>
            <h2>Upcoming Season</h2>
            <button class="normal">Collection</button>
        </div>
    </section>

    <%@include file="./inc/footer.jsp"%>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    
    <script>
        var swiper = new Swiper('.mySwiper', {
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
        });
    </script>
</body>

</html>
