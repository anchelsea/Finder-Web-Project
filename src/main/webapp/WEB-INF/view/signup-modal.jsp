<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<%--Sign up--%>
<div class="ui modal signup" id="signup" style="max-width: 50%"  >

    <img src="img/favicon-32x32.png" alt="finder" id="logo1" style="align-items: center">
    <div class="header" style="font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif" >CREATE ACCOUNT</div>
    <div class="form_sign-up">
        <div class="login-with">
            <div>
                <button class="ui facebook button" style="align-content: center" id="fb-btn1">
                    <i class="facebook icon"></i>
                    Sign in with Facebook
                </button>
            </div>
            <div>
                <button class="ui google plus button" style="align-content: center" id="gg-btn1">
                    <i class="google plus icon"></i>
                    Sign in with Google
                </button>
            </div>
        </div>
    </div>

    <br>
    <div class="ui horizontal divider" id="or1">or</div>
    <br>
    <form class="ui form sign1"  enctype="multipart/form-data" >
        <div class="field">
            <label style="font-size: 16px">Email</label>
            <input  name="email1" placeholder="Email" id="Email-Signup" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email must be in the following order: characters@characters.domain !" required/>
        </div>
        <div class="field">
            <label style="font-size: 16px">Username</label>
            <input type="text" name="username1" id="Username-Signup" placeholder="Username" required/>
        </div>
        <div class="field">
            <label style="font-size: 16px">Password</label>
            <input type="password" name="password1" id="Password-Signup" placeholder="Password" required/>
        </div>
        <div class="field">
            <label style="font-size: 16px">Confirm Password</label>
            <input type="password" name="rePassword1" id="RePassword-Signup" placeholder="Confirm Password" required/>
        </div>
        <div class="inline field">
            <div class="ui checkbox">
                <input type="checkbox" name="terms" required>
                <label>I agree to the terms and conditions</label>
            </div>
        </div>
        <button class="ui orange button" id="login-btn-form1" style="font-size: 17px">Signup</button>
    </form>


    <div class="actions">
        <div class="ui error message signup" id="generalErrorMessage1" style="display: none"></div>
        <div class="ui cancel button">Cancel</div>
    </div>

</div>

<script type="text/javascript">
    console.log('cccccccccccccc')
    function signupModal() {
        $('.ui.modal.signup')
            .modal('show')
        ;



        let password123 = document.getElementById("Password-Signup")
            , confirm_password123 = document.getElementById("RePassword-Signup");

        function validatePassword(){
            if(password123.value != confirm_password123.value) {
                confirm_password123.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password123.setCustomValidity('');
            }
        }

        password123.onchange = validatePassword;
        confirm_password123.onkeyup = validatePassword;

        $('.ui.form.sign1').validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                username: {
                    required:true,
                }
                ,
                password:   {
                    required: true,
                    rangelength:[8,16]
                },
                rePassword: {
                    required: true,


                }
            },  //end rules
            messages: {
                email: {
                    required: 'Required field',
                    email: 'This is not a valid email address'
                },
                username: {
                    required: 'Required field',
                    username: 'This is not a valid email address'
                },
                password: {
                    required: 'Required field',
                    password: 'Password must be between 8 and 16 characters long'
                },
                rePassword: {
                    required: 'Please type a password',
                    rangelength: 'Password must be between 8 and 16 characters long.'
                }
            },//end messages
            errorPlacement: function(error, element) {
                if( element.is(':radio') || element.is(':checkbox')) {
                    error.appendTo(element.parent());
                } else {
                    error.insertAfter(element);
                }
            },//end errorPlacement
            showErrors: function(errorMap, errorList) {
                if (submitted) {
                    let summary = "You have the following errors: <br/>";
                    $.each(errorList, function() { summary += " * " + this.message + "<br/>"; });
                    $("#generalErrorMessage1").html(summary);
                    submitted = false;
                }

                this.defaultShowErrors();
            },
            invalidHandler: function(form, validator) {

                submitted = true;

            }

        });
    }





    let UsernameField = $('#Username-Signup');
    let RePasswordlField = $('#RePassword-Signup');
    let PasswordField1 = $('#Password-Signup');
    let EmailField1 = $('#Email-Signup');
    let GeneralErrorField1 = $('#generalErrorMessage1');




    $('.ui.form.sign1').form({
        fields: {
            email     : 'empty',
            username: 'empty',
            password   : 'empty',
            rePassword: 'empty'
        },
        onSuccess: function(event, fields) {
            event.preventDefault();
            let email = EmailField1.val();
            let username=UsernameField.val();
            let password = PasswordField1.val();
            let rePassword=RePasswordlField.val();


            $.ajax({
                type: "POST",
                url: "modal-signup",
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({email:email,username: username, password:password,rePassword:rePassword}),
                success: function (response) {
                    console.log(response)
                    if (response.status == 'FAIL') {
                        showFormError(response.errorMessageList);
                    } else {
                        //everything is O.K. user logged in successfully.
                        $('.ui.modal.signup').modal('hide');
                        $('.success').fadeIn(100).show();
                        //window.location.replace('http://localhost:8888/');
                        // window.location.reload();
                    }
                },
                error: function (ex) {
                    console.log(ex);
                }
            });

            function showFormError(errorVal) {

                //show error messages that comming from backend and change border to red.
                for (let i = 0; i < errorVal.length; i++) {
                    if (errorVal[i].fieldName === 'email') {

                        clearForm();
                        EmailField1.attr("placeholder", "Email").css("border", " 2px solid red");
                        GeneralErrorField1.css("display", "block").html(errorVal[i].message);
                    }
                    else if (errorVal[i].fieldName === 'username') {
                        UsernameField.val('');
                        UsernameField.attr("placeholder", "Username").css("border", " 2px solid red");
                        GeneralErrorField1.css("display", "block").html(errorVal[i].message);
                    }
                    else if (errorVal[i].fieldName === 'password') {
                        PasswordField1.val('');
                        PasswordField1.attr("placeholder", "Password").css("border", " 2px solid red");
                        GeneralErrorField1.css("display", "block").html(errorVal[i].message);
                    }
                    else if (errorVal[i].fieldName === 'rePassword') {
                        PasswordField1.val('');
                        PasswordField1.attr("placeholder", "RePassword").css("border", " 2px solid red");
                        GeneralErrorField1.css("display", "block").html(errorVal[i].message);
                    }

                }
            }
            //remove error warning tags and change tips
            function clearError() {

                //clear all and return it as default.
                $('#Email-Signup').focus(function () {
                    clearForm();
                    EmailField1.css("border", "2px solid lightgrey");
                    EmailField1.attr("placeholder", "Email address");
                });
                $('#Username-Signup').focus(function () {
                    UsernameField.val('');
                    UsernameField.css("border", "2px solid lightgrey");
                    UsernameField.attr("placeholder", "Password");
                });
                $('#Password-Signup').focus(function () {
                    PasswordField1.val('');
                    PasswordField1.css("border", "2px solid lightgrey");
                    PasswordField1.attr("placeholder", "Password");
                });
            }
            //clear fields and hide error tag.
            function clearForm() {

                EmailField1.val('');
                GeneralErrorField1.css("display", "none");
            }
        }


    })
</script>




