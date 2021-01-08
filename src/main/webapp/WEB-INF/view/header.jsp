<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

<div id="main-container">
    <header id="header">
        <button id="finder-btn"> <img id="finder-img" src="img/finder.png"  /> </button>


        <button id="homepage-btn"  title="Home" >  <img src="img/homepage.png" id="homepage_img" /> </button>
        <button id="match-btn" title="Match"> <img src="img/match.png" id="match_img"/> </button>
        <button id="message-btn" title="Message"> <img src="img/message.png" id="message_img"/> </button>
        <button id="discover-btn" title="Discover Setting"> <img src="img/discover.png" id="discover_img"/> </button>

        <button class="profile_btn" title="Profile" id="profile-btn">
            <div class="avatar">
                <img src="${user.photos[0].link}" alt="" />
            </div>
            <div class="title" id="title-profile">${user.fristname} ${user.lastname}</div>
        </button>

        <button class="setting_btn" title="Setting"  id="setting-btn"> <img src="img/setting.png" id="setting_img"/> </button>

    </header>

    <script>
        $('#finder-btn').click(function() {
            window.location='http://localhost:8888/home';
        });

        $('#homepage-btn').click(function() {
            window.location='http://localhost:8888/home';
        });


        $('#match-btn').click(function() {
            window.location='http://localhost:8888/match';
        });

        $('#message-btn').click(function() {
            window.location='http://localhost:8888/message';
        });

        $('#discover-btn').click(function() {
            window.location='http://localhost:8888/discover';
        });

        $('#profile-btn').click(function() {
            window.location='http://localhost:8888/profile';
        });
    </script>

</div>