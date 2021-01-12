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
    <link rel="icon" href="img/like.png">
    <link rel="stylesheet" href="css/semantic.css">
    <link rel="stylesheet" href="css/match.css">

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
    <title>Match | Finder</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container1">

    <div class="side1">
        <div class="space"></div>
        <div class="header">
            <div class="avatar">
                <img src="${user.photos[0].link}" alt=""/>
            </div>
            <div class="title"> Matches</div>

        </div>
        <div class="match-container">
            <c:forEach items="${users}" var="theUser">
                        <a class="match" id="match-${users}" href="${pageContext.request.contextPath}/match?id=${theUser.id}">
                            <button class="card">
                                <div class="user">
                                    <img class="user_1" src="${theUser.photos[0].link}" alt=""/>
                                    <div class="name">${theUser.lastname}</div>
                                </div>
                            </button>
                        </a>
            </c:forEach>
        </div>

    </div>

    <%--Mess--%>
    <div class="mess">
        <div class="space"></div>
        <div class="mess-header">
            <div class="avatar1">
                <div><img src="${currentMatchUser.photos[0].link}" class="avatar-header-mess" alt=""/></div>
                <div class="title">You matched with ${currentMatchUser.fristname} ${currentMatchUser.lastname} on 11/12/2020</div>
                <div class="close-btn" id="close-match-btn"><img src="img/close.png" title="Close Message" alt=""></div>
            </div>
        </div>
        <div class="content-mess">

        </div>
        <div class="input-mess">
            <button class="add-input"><img src="img/add.png" alt=""></button>
            <button class="picture-input"><img src="img/picture.png" alt=""></button>
            <button class="gif-input"><img src="img/gif.png" alt=""></button>
            <button class="music-input"><img src="img/music.png" alt=""></button>
            <input type="text" placeholder="Type a message" class="text-input">
            <button class="smile-input"><img src="img/smile.png" alt=""></button>
            <button class="send-input">SEND</button>
        </div>
    </div>

    <%--Profile--%>
    <div class="profile">
        <div class="profile-container">
            <div class="space"></div>
            <div class="card">
                <c:if test="${currentMatchUser.id!=null}">
                    <div>
                        <div class="image-profile">
                            <div id="1" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <c:forEach items="${currentMatchUser.photos}">
                                        <li style="margin-top: -440px" data-target="#1" data-slide-to="0" class="active"></li>
                                    </c:forEach>

                                </ol>
                                <div class="carousel-inner">

                                    <c:choose>
                                        <c:when test="${currentMatchUser.photoLength<2}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<3}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<4}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[2].link}" alt="Third slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<5}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[2].link}" alt="Third slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[3].link}" alt="Four slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<6}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[2].link}" alt="Third slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[3].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[4].link}" alt="Four slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<7}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[2].link}" alt="Third slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[3].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[4].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[5].link}" alt="Four slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<8}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[2].link}" alt="Third slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[3].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[4].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[5].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[6].link}" alt="Four slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<9}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[2].link}" alt="Third slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[3].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[4].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[5].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[6].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[7].link}" alt="Four slide">
                                            </div>
                                        </c:when>
                                        <c:when test="${currentMatchUser.photoLength<10}">
                                            <div class="carousel-item active">
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[0].link}"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[1].link}" alt="Second slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[2].link}" alt="Third slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[3].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[4].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[5].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[6].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[7].link}" alt="Four slide">
                                            </div>
                                            <div class="carousel-item" >
                                                <img style="height: 470px" class="d-block w-100" src="${currentMatchUser.photos[8].link}" alt="Four slide">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div></div>
                                        </c:otherwise>

                                    </c:choose>


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
                        </div>
                    </div>

                    <div class="content">
                        <div class="name-profile">
                            <h1 class="name">${currentMatchUser.fristname} ${currentMatchUser.lastname}</h1>
                            <span class="age">${currentMatchUser.nowYear-currentMatchUser.yearBirthday}</span>
                        </div>
                        <div class="live-container">
                            <i class="live-icon"></i>
                            <span class="live-name">${currentMatchUser.citylive}</span>
                        </div>
                        <div class="sex-container">
                            <i class="sex-icon"></i>
                            <span class="sex-name">${currentMatchUser.gender}</span>
                        </div>
                        <div class="school-container">
                            <i class="school-icon"></i>
                            <span class="school-name">${currentMatchUser.school}</span>
                        </div>
                        <div class="work">
                            <div class="work-container">
                                <i class="work-icon"></i>
                                <span class="work-name">${currentMatchUser.work}</span>
                            </div>
                        </div>

                    </div>
                    <div class="description">
                        <p class="descrip-detail">${currentMatchUser.about}</p>
                    </div>
                    <div class="interest-show" id="list-interest">

                        <c:choose>
                            <c:when test="${currentMatchUser.interestLength == 1}">
                                <div>${currentMatchUser.interest[0]}</div>
                            </c:when>
                            <c:when test="${currentMatchUser.interestLength == 2}">
                                <div>${currentMatchUser.interest[0]}</div>
                                <div>${currentMatchUser.interest[1]}</div>
                            </c:when>
                            <c:when test="${currentMatchUser.interestLength == 3}">
                                <div>${currentMatchUser.interest[0]}</div>
                                <div>${currentMatchUser.interest[1]}</div>
                                <div>${currentMatchUser.interest[2]}</div>
                            </c:when>
                            <c:when test="${currentMatchUser.interestLength == 4}">
                                <div>${currentMatchUser.interest[0]}</div>
                                <div>${currentMatchUser.interest[1]}</div>
                                <div>${currentMatchUser.interest[2]}</div>
                                <div>${currentMatchUser.interest[3]}</div>
                            </c:when>
                            <c:when test="${currentMatchUser.interestLength == 5}">
                                <div>${currentMatchUser.interest[0]}</div>
                                <div>${currentMatchUser.interest[1]}</div>
                                <div>${currentMatchUser.interest[2]}</div>
                                <div>${currentMatchUser.interest[3]}</div>
                                <div>${currentMatchUser.interest[4]}</div>
                            </c:when>
                            <c:otherwise>
                                <div></div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </c:if>

            </div>
        </div>

        <div class="unmatch-container">
            <button class="unmatch-btn">UNMATCH</button>
            <button class="report-btn">REPORT</button>
        </div>
    </div>
    </div>
</div>


<script type="text/javascript">
    $(changeHomePageImg);

    function changeHomePageImg() {

        let imageUrl = "img/homepage1.png";
        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("match_img").style.backgroundColor = "#ffe0e4";
        document.getElementById("match-btn").style.borderBottom = "4px solid #fd5068";
    }

    $('#close-match-btn').click(function () {
        window.location = 'http://localhost:8888/home';
    });



</script>
</body>
</html>