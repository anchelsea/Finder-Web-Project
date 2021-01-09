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
            <button class="avatar1" id="logout-btn" >
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
                <img
                        class="user1"
                        src="${user.photos[0].link}"
                        alt=""
                />
                <div class="profile">

                    <div class="name">${user.fristname} ${user.lastname} <span>${user.nowYear-user.yearBirthday}</span></div>
                    <div class="local">
                        <div class="local-detail">
                            <i class="live-icon" ></i>
                            <span>${user.citylive}</span>
                        </div>
<%--                        <div class="info-detail">
                            <button class="info-icon" title="More info"><img class="info-img" src="img/info.png" alt="">
                            </button>
                        </div>--%>
                    </div>
                    <div class="gender">
                        <div class="sex-container">
                            <i class="sex-icon" ></i>
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
/*    let interests = [];


-interest').dropdown('set selected',interests);

    document.getElementById("demo").innerHTML = interests[0];
    $(document).ready(function(){

        let multipleCancelButton = new Choices('#dropdown-interest', {
            removeItemButton: true,
            maxItemCount:5,
            searchResultLimit:10,
            renderChoiceLimit:26
        });

    });*/

    function changeHomePageImg() {

        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("profile-btn").style.backgroundColor="#ffe0e4";
        document.getElementById("title-profile").style.backgroundColor="#ffe0e4";
    }

    $('#logout-btn').click(function() {

        window.location='http://localhost:8888/logout';
    });

    $('#edit-profile-btn').click(function() {
        window.location='http://localhost:8888/edit';
    });


</script>
</body>
</html>

