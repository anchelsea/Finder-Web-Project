<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/home.css">
    <link rel="icon" href="img/like.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"/>

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
    <title>Finder | Dating, Make Friends & Meet New People</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="space">

</div>
<div class="container">

    <div class="side">
        <div>
            <button class="header" id="profile-btn-side">
                <div class="avatar">
                    <img src="${user.photos[0].link}" alt=""/>
                </div>
                <div class="title">My profile</div>
            </button>
        </div>
        <div class="side-btn">
            <button class="avatar1" id="match-btn-side">
                <div><img src="img/match2.png" alt=""/></div>
                <div class="title">Matches</div>
            </button>

        </div>
        <div class="side-btn">
            <button class="avatar1" id="message-btn-side">
                <div><img src="img/message2.png" alt=""/></div>
                <div class="title">Message</div>
            </button>
        </div>

        <div class="side-btn">
            <button class="avatar1" id="discover-btn-side">
                <div><img src="img/discover2.png" alt=""/></div>
                <div class="title">Discover Setting</div>
            </button>
        </div>


    </div>
    <div class="content">
        <div class="card">
            <div class="user">
                <div id="1" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <c:forEach items="${user.photos}">
                            <li style="margin-top: -535px" data-target="#1" data-slide-to="0" class="active"></li>
                        </c:forEach>
                    </ol>

                    <div class="carousel-inner">

                        <c:choose>
                            <c:when test="${user.photoLength<2}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<3}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<4}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[2].link}"
                                         alt="Third slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<5}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[2].link}"
                                         alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[3].link}"
                                         alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<6}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[2].link}"
                                         alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[3].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[4].link}"
                                         alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<7}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[2].link}"
                                         alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[3].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[4].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[5].link}"
                                         alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<8}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[2].link}"
                                         alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[3].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[4].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[5].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[6].link}"
                                         alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<9}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[2].link}"
                                         alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[3].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[4].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[5].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[6].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[7].link}"
                                         alt="Four slide">
                                </div>
                            </c:when>
                            <c:when test="${user.photoLength<10}">
                                <div class="carousel-item active">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[0].link}"
                                         alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[1].link}"
                                         alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[2].link}"
                                         alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[3].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[4].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[5].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[6].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[7].link}"
                                         alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img style="height: 565px" class="d-block w-100" src="${user.photos[8].link}"
                                         alt="Four slide">
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
                <%--               <img
                                       class="user"
                                       src="${user.photos[0].link}"
                                       alt=""
                               />--%>
                <div class="profile">
                    <div class="name">${user.fristname} ${user.lastname} <span>${user.nowYear-user.yearBirthday}</span>
                    </div>
                    <div class="local1">
                        <div class="local-detail">
                            <i class="live-icon"></i>
                            <span style="font-size: 17px">${user.citylive}</span>
                        </div>
                    </div>
                    <div class="gender">
                        <div class="sex-container">
                            <i class="sex-icon"></i>
                            <span style="font-size: 17px" class="sex-name">${user.gender}</span>
                        </div>
                    </div>
                    <div class="info-detail">
                        <button class="info-icon" title="More info"><img class="info-img" src="img/info.png" alt="">
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="buttons">
            <div class="no">
                <i class="fas fa-times"></i>
            </div>
            <div class="star">
                <i class="fas fa-star fa"></i>
            </div>
            <div class="heart">
                <i class="fas fa-heart"></i>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(changeHomePageImg);
    $(swipe());

    function changeHomePageImg() {

        let imageUrl = "img/homepage1.png";
        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("homepage_img").style.backgroundColor = "#ffe0e4";
        document.getElementById("homepage-btn").style.borderBottom = "4px solid #fd5068";

    }

    $('#homepage-btn').click(function () {
        window.location = 'http://localhost:8888/home';
    });

    $('#match-btn-side').click(function () {
        window.location = 'http://localhost:8888/match';
    });

    $('#message-btn-side').click(function () {
        window.location = 'http://localhost:8888/message';
    });

    $('#discover-btn-side').click(function () {
        window.location = 'http://localhost:8888/discover';
    });

    $('#profile-btn-side').click(function () {
        window.location = 'http://localhost:8888/profile';
    });


    function swipe() {

        var tinderContainer = document.querySelector('.tinder');
        var allCards = document.querySelectorAll('.tinder--card');
        var nope = document.getElementById('nope');
        var love = document.getElementById('love');

        function initCards(card, index) {
            var newCards = document.querySelectorAll('.tinder--card:not(.removed)');

            newCards.forEach(function (card, index) {
                card.style.zIndex = allCards.length - index;
                /* card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';*/
                card.style.opacity = (10 - index) / 10;
            });

            tinderContainer.classList.add('loaded');
        }

        initCards();

        allCards.forEach(function (el) {
            var hammertime = new Hammer(el);

            hammertime.on('pan', function (event) {
                el.classList.add('moving');
            });

            hammertime.on('pan', function (event) {
                if (event.deltaX === 0) return;
                if (event.center.x === 0 && event.center.y === 0) return;

                tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
                tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);

                var xMulti = event.deltaX * 0.03;
                var yMulti = event.deltaY / 80;
                var rotate = xMulti * yMulti;

                event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
            });

            hammertime.on('panend', function (event) {
                el.classList.remove('moving');
                tinderContainer.classList.remove('tinder_love');
                tinderContainer.classList.remove('tinder_nope');

                var moveOutWidth = document.body.clientWidth;
                var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

                event.target.classList.toggle('removed', !keep);

                if (keep) {
                    event.target.style.transform = '';
                } else {
                    var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
                    var toX = event.deltaX > 0 ? endX : -endX;
                    var endY = Math.abs(event.velocityY) * moveOutWidth;
                    var toY = event.deltaY > 0 ? endY : -endY;
                    var xMulti = event.deltaX * 0.03;
                    var yMulti = event.deltaY / 80;
                    var rotate = xMulti * yMulti;

                    event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
                    initCards();
                }
            });
        });
    }

</script>
</body>
</html>

