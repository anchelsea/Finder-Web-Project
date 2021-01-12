<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script src="js/lib/jquery.js"></script>
    <script src="js/lib/semantic.js"></script>
    <script src="js/lib/Semantic-UI-Alert.js"></script>
    <title>Match | Finder</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <div class="side">
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
                <div>
                    <div class="image-profile">
                        <img src="${currentMatchUser.photos[0].link}">
                    </div>
                </div>

                <div class="content">
                    <div class="name-profile">
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

                </div>
                <div class="description">
                    <p class="descrip-detail">${currentMatchUser.about}</p>
                </div>
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