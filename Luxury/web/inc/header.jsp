<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header id="header" style="background-color: #0a0a0a; padding: 15px 0;">
    <a href="HomeServlet" style="padding-left: 20px;">
        <img src="./assets/img/Logo1.png" class="logo" alt="Logo" style="width: 180px;">
    </a>
    <ul id="navbar">
        <li><a class="highlight" href="HomeServlet" style="color: #d4af37;">Home</a></li>
        
        <li>
            <a href="ShopServlet" style="color: #d4af37;">Shop</a>
            <ul class="sub-menu">
                <c:forEach items="${categoryList}" var="category">
                    <li class="menu-item">
                        <a href="CategoryServlet?categoryId=${category.id}" style="color: white;">${category.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </li>
        <li><a href="BlogServlet" style="color: #d4af37;">Blog</a></li>
        <li><a href="AboutServlet" style="color: #d4af37;">About</a></li>
        <li><a href="ContactServlet" style="color: #d4af37;">Contact</a></li>
        <li>
            <a href="CartServlet" style="color: #d4af37;">
                <i class="fa-solid fa-bag-shopping"></i>
            </a>
           
        </li>
        <li>
            <c:if test="${sessionScope.user == null}">
                <a href="LoginServlet" style="color: #d4af37;">Login</a>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <a href="LogoutServlet" style="color: #d4af37;">Logout</a>
            </c:if>
        </li>
    </ul>
</header>

<!-- Include JavaScript for the highlight effect -->
<script>
    // JavaScript to add highlight effect on click
    document.querySelectorAll('#navbar a').forEach(link => {
        link.addEventListener('click', function() {
            // Remove 'highlight' class from all links
            document.querySelectorAll('#navbar a').forEach(item => item.classList.remove('highlight'));
            // Add 'highlight' class to the clicked link
            this.classList.add('highlight');
        });
    });
</script>

<style>
    /* CSS for navbar styling */
    #navbar {
        list-style-type: none;
        padding: 0;
        margin: 0;
        float: right;
        padding-right: 20px;
    }

    #navbar > li {
        display: inline-block;
        position: relative;
        margin-right: 15px;
    }

    #navbar a {
        display: block;
        padding: 10px 20px;
        color: #d4af37;
        text-decoration: none;
        font-family: 'Playfair Display', serif;
        font-size: 1.1rem;
        transition: color 0.3s ease;
    }

    #navbar a:hover {
        color: #f1c40f; /* Brighter gold on hover */
    }

    /* Sub-menu styling */
    .sub-menu {
        display: none; /* Hide sub-menu by default */
        position: absolute; /* Position it absolutely */
        background-color: #1a1a1a; /* Dark background for sub-menu */
        z-index: 1000; /* Ensure it is above other content */
        min-width: 180px; /* Minimum width */
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.5);
    }

    /* Show the sub-menu on hover */
    #navbar > li:hover .sub-menu {
        display: block; /* Show the sub-menu when hovering over the parent */
        z-index: 1000; /* Ensure it is above other elements */
    }

    /* Optional: Style for menu items in sub-menu */
    .sub-menu .menu-item a {
        color: #d4af37; /* Golden color for sub-menu items */
        padding: 10px 15px;
        transition: background-color 0.3s ease;
    }

    .sub-menu .menu-item a:hover {
        background-color: #d4af37;
        color: #0a0a0a; /* Text color changes on hover */
    }

    /* Highlight effect */
    .highlight {
        font-weight: bold; /* Make highlighted link bold */
        text-decoration: underline; /* Underline highlighted link */
        color: #f1c40f !important; /* Brighter gold when active */
    }
</style>
