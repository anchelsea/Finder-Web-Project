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

    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"/>--%>


    <script src="js/lib/jquery.js"></script>
    <script src="js/lib/semantic.js"></script>
    <script src="js/lib/Semantic-UI-Alert.js"></script>

    <title>Finder | Dating, Make Friends & Meet New People</title>
    <style>
        .moving.user {
            transition: none;
            cursor: grabbing;
        }


        .loaded.content1 {
            opacity: 1;
        }

        .tinder_love .fa-heart {

            color: #11e298;;
            opacity: 0.7;
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .tinder_nope .fa-times {
            color: #fd2e79;
            opacity: 0.7;
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .tinder--status {
            position: absolute;
            top: 50%;
            margin-top: -30px;
            z-index: 2;
            width: 100%;
            text-align: center;
            pointer-events: none;
        }

        .tinder--status i {
            font-size: 100px;
            opacity: 0;
            -webkit-transform: scale(0.3);
            transform: scale(0.3);
            transition: all 0.2s ease-in-out;
            position: absolute;
            width: 100px;
            margin-left: -50px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="space">

</div>
<div class="container1">

    <div class="side1">
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
    <div class="content1">
        <div class="tinder--status">
            <i class="fa fa-times"></i>
            <i class="fa fa-heart"></i>
        </div>
        <div class="card1">
            <c:forEach items="${users}" varStatus="theUser">

                <div class="user">
                    <a class="carousel-control-prev" href="#${theUser.index}" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#${theUser.index}" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                    <div id="${theUser.index}" class="carousel slide" data-ride="carousel" data-interval="10000"
                         style="pointer-events: none !important;">
                        <ol class="carousel-indicators" style="pointer-events: none !important;">
                            <c:forEach items="${users[theUser.index].photos}">

                                <li style="margin-top: -535px" data-target="#${theUser.index}" data-slide-to="0"
                                    class="active"></li>
                            </c:forEach>
                        </ol>

                        <div class="carousel-inner" style="pointer-events: none !important;">

                            <c:choose>
                                <c:when test="${users[theUser.index].photoLength<2}">
                                    <div class="carousel-item active" style="pointer-events: none !important;">
                                        <img style="height: 565px" src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<3}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<4}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[2].link}"
                                             alt="Third slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<5}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[2].link}"
                                             alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[3].link}"
                                             alt="Four slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<6}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[2].link}"
                                             alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[3].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[4].link}"
                                             alt="Four slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<7}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[2].link}"
                                             alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[3].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[4].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[5].link}"
                                             alt="Four slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<8}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[2].link}"
                                             alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[3].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[4].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[5].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[6].link}"
                                             alt="Four slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<9}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[2].link}"
                                             alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[3].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[4].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[5].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[6].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[7].link}"
                                             alt="Four slide">
                                    </div>
                                </c:when>
                                <c:when test="${users[theUser.index].photoLength<10}">
                                    <div class="carousel-item active">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[0].link}"
                                             alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[1].link}"
                                             alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[2].link}"
                                             alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[3].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[4].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[5].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[6].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[7].link}"
                                             alt="Four slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img style="height: 565px" class="d-block w-100"
                                             src="${users[theUser.index].photos[8].link}"
                                             alt="Four slide">
                                    </div>

                                </c:when>
                                <c:otherwise>
                                    <div></div>
                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                    <div class="profile">
                        <div style=" pointer-events: none !important;"
                             class="name">${users[theUser.index].fristname} ${users[theUser.index].lastname}
                            <span>${users[theUser.index].nowYear-users[theUser.index].yearBirthday}</span>
                        </div>
                        <div class="local1" style=" pointer-events: none !important;">
                            <div class="local-detail">
                                <i class="live-icon"></i>
                                <span style="font-size: 17px">${users[theUser.index].citylive}</span>
                            </div>
                        </div>
                        <div class="gender" style="pointer-events: none !important;">
                            <div class="sex-container">
                                <i class="sex-icon"></i>
                                <span style="font-size: 17px" class="sex-name">${users[theUser.index].gender}</span>
                            </div>
                        </div>
                        <div class="info-detail">
                            <button class="info-icon" id="more-info" title="More info"><img class="info-img"
                                                                                            src="img/info.png" alt="">
                            </button>
                        </div>
                        <div class="more-info">

                        </div>
                    </div>
                    <input type="hidden" class="getTheUserIndex" value="${users[theUser.index].id}"></input>
                </div>


            </c:forEach>

        </div>

        <div class="buttons" id="btn-like-nope">
            <button class="no" id="nope" style="border: none">
                <i class="fas fa-times"></i>
            </button>
            <button class="star" style="border: none">
                <i class="fas fa-star fa"></i>
            </button>
            <button class="heart" id="like" style="border: none">
                <i class="fas fa-heart"></i>
            </button>
        </div>


    </div>

</div>

<script src="https://hammerjs.github.io/dist/hammer.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(changeHomePageImg);
    $(swipe);
    let currentCard;
    let idUser;

    function changeHomePageImg() {

        let imageUrl = "img/homepage1.png";
        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("homepage_img").style.backgroundColor = "#ffe0e4";
        document.getElementById("homepage-btn").style.borderBottom = "4px solid #fd5068";

    }

    /*    let xyz = document.getElementsByClassName('.user:not(.removed)');*/


    let htmlString = `
                                    <div class="school">
                        <div class="school-container">
                            <i class="school-icon"></i>
                            <span class="school-name">${users[xyz].school}</span>
                        </div>
                    </div>
                    <div class="work">
                        <div class="work-container">
                            <i class="work-icon"></i>
                            <span class="work-name">${users[xyz].work}</span>
                        </div>
                    </div>


                    <div class="about">
                        <div class="about-container">
                            <span class="about-name">${users[xyz].about}</span>
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
                    `

    /*    const parent = document.querySelector('.more-info');
        $('#more-info').click(function () {
            parent.insertAdjacentHTML('beforeend',htmlString)
        });*/


    $('#homepage-btn').click(function () {
        window.location = 'http://localhost:8888/home';
    });

    /*    $('#match-btn-side').click(function () {
            window.location = 'http://localhost:8888/match';
        });*/

    $('#match-btn-side').click(function () {
        window.location = 'http://localhost:8888/test1';
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


    async function swipe() {

        let tinderContainer = document.querySelector('.content1');
        let allCards = document.querySelectorAll('.user');
        let nope = document.getElementById('nope');
        let love = document.getElementById('like');


        function initCards(card, index) {
            let newCards = document.querySelectorAll('.user:not(.removed)');
            currentCard = document.querySelector('.user:not(.removed)');

            idUser = parseInt(currentCard.querySelector("input").value);
            console.log('init:  ', idUser);


            newCards.forEach(function (card, index) {
                card.style.zIndex = allCards.length - index;
                /* card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';*/
                card.style.opacity = (10 - index) / 10;
            });

            tinderContainer.classList.add('loaded');
        }

        initCards();

        allCards.forEach(function (el) {
            let hammertime = new Hammer(el);

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

            hammertime.on('panend', async function (event) {
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

                    console.log(event.deltaX)

                    if (event.deltaX > 0) {
                        await save();
                        matchrest();
                    }


                    event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
                    console.log('init bay')
                    initCards();
                }
            });
        });


        function createButtonListener(love) {
            return async function (event) {
                click(love);
                event.preventDefault();

            }
        }

        let nopeListener = createButtonListener(false);
        let loveListener = createButtonListener(true);


        nope.addEventListener('click', nopeListener);
        love.addEventListener('click', loveListener);

    }

    async function click(love) {
        var cards = document.querySelectorAll('.user:not(.removed)');
        var moveOutWidth = document.body.clientWidth * 1.5;

        if (!cards.length) return false;

        var card = cards[0];

        card.classList.add('removed');

        if (love) {
            card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
        } else {
            card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
        }

        console.log('1')
        await save();
        await matchrest();
        console.log('3')

        initCards();


    }

    function save() {
        return new Promise((resolve, reject) => {
            console.log(idUser)

            var saveData = $.ajax({
                type: 'POST',
                url: "like",
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({id: idUser}),

                success: function (resultData) {
                    /*  alert("Save Complete")*/
                    console.log('2')
                    resolve(1)
                },
                error: function (e) {
                    resolve(1)

                }
            });
        })
    }

    function matchrest() {
        return new Promise((resolve, reject) => {
            console.log(idUser)

            var saveData = $.ajax({
                type: 'POST',
                url: "/match-modal",
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({id: idUser}),

                success: function (resultData) {
                      alert("Save Complete")
                    console.log('2')
                    resolve(1)
                },
                error: function (e) {
                    resolve(1)

                }
            });
        })
    }


</script>

</body>

</html>

