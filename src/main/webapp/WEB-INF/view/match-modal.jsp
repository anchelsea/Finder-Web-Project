<link rel="stylesheet" href="${pageContext.request.contextPath}/css/discover.css">
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