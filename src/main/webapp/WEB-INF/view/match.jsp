<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="match" id="match-${users}">
                            <button class="card">
                                <div class="user">
                                    <img class="user_1" src="${theUser.photos[0].link}" alt=""/>
                                    <div class="name">${theUser.lastname}</div>
                                </div>
                            </button>
                        </div>
            </c:forEach>
        </div>

    </div>

    <%--Mess--%>
    <div class="mess">
        <div class="space"></div>
        <div class="mess-header">
            <div class="avatar1">
                <div><img src="img/pimchanok.jpg" class="avatar-header-mess" alt=""/></div>
                <div class="title">You matched with Pimnachok on 11/12/2020</div>
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
            <div class="ui grid "  id="matchContainer">

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


    users.forEach(users => {

        let gernesHtml = ''
        for(let i = 0; i < users.length;i++){
            if(i == users.length -1){
                gernesHtml += '#'+users[i].id
            }
            else{
                gernesHtml += '#'+users[i].id +', '

            }
        }

    let htmlString = `
                                    <div class="profile">
        <div class="profile-container">
            <div class="space"></div>
            <div class="card">
                <div>
                    <div class="image-profile">
                        <img src="img/pimchanok.jpg">
                    </div>
                </div>

                <div class="content">
                    <div class="name-profile">
                        <h1 class="name">{users.lastname}</h1>
                        <span class="age">22</span>
                    </div>
                    <div class="local">
                        <i class="local-icon"></i>
                        <span> 20 kilometer away</span>
                    </div>
                    <div class="sex-container">
                        <i class="sex-icon"></i>
                        <span class="sex-name">Woman</span>
                    </div>
                    <div class="school-container">
                        <i class="school-icon"></i>
                        <span class="school-name">PTIT</span>
                    </div>
                    <div class="live-container">
                        <i class="live-icon"></i>
                        <span class="live-name">Ho Chi Minh City</span>
                    </div>
                </div>
                <div class="description">
                    <p class="descrip-detail">Hello every one! No ONS please!</p>
                </div>
            </div>
        </div>

        <div class="unmatch-container">
            <button class="unmatch-btn">UNMATCH</button>
            <button class="report-btn">REPORT</button>
        </div>
    </div>
                    `

    $(document).ready(function(){
        $('#show').click(function() {
            $('.menu').toggle("slide");
        });
    });

   /* let gameContainer = document.getElementById('matchContainer');*/
    $('#matchContainer').click(function () {
        parent.insertAdjacentHTML('beforeend',htmlString)
    });

</script>
</body>
</html>