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
    <form class="ui form segment" >
        <h2>Tell Us About Yourself</h2>
        <div class="two fields">

            <div class="field">
                <label>Frist Name</label>
                <input placeholder="First Name" name="name" type="text">
            </div>
            <div class="field">
                <label>Last Name</label>
                <input placeholder="Last name" name="lastname" type="text">
            </div>
        </div>

        <div class="two fields">
            <div class="field">
                <label>Gender</label>
                <div class="ui selection dropdown">
                    <input type="hidden" name="gender">
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
                <label>Age</label>
                <input type="number" name="age">
            </div>
        </div>

        <div class="field">
            <label>Interested In</label>
            <select name="interest" multiple="" class="ui dropdown">
                <option value="">Select Values</option>
                <option value="1" selected="">Art</option>
                <option value="2">Horror Movies</option>
                <option value="3">Walking</option>
                <option value="4">Baking</option>
                <option value="5">Running</option>
                <option value="6">Working Out</option>
                <option value="7">Blogging</option>
                <option value="8">Hip Hop</option>
                <option value="9">Vlogging</option>
                <option value="10">Sport</option>
                <option value="11">Instagram</option>
                <option value="12">Music</option>
                <option value="13">Facebook</option>
                <option value="14">Clubbing</option>
                <option value="15">Tea</option>
                <option value="16">Fishsing</option>
                <option value="17">Dog lover</option>
                <option value="18">Movies</option>
                <option value="19">Karaoke</option>
                <option value="20">Golf</option>
                <option value="21">Volunteering</option>
                <option value="22">Athlete</option>
                <option value="23">Reading</option>
                <option value="24">Writer</option>
            </select>
        </div>

        <div>
            <lable class="upload-pic-label">My most beautiful picture is</lable>
        </div>
        <div class="ui middle aligned center aligned grid container" id="upload-file-id">
            <div class="ui fluid segment">

                <input type="file" (change)="fileEvent($event)" class="inputfile" id="embedpollfileinput" onchange="return fileValidation()"/>

              <%--  <label for="embedpollfileinput" class="ui huge green right floated button">
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
        <div class="ui black deny button">Cancel</div>
        <div class="ui reset button">Reset</div>
        <div class="ui blue submit button">Continue</div>
    </form>
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
            name: {
                identifier: 'name',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter your name'
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
            interest: {
                identifier: 'interest',
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
</script>
</body>

<div class="ui modal preview" >

    <div class="header" style="text-align: center">
        Preview Image
    </div>

    <div id="imagePreview"></div>
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
