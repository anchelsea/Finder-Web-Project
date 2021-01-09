<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/discover.css">
    <link rel="stylesheet" href="css/semantic.css">
    <link rel="icon" href="img/like.png">

    <script src="js/lib/jquery.js"></script>
    <script src="js/lib/semantic.js"></script>
    <script src="js/lib/Semantic-UI-Alert.js"></script>
    <title>Discover Setting | Dating, Make Friends & Meet New People</title>
</head>

<div class="ui modal location" >
    <div class="header" style="text-align: center">
        Location
    </div>
    <div class="title-current-location" style="background-color: rgba(213,213,213,0.42)">CURRENT LOCATION</div>
    <div class="content-location">
        <div class="img-location">
            <img src="img/location1.png" alt="">
        </div>
        <div class="info-location">
            <h3 class="info-location-h3">My Current Location</h3>
            <div class="location-text">Tang nhon phu A, District 9, Ho Chi Minh City, Vietnam</div>
        </div>
        <div class="img-check">
            <img src="img/check.png" alt="">
        </div>
    </div>
    <div class="actions">
        <div class="ui black deny button">
            Cancel
        </div>
        <div class="ui positive right labeled icon button">
            Done
            <i class="checkmark icon"></i>
        </div>
    </div>
</div>


<div class="ui modal gender" >

    <div class="header" style="text-align: center">
        Gender
    </div>

    <div class="content-gender" id="content-gender-man" onclick="changeInfoGenderMan()">
        <div class="gender-name">
                <span class="gender-span">Man</span>
        </div>
        <div class="img-check1" id="image-check-men" style="visibility: hidden">
            <img src="img/check1.png" alt="">
        </div>
    </div>
    <div class="content-gender" id="content-gender-woman" onclick="changeInfoGenderWoman()">
        <div class="gender-name" >
            <span class="gender-span">Women</span>
        </div>
        <div class="img-check1" id="image-check-women" style="visibility: visible">
            <img src="img/check1.png" alt="">
        </div>
    </div>
    <div class="content-gender" id="content-gender-everyone" onclick="changeInfoEveryone()">
        <div class="gender-name" >
            <span class="gender-span">Everyone</span>
        </div>
        <div class="img-check1" id="image-check-everyone" style="visibility: hidden">
            <img src="img/check1.png" alt="">
        </div>
    </div>
    <div class="lable-note" id="lable-note-gender">You will see only Women in discovery.</div>
    <div class="actions">
        <div class="ui black deny button">
            Cancel
        </div>
        <div class="ui positive right labeled icon button">
            Done
            <i class="checkmark icon"></i>
        </div>
    </div>
</div>
<body>

<jsp:include page="header.jsp"></jsp:include>\

<div class="space">

</div>


<div class="container">

    <div class="side">
        <div>
            <button class="header">
                <div class="avatar">
                    <img src="img/discover2.png" alt=""/>
                </div>
                <div class="title">Discover Setting</div>
            </button>
        </div>

        <div class="side-btn">
            <div class="avatar1" onclick="showModalChoiceLocation()">
                <lable class="location-lable">Location</lable>
                <span class="location-span">Ho Chi Minh,Viet Nam</span>
                <label class="arrow"> > </label>
            </div>
        </div>
        <div class="side-btn">
            <div class="avatar1" id="distance-range-id">
                <div class="info-discover-distance">
                    <lable class="distance-lable">Max distance</lable>
                    <span class="distance-span" id="distance-value">2km.</span>
                    <lable class="km-lable">  Km.</lable>
                </div>
                <div class="slide-distance">
                    <input type="range" min="2" max="100" value="0" class="slider" id="myDistanceRange">
                </div>
            </div>
        </div>
        <div class="side-btn">
            <div class="avatar1" onclick="showModalChoiceGender()">
                <lable class="looking-lable">Looking For</lable>
                <span class="looking-span">Women</span>
                <label class="arrow"> > </label>
            </div>
        </div>
        <div class="side-btn">
            <div class="avatar1" id="age-range-id">
                <div class="info-agerange">
                    <lable class="agerange-lable">Age Range</lable>
                    <lable class="age-value-lable">18 - </lable>
                    <span class="agerange-span" id="agerange-value">18 - 25</span>
                </div>


                <div class="slide-agerange">
                    <input type="range" min="18" max="55" value="22" class="slider" id="myAgeRange">
                </div>
            </div>
        </div>

        <div class="btn-done">
            <button class="done" id="done-discover-btn">
             DONE
            </button>
        </div>

    </div>
</div>



<script type="text/javascript">
    $(changeHomePageImg);
    $(changeSliderValue);
    $(changeSliderValue1);
 /*   $(changeInfoGender());*/

    $('#done-discover-btn').click(function() {
        window.location='http://localhost:8888/home';
    });

    function changeHomePageImg() {

        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("discover_img").style.backgroundColor = "#ffe0e4";
        document.getElementById("discover-btn").style.borderBottom = "4px solid #fd5068";

    }

    function changeSliderValue() {
        let slider = document.getElementById("myDistanceRange");
        let output = document.getElementById("distance-value");
        output.innerHTML = slider.value;

        slider.oninput = function() {
            output.innerHTML = this.value;
        }
    }

    function changeSliderValue1() {
        let slider = document.getElementById("myAgeRange");
        let output = document.getElementById("agerange-value");
        output.innerHTML = slider.value;

        slider.oninput = function() {
            output.innerHTML = this.value;
        }
    }

    function showModalChoiceGender() {
        $('.ui.modal.gender').modal('show');
    }

    function showModalChoiceLocation() {
        $('.ui.modal.location').modal('show');
    }

    function changeInfoEveryone() {
        document.getElementById("lable-note-gender").innerHTML = "You will see only Everyone in discovery";
        document.getElementById("image-check-everyone").style.visibility="visible";


        document.getElementById("image-check-men").style.visibility="hidden";
        document.getElementById("image-check-women").style.visibility="hidden";
    }

    function changeInfoGenderWoman() {
        document.getElementById("lable-note-gender").innerHTML = "You will see only Women in discovery";
        document.getElementById("image-check-women").style.visibility="visible";


        document.getElementById("image-check-men").style.visibility="hidden";
        document.getElementById("image-check-everyone").style.visibility="hidden";
    }

    function changeInfoGenderMan() {
        document.getElementById("lable-note-gender").innerHTML = "You will see only Man in discovery";
        document.getElementById("image-check-men").style.visibility="visible";


        document.getElementById("image-check-women").style.visibility="hidden";
        document.getElementById("image-check-everyone").style.visibility="hidden";
    }

</script>
</body>
</html>

