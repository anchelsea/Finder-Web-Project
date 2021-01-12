<%@ page import="com.an.finder.entity.Interest" %>
<%@ page import="com.an.finder.entity.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="icon" href="img/like.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <script src="js/lib/jquery.js"></script>
    <script src="js/lib/semantic.js"></script>
    <script src="js/lib/Semantic-UI-Alert.js"></script>
    <title>My Profile | Dating, Make Friends & Meet New People</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>
<div class="space">

</div>


<div class="container">

    <div class="side">
        <div>
            <button class="header">
                <div class="avatar">
                    <img src="${user.photos[0].link}" alt=""/>
                </div>
                <div class="title">My profile</div>
            </button>
        </div>
        <div class="side-btn">
            <button class="avatar1" id="logout-btn">
                <div class="title" id="logout-title">LOGOUT</div>
            </button>

        </div>
        <div class="side-btn">
            <button class="avatar1">
                <div class="title" id="version-title">VERSION 1.0</div>
            </button>
        </div>

        <div class="side-btn">
            <button class="avatar1">
                <div class="title" id="delete-title">DELETE ACCOUNT</div>
            </button>
        </div>


    </div>
    <jsp:useBean id="date" class="java.util.Date"
    />


    <div class="content">
        <div class="card">
            <div class="user">
                <div id="1" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <c:forEach items="${user.photos}">
                            <li style="margin-top: -440px" data-target="#1" data-slide-to="0" class="active"></li>
                        </c:forEach>
                        <%--                    <li style="margin-top: -440px"  data-target="#1" data-slide-to="0" class="active"></li>
                                            <li style="margin-top: -440px" data-target="#1" data-slide-to="1"></li>
                                            <li style="margin-top: -440px" data-target="#1" data-slide-to="2"></li>--%>
                    </ol>
                    <div class="carousel-inner">

                        <c:choose>
                            <c:when test="${user.photoLength<2}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<3}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<4}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[2].link}" alt="Third slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<5}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[2].link}" alt="Third slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[3].link}" alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<6}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[2].link}" alt="Third slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[3].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[4].link}" alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<7}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[2].link}" alt="Third slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[3].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[4].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[5].link}" alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<8}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[2].link}" alt="Third slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[3].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[4].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[5].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[6].link}" alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<9}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[2].link}" alt="Third slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[3].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[4].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[5].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[6].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[7].link}" alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<10}">
                                <div class="carousel-item active">
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[1].link}" alt="Second slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[2].link}" alt="Third slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[3].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[4].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[5].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[6].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[7].link}" alt="Four slide">
                                </div>
                                <div class="carousel-item" >
                                    <img style="height: 470px" class="d-block w-100" src="${user.photos[8].link}" alt="Four slide">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div></div>
                            </c:otherwise>

                        </c:choose>


                        <%--                        <div class="carousel-item active">
                                                    <img style="height: 470px" class="d-block w-100" src="img/girl1.png" alt="First slide">
                        &lt;%&ndash;                            <div class="carousel-caption d-none d-md-block">
                                                        <h5>My Caption Title (1st Image)</h5>
                                                        <p>The whole caption will only show up if the screen is at least medium size.</p>
                                                    </div>&ndash;%&gt;
                                                </div>
                                                <div class="carousel-item" >
                                                    <img style="height: 470px" class="d-block w-100" src="img/girl2.jpg" alt="Second slide">
                                                </div>
                                                <div class="carousel-item">
                                                    <img style="height: 470px" class="d-block w-100" src="img/girl3.jpg" alt="Third slide">
                                                </div>--%>
                    </div>
                    <a class="carousel-control-prev" href="#1" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#1" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <%--                <img
                                        class="user1"
                                        src="${user.photos[0].link}"
                                        alt=""
                                />--%>
                <div class="profile">

                    <div class="name">${user.fristname} ${user.lastname} <span>${user.nowYear-user.yearBirthday}</span>
                    </div>
                    <div class="local">
                        <div class="local-detail">
                            <i class="live-icon"></i>
                            <span>${user.citylive}</span>
                        </div>

                    </div>
                    <div class="gender">
                        <div class="sex-container">
                            <i class="sex-icon"></i>
                            <span class="sex-name">${user.gender}</span>
                        </div>
                    </div>
                    <div class="school">
                        <div class="school-container">
                            <i class="school-icon"></i>
                            <span class="school-name">${user.school}</span>
                        </div>
                    </div>
                    <div class="work">
                        <div class="work-container">
                            <i class="work-icon"></i>
                            <span class="work-name">${user.work}</span>
                        </div>
                    </div>


                    <div class="about">
                        <div class="about-container">
                            <span class="about-name">${user.about}</span>
                        </div>
                    </div>

                    <div class="interest-show" id="list-interest">

                        <c:choose>
                            <c:when test="${user.interestLength == 1}">
                                <div>${user.interest[0]}</div>
                            </c:when>
                            <c:when test="${user.interestLength == 2}">
                                <div>${user.interest[0]}</div>
                                <div>${user.interest[1]}</div>
                            </c:when>
                            <c:when test="${user.interestLength == 3}">
                                <div>${user.interest[0]}</div>
                                <div>${user.interest[1]}</div>
                                <div>${user.interest[2]}</div>
                            </c:when>
                            <c:when test="${user.interestLength == 4}">
                                <div>${user.interest[0]}</div>
                                <div>${user.interest[1]}</div>
                                <div>${user.interest[2]}</div>
                                <div>${user.interest[3]}</div>
                            </c:when>
                            <c:when test="${user.interestLength == 5}">
                                <div>${user.interest[0]}</div>
                                <div>${user.interest[1]}</div>
                                <div>${user.interest[2]}</div>
                                <div>${user.interest[3]}</div>
                                <div>${user.interest[4]}</div>
                            </c:when>
                            <c:otherwise>
                                <div></div>
                            </c:otherwise>
                        </c:choose>

                    </div>

                </div>
            </div>
            <div class="buttons">
                <div class="edit-info" id="edit-profile-btn">
                    <button class="edit-info-btn">Edit Info</button>
                </div>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    $(changeHomePageImg);
    function changeHomePageImg() {
        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("profile-btn").style.backgroundColor = "#ffe0e4";
        document.getElementById("title-profile").style.backgroundColor = "#ffe0e4";
    }
    $('#logout-btn').click(function () {
        window.location = 'http://localhost:8888/logout';
    });
    $('#edit-profile-btn').click(function () {
        window.location = 'http://localhost:8888/edit';
    });
</script>
</body>
</html>