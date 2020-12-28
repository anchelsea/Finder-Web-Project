<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="img/like.png">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="css/semantic.css">
    <link rel="stylesheet" href="css/login.css">

    <script src="js/lib/jquery.js"></script>
    <script src="js/lib/semantic.js"></script>
    <script src="js/lib/Semantic-UI-Alert.js"></script>

    <title>Finder | Dating, Make Friends & Meet New People</title>
</head>

<body>

<%--Navigation--%>
<nav id="nav">
    <a href="#about" class="ui yellow button" id="about-nav">About</a>
</nav>


<%--Home section--%>
<section id="home">
    <jsp:include page="signin-modal.jsp"></jsp:include>
    <jsp:include page="signup-modal.jsp"></jsp:include>
    <div class="home-container">
        <button class="ui inverted primary button test1" id="create-account" onclick="signupModal()">CREATE ACCOUNT</button>
    </div>
    <div class="home-container">
        <button class="ui purple button test" id="login-btn" onclick="singinModal()">LOGIN</button>
    </div>



</section>

<%--About Section--%>
<section id="about">
    <div class="about-container">
        <div class="review">
            <h2>F.Torres</h2>
            <h3>I have find true love of my live. Thanks Finder <3</h3>
        </div>

        <div class="review">
            <h2>L.Messi</h2>
            <h3>Fortenately, I see one girl in Finder and now She is my wife. Amazing GoodJob </h3>
        </div>

        <div class="review">
            <h2>C.Ronaldo</h2>
            <h3>I'm a familiar with 3 beautiful girl in Finder. A Perfect website.</h3>
        </div>
    </div>

    <div class="social-icon">
        <h1 id="text-link">STAY SOCIAL</h1>
        <a class="a-github" href="https://github.com/anchelsea" target="_blank"><i class="fab fa-github"></i></a>
        <i class="fab fa-linkedin-in"></i>
        <i class="fab fa-medium"></i>
        <i class="fab fa-facebook"></i>
        <i class="fab fa-instagram"></i>
        <i class="fab fa-youtube"></i>
    </div>
</section>


<script src="js/login.js"></script>
</body>

<footer id="main-footer">
    <p>Copyright &copy; 2020 by An, All Rights Reserved</p>
</footer>


</html>