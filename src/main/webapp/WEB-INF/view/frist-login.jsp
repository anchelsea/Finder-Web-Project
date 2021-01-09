<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="img/like.png">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="css/semantic.css">
    <link rel="stylesheet" href="css/frist-login.css">

    <script src="js/lib/jquery.js"></script>
    <script src="js/lib/semantic.js"></script>
    <script src="js/lib/Semantic-UI-Alert.js"></script>

    <title>Finder | Dating, Make Friends & Meet New People</title>
</head>



<body>

<div class="frist-login-container">
    <form:form class="ui form segment" action="${pageContext.request.contextPath}/fristlogin" method="POST" enctype="multipart/form-data" modelAttribute="user">
        <h2>Tell Us About Yourself</h2>
        <div class="two fields">

            <div class="field">
                <label>First Name</label>
                <form:input placeholder="First Name" name="fristname" path="fristname" type="text"></form:input>
            </div>
            <div class="field">
                <label>Last Name</label>
                <form:input placeholder="Last name" name="lastname" path="lastname" type="text"></form:input>
            </div>
        </div>

        <div class="two fields">
            <div class="field">
                <label>Gender</label>
                <div class="ui selection dropdown">
                    <form:input type="hidden" name="gender" path="gender"></form:input>
                    <div class="default text">Gender</div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <div class="item" data-value="male">Male</div>
                        <div class="item" data-value="female">Female</div>
                        <div class="item" data-value="other">Other Gender</div>
                    </div>
                </div>
            </div>
            <div class="field">
                <label>BirthDay</label>
                <div class="ui left icon input">
                    <i class="calendar alternate icon"></i>
                    <form:input path="birthday" type="date" name="birthday" ></form:input>
                </div>
            </div>
        </div>

        <div class="field">
            <label>Interested In</label>
            <select name="interest_tag" multiple="" class="ui dropdown" path="interest">
                <option value="">Select Your Interests</option>
                <c:forEach var="i" items="${interest}">
                    <option value="${i.name}" >${i.name}</option>
                </c:forEach>
            </select>
        </div>

        <div>
            <lable class="upload-pic-label">My most beautiful picture is</lable>
        </div>
        <div class="ui middle aligned center aligned grid container" id="upload-file-id">
            <div class="ui fluid segment">

                <input multiple name="photo"  type="file" (change)="fileEvent($event)" class="inputfile" id="embedpollfileinput" onchange="return fileValidation()"/>

         <%--       <label for="embedpollfileinput" class="ui huge green right floated button">
                    <i class="ui upload icon"></i>
                    Upload image
                </label>--%>

                <!-- Image preview -->
                <div>
                    <button onclick="showPreviewImage()" style="margin-top: 20px" class="preview-btn">Image Preview</button>
                </div>

            </div>


        </div>

        <div class="inline field">
            <div class="ui checkbox">
                <input type="checkbox" name="terms">
                <label>I agree to allow turn on my location </label>
            </div>
        </div>
        <div class="ui reset button">Reset</div>
        <div class="ui blue submit button">Continue</div>
        <div class="ui error message"></div>
    </form:form>
</div>
</div>

<script type="text/javascript">
    var validation_settings = {
        inline: true,
        on: 'blur'
    };
    var validation_rules =
        {

            gender: {
                identifier: 'gender',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a gender'
                    }
                ]
            },
            fristname: {
                identifier: 'fristname',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter your firstname'
                    }
                ]
            },
            lastname: {
                identifier: 'lastname',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter your lastname'
                    }
                ]
            },
            age: {
                identifier: 'age',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter your age'
                    }
                ]
            },
            interest_tag: {
                identifier: 'interest_tag',
                rules: [
                    {
                        type: 'maxCount[5]',
                        prompt: 'Please select a max of 5 your interested in'
                    }
                ]
            },
            terms: {
                identifier: 'terms',
                rules: [
                    {
                        type: 'checked',
                        prompt: 'You need to agree to the terms and conditions'
                    }
                ]
            }
        };
    $('.ui.form').form(validation_rules, validation_settings);
    $('.dropdown')
        .dropdown({})
    ;


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
        }
        else
        {

            // Image preview
            if (fileInput.files && fileInput.files[0]) {
                let reader = new FileReader();
                reader.onload = function(e) {
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

    $('#cancel-frist-login').click(function() {
        window.location='http://localhost:8888/';
    });
</script>
</body>

<div class="ui modal preview" >

    <div class="header" style="text-align: center">
        Preview Image
    </div>

    <div id="imagePreview" style="align-items: center"></div>
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


</html>
