<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    /* Global Styles */
    body {
        background-color: #0a0a0a; /* Black background */
        color: #f5f5f5; /* Light text color for readability */
        font-family: 'Roboto', sans-serif;
    }

    /* Page Header Section */
    #page-header {
        background-color: #222; /* Dark grey background */
        padding: 40px 20px; /* Padding around the header */
        text-align: center; /* Center-align text */
    }

    #page-header h2 {
        color: #d4af37; /* Gold color for the heading */
        font-size: 2.5rem; /* Larger font size */
        margin-bottom: 10px; /* Space below heading */
    }

    #page-header p {
        font-size: 1.2rem; /* Larger font size for the paragraph */
    }

    /* Featured Products Section */
    #product1 {
        padding: 40px 0; /* Padding above and below */
    }

    .prod {
        background-color: #1a1a1a; /* Dark product background */
        padding: 15px;
        border: 1px solid #333; /* Border color */
        border-radius: 10px; /* Rounded corners */
        transition: transform 0.3s, box-shadow 0.3s;
        position: relative;
        overflow: hidden;
    }

    .prod:hover {
        transform: translateY(-5px); /* Slight lift effect on hover */
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5); /* Shadow effect */
    }

    /* Product Description */
    .des h5 {
        color: #d4af37; /* Gold color for product name */
    }

    .des span {
        color: #e0e0e0; /* Light grey for product description */
    }

    /* Product Price */
    .des h4 {
        color: #ffffff; /* Change the price color to white */
    }

    /* Pagination Section */
    #pagination {
        text-align: center; /* Center-align pagination links */
        padding: 20px 0; /* Padding for spacing */
    }

    #pagination a {
        margin: 0 10px; /* Space between links */
        color: #d4af37; /* Gold color for pagination links */
        text-decoration: none; /* Remove underline */
        padding: 5px 10px; /* Padding for links */
        border: 1px solid #d4af37; /* Border for links */
        border-radius: 5px; /* Rounded corners */
        transition: background-color 0.3s, color 0.3s; /* Transition for hover effect */
    }

    #pagination a:hover {
        background-color: #d4af37; /* Gold background on hover */
        color: #0a0a0a; /* Dark text color on hover */
    }

    #pagination a.active {
        background-color: #d4af37; /* Gold background for active page */
        color: #0a0a0a; /* Dark text for active page */
    }
</style>

</head>

<body>

    <%@include file="./inc/header.jsp"%>

    <section id="page-header">
        <h2>Buy Now</h2>
        <p>Save more with coupons & up to 70% off!</p>
    </section>

    <section id="product1" class="section-p1">
        <div class="prod-cont">
            <c:forEach items="${productList}" var="product">
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
            </c:forEach>
        </div>
    </section>

    <section id="pagination" class="section-p1">
        <c:forEach var="i" begin="1" end="${numberPage}">
            <a <c:if test="${i == page}">class="active"</c:if> href="ShopServlet?page=${i}">${i}</a>
        </c:forEach>
        <c:if test="${page < numberPage}">
            <a href="ShopServlet?page=${page + 1}"><i class="fa-solid fa-arrow-right"></i></a>
        </c:if>
    </section>

    <%@include file="./inc/footer.jsp"%>

</body>

</html>
