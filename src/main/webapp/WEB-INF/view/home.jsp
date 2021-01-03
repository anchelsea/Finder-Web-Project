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
            <button class="header">
                <div class="avatar">
                    <img src="img/minyoung.jpg" alt=""/>
                </div>
                <div class="title">My profile</div>
            </button>
        </div>
        <div class="side-btn">
            <button class="avatar1">
                <div><img src="img/match2.png" alt=""/></div>
                <div class="title">Matches</div>
            </button>

        </div>
        <div class="side-btn">
            <button class="avatar1">
                <div><img src="img/message2.png" alt=""/></div>
                <div class="title">Message</div>
            </button>
        </div>

        <div class="side-btn">
            <button class="avatar1">
                <div><img src="img/discover2.png" alt=""/></div>
                <div class="title">Discover Setting</div>
            </button>
        </div>


    </div>
    <div class="content">
        <div class="card">
            <div class="user">
                <img
                        class="user"
                        src="img/minyoung.jpg"
                        alt=""
                />
                <div class="profile">
                    <div class="name">Rafaela <span>20</span></div>
                    <div class="local">
                        <div class="local-detail">
                            <i class="fas fa-map-marker-alt"></i>
                            <span> 20 kilometer away</span>
                        </div>
                        <div class="info-detail">
                            <button class="info-icon" title="More info"><img class="info-img" src="img/info.png" alt="">
                            </button>
                        </div>

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
    function changeHomePageImg() {

        let imageUrl = "img/homepage1.png";
        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("homepage_img").style.backgroundColor="#ffe0e4";
        document.getElementById("homepage-btn").style.borderBottom="4px solid #fd5068";

    }
</script>
</body>
</html>

