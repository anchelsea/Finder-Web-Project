<%@ page import="com.an.finder.entity.User" %>
<%@ page import="com.an.finder.entity.Interest" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/semantic.css">


    <link rel="icon" href="img/like.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://res.cloudinary.com/dxfq3iotg/raw/upload/v1569006288/BBBootstrap/choices.min.css?version=7.0.0">
    <script src="https://res.cloudinary.com/dxfq3iotg/raw/upload/v1569006273/BBBootstrap/choices.min.js?version=7.0.0"></script>

<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/transition.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/dropdown.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/transition.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/dropdown.min.css">--%>



    <script src="js/lib/jquery.js"></script>
    <script src="js/lib/semantic.js"></script>
    <script src="js/lib/Semantic-UI-Alert.js"></script>
    <title>My Profile | Dating, Make Friends & Meet New People</title>
</head>
<body style="background: #f5f7fa">

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
        <div class="card-edit" id="card-id">
            <div class="height-card">
                <div class="image-edit">
                    <ul class="image-edit-container">
                        <div class="image-container1">
                            <li class="image">
                                <div class="image-edit1">

                                    <%-- <img src="${user.photos[0].link}" alt="">--%>

                                    <c:choose>
                                        <c:when test="${user.photoLength!=null}">
                                            <img src="${user.photos[0].link}" alt="">
                                        </c:when>
                                        <c:when test="${user.photoLength==null}">
                                            <img src="img/minyoung.jpg" alt="">
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div>
                                    <button class="btn-add1">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="image-edit1">
                                    <c:choose>
                                        <c:when test="${user.photoLength < 2}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>

                                        <c:otherwise>
                                            <img src="${user.photos[1].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>


                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="image-edit1">

                                    <c:choose>
                                        <c:when test="${user.photoLength < 3}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${user.photos[2].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>

                                    <img src="" alt="" onerror="this.style.display='none'">
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                        </div>


                        <div class="image-container2">
                            <li class="image">
                                <div class="image-edit1">
                                    <c:choose>
                                        <c:when test="${user.photoLength < 4}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${user.photos[3].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="image-edit1">
                                    <c:choose>
                                        <c:when test="${user.photoLength < 5}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${user.photos[4].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="image-edit1">
                                    <c:choose>
                                        <c:when test="${user.photoLength < 6}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${user.photos[5].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                        </div>

                        <div class="image-container3">
                            <li class="image">
                                <div class="image-edit1">
                                    <c:choose>
                                        <c:when test="${user.photoLength < 7}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${user.photos[6].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="image-edit1">
                                    <c:choose>
                                        <c:when test="${user.photoLength < 8}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${user.photos[7].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                            <li class="image">
                                <div class="image-edit1">
                                    <c:choose>
                                        <c:when test="${user.photoLength < 9}">
                                            <div id="imagePreview">
                                                <img src="" alt="" onerror="this.style.display='none'">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${user.photos[8].link}" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <button class="">+</button>
                                </div>
                            </li>
                        </div>
                    </ul>
                </div>
                <form:form action="${pageContext.request.contextPath}/edit" method="POST" enctype="multipart/form-data"
                           modelAttribute="user">
                    <div class="add-media">
                        <input <%--multiple--%> name="photo" id="embedpollfileinput" type="file" (change)="fileEvent($event)"
                               class="inputfile" onchange="return fileValidation()" style="display: none"/>
                        <div id="add-media">ADD MEDIA</div>
                    </div>

                    <div class="about-edit">
                        <label class="text-about">
                            ABOUT ME
                        </label>
                        <form:textarea path="about" class="input-about" type="text"
                                       style="box-sizing: border-box;"></form:textarea>
                        <div class="max-text" style="font-weight: bold">500</div>
                    </div>

<%--                    <div class="interest">
                        <label id="label-interest">INTERESTED IN</label>

                      &lt;%&ndash;  <div class="row d-flex justify-content-center mt-100">&ndash;%&gt;
                            <div class="col-md-6" id="select-interest">
                                <select id="choices-multiple-remove-button" placeholder="Select upto 5 interest tags" name="interest_tag" id="dropdown-interest"  multiple>
                                <c:forEach var="i" items="${interest}">
                                    <option  value="${i.name}">${i.name}</option>
                                </c:forEach>
                            </select>
                            </div>
                   &lt;%&ndash;     </div>&ndash;%&gt;
                    </div>--%>

                    <div class="field">
                        <label id="label-interest1">INTERESTED IN</label>
                        <select name="interest_tag" multiple="" class="ui dropdown" id="dropdown-interest" path="interest">
                            <option value="">Select Your Interests</option>
                            <c:forEach var="i" items="${interest}">
                                <option value="${i.name}" >${i.name}</option>
                            </c:forEach>
                        </select>
                    </div>



                    <div class="job-edit">
                        <label class="text-job">
                            JOB TITLE
                        </label>
                        <form:input path="work" class="input-job" placeholder="Add Job" type="text"></form:input>
                    </div>
                    <div class="school-edit">
                        <label class="text-school">
                            SCHOOL
                        </label>
                        <form:input path="school" class="input-school" placeholder="Add School"
                                    type="text"></form:input>
                    </div>
                    <div class="living-edit">
                        <label class="text-living">
                            LIVING IN
                        </label>
                        <form:input path="citylive" class="input-living" placeholder="Add Living In"
                                    type="text"></form:input>

                    </div>
<%--                    <div class="gender-edit">
                        <label class="text-gender">
                            GENDER
                        </label>

                        <select class="gender-select" id="gender" name="gender">
                           &lt;%&ndash; <form:input type="hidden" name="gender" path="gender"></form:input>&ndash;%&gt;

                               <form:input type="hidden" name="gender" path="gender"></form:input>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>--%>

                    <div class="field">
                        <label id="gender-label">GENDER</label>
                        <div class="ui selection dropdown">
                            <form:input path="gender"  type="hidden" name="gender"  ></form:input>
                            <i class="dropdown icon"></i>
                            <div class="default text">Gender</div>
                            <div class="menu">
                                <div class="item" data-value="male">Male</div>
                                <div class="item" data-value="female">Female</div>
                                <div class="item" data-value="other">Other Gener</div>
                            </div>
                        </div>
                    </div>


                    <div class="buttons">
                        <div class="save-info">
                            <button class="save-info-btn">Save</button>
                        </div>
                    </div>
                </form:form>
            </div>

        </div>


    </div>

</div>

<script type="text/javascript">
    let interests = [];
    <% List<Interest> interestList = ((User)session.getAttribute("user")).getInterest(); %>
    <% for(int i = 0; i < interestList.size(); i++) { %>
        interests.push('<%=interestList.get(i)%>');
    <% } %>
    $('#dropdown-interest').dropdown('set selected',interests);
    $(changeHomePageImg);
 /*   $(interest_list)*/

    function changeHomePageImg() {

        /*$("#homepage_img").css("background-image", "url(" + imageUrl + ")");*/
        document.getElementById("profile-btn").style.backgroundColor = "#ffe0e4";
        document.getElementById("title-profile").style.backgroundColor = "#ffe0e4";

    }


    function fileValidation() {
        let fileInput =
            document.getElementById('embedpollfileinput');

        let filePath = fileInput.value;

        // Allowing file type
        let allowedExtensions =
            /(\.jpg|\.jpeg|\.png|\.gif)$/i;

        if (!allowedExtensions.exec(filePath)) {
            alert('Invalid file type! Type file must be JPG/JPEG/PNG/GIF.');
            fileInput.value = '';
            return false;
        } else {

            // Image preview
            if (fileInput.files && fileInput.files[0]) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById(
                        'imagePreview').innerHTML =
                        '<img src="' + e.target.result
                        + '"/>';
                };

                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    }


    function showPreviewImage() {
        $('.ui.modal.preview').modal('show');
    }

    $(document).ready(function(){

        let multipleCancelButton = new Choices('#dropdown-interest', {
            removeItemButton: true,
            maxItemCount:5,
            minItemCount:1,
            searchResultLimit:10,
            renderChoiceLimit:26
        });

    });



    $('#add-media').click(function () {
        $('#embedpollfileinput').click();
    });

    $('#edit-profile-btn1').click(function () {
        window.location = 'http://localhost:8888/profile';
    });

    $('.ui.dropdown')
        .dropdown();

    $('.dropdown').dropdown('set selected', ${user.gender});//no effect



    function interest_list() {
        var validation_settings = {
            inline: true,
            on: 'blur'
        };
        var validation_rules =
            {
                interest_tag: {
                    identifier: 'interest_tag',
                    rules: [
                        {
                            type: 'maxCount[5]',
                            prompt: 'Please select a max of 5 your interested in'
                        }
                    ]
                }
            };
        $('.ui.form').form(validation_rules, validation_settings);
        $('.dropdown')
            .dropdown({})
        ;
    }

</script>

</body>
</html>

