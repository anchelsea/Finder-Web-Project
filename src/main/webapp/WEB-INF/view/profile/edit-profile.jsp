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
            <button class="header" id="edit-profile-btn1">
                <div class="avatar">
                    <img src="${user.photos[0].link}" alt=""/>
                </div>
                <div class="title">My profile</div>
            </button>
        </div>
        <div class="side-btn">
            <button class="avatar1">
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
    <div class="content1">
        <div class="card-edit">
            <div class="height-card">
                <div class="image-edit">
                    <ul class="image-edit-container">
                        <div class="image-container1" >
                            <li class="image">
                                <div class="">
                                    <img src="${user.photos[0].link}" alt="">

                                </div>
                                <div>
                                    <button class="btn-add1">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                        </div>


                        <div class="image-container2" >
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                        </div>

                        <div class="image-container3" >
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="">
                                    <img src="" alt="">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                        </div>
                    </ul>
                </div>
                <div class="add-media">
                    <button id="add-media">ADD MEDIA</button>
                </div>


                <div class="about-edit">
                    <label class="text-about">
                        ABOUT ME
                    </label>
                    <input class="input-about" type="text" >
                </div>
                <div class="job-edit">
                    <label class="text-job">
                        JOB TITLE
                    </label>
                    <input class="input-job" placeholder="Add Job" type="text" >
                </div>
                <div class="school-edit">
                    <label class="text-school">
                        SCHOOL
                    </label>
                    <input class="input-school" placeholder="Add School" type="text">
                </div>
                <div class="living-edit">
                    <label class="text-living">
                        LIVING IN
                    </label>
                    <input class="input-living" placeholder="Add Living In" type="text">
                </div>
                <div class="gender-edit">
                    <label class="text-gender">
                        GENDER
                    </label>
                    <input class="input-gender" class="gender">
                </div>
                <div class="buttons">
                    <div class="save-info">
                        <button class="save-info-btn">Save</button>
                    </div>
                </div>
            </div>

        </div>


    </div>

</div>

<script type="text/javascript">
    $(changeHomePageImg);
    function changeHomePageImg() {

        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("profile-btn").style.backgroundColor="#ffe0e4";
        document.getElementById("title-profile").style.backgroundColor="#ffe0e4";

    }

    $('#edit-profile-btn1').click(function() {
        window.location='http://localhost:8888/profile';
    });
</script>
</body>
</html>

