<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header id="header" style="background-color: black">
    <a href="HomeServlet">
        <img src="./assets/img/Logo1.png" class="logo" alt="Logo" style="width: 100%;">
    </a>
    <ul id="navbar">
        <li><a class="highlight" href="HomeServlet" style="color: white;">Home</a></li>

        <li>
            <a href="ShopServlet" style="color: white;">Shop</a>
            <ul class="sub-menu">
               <c:forEach items="${categoryList}" var="category">
    <li class="menu-item">
        <a href="CategoryServlet?categoryId=${category.id}" style="color: black;">${category.name}</a>
    </li>
</c:forEach>
            </ul>
        </li>
        <li><a href="BlogServlet" style="color: white;">Blog</a></li>
        <li><a href="AboutServlet" style="color: white;">About</a></li>
        <li><a href="ContactServlet" style="color: white;">Contact</a></li>
        <li>
            <a href="cart.html" style="color: white;">
                <i class="fa-solid fa-bag-shopping"></i>
            </a>
        </li>
        <li>
            <c:if test="${sessionScope.user == null}">
                <a href="LoginServlet" style="color: white;">Login</a>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <a href="LogoutServlet" style="color: white;">Logout</a>
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
