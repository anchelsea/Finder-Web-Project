<%--Login modal--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<div class="ui modal signin" style="max-width: 50%">

    <img src="img/favicon-32x32.png" alt="finder" id="logo" style="align-items: center">
    <div class="header" style="font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif">GET STARTED</div>
    <div>
        <div class="login-with">
            <div>
                <button class="ui facebook button" style="align-content: center" id="fb-btn">
                    <i class="facebook icon"></i>
                    Login with Facebook
                </button>
            </div>
            <div>
                <button class="ui google plus button" style="align-content: center" id="gg-btn">
                    <i class="google plus icon"></i>
                    Login with Google
                </button>
            </div>
        </div>
    </div>

    <br>
    <div id="or">
        <h4 style="text-align: center">OR</h4>
    </div>
    <br>
    <form class="ui form login">
        <div class="field" style="font-size: 16px">
            <label>Username/Email</label>
            <input type="text" id="Email" name="email" placeholder="Username/Email" required>
        </div>
        <div class="field" style="font-size: 16px">
            <label>Password</label>
            <input type="password" id="Password" name="password" placeholder="Password" required>
        </div>
        <div class="field" style="font-size: 16px">
            <div class="ui checkbox">
                <input type="checkbox" tabindex="0" class="hidden">
                <label>Save password</label>
            </div>
        </div>
        <button class="ui orange button" id="login-btn-form"  style="font-size: 17px">Login</button>
    </form>


    <div class="actions">
        <div class="ui error message" id="generalErrorMessage" style="display:none">
            <i class="exclamation triangle icon" id="error-icon"></i>
        </div>
        <div class="ui cancel button">Cancel</div>
    </div>
</div>





<script type="text/javascript">
    function singinModal() {
        $('.ui.modal.signin')
            .modal('show')
        ;


            $('.ui.form.login').validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password:   {
                        required: true,
                        rangelength:[8,16]
                    }
                },  //end rules
                messages: {
                    email: {
                        required: 'Required field',
                        email: 'This is not a valid email address'
                    },
                    password: {
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
                        $(".ui.modal.signin").html(summary);
                        submitted = false;
                    }

                    this.defaultShowErrors();
                },
                invalidHandler: function(form, validator) {

                    submitted = true;

                }

            });


    }
    let PasswordField = $('#Password');
    let EmailField = $('#Email');
    let GeneralErrorField = $('#generalErrorMessage');
    let IconErrorField = $('#error-icon');

    $('.ui.form.login').form({
        fields: {
            email     : 'empty',
            password   : 'empty'
        },
        onSuccess: function(event, fields) {
            event.preventDefault();
            let email = EmailField.val();
            let password = PasswordField.val();


            $.ajax({
                type: "POST",
                url: "modal-login",
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({email:email,password:password}),
                success: function (response) {
                    console.log(response)
                    if (response.status == 'FAIL') {
                        showFormError(response.errorMessageList);
                    }
                    else  if(response.status=='FIRST'){
                        $('.ui.modal.signin').modal('hide');
                        window.location.replace('http://localhost:8888/fristlogin');
                    }
                    else {
                        //everything is O.K. user logged in successfully.
                        $('.ui.modal.signin').modal('hide');
                        window.location.replace('http://localhost:8888/home');

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
                        EmailField.attr("placeholder", "Email").css("border", " 2px solid red");
                        GeneralErrorField.css("display", "block").html(errorVal[i].message);
                    } else if (errorVal[i].fieldName === 'password') {
                        PasswordField.val('');
                        PasswordField.attr("placeholder", "Password").css("border", " 2px solid red");
                        GeneralErrorField.css("display", "block").html(errorVal[i].message);
                    }
                    /*             else if(errorVal[i].fieldName === 'FORM FAIL'){
                                     clearForm();
                                     GeneralErrorField.css("display", "block").html(errorVal[i].message);
                                 }*/
                    /*   else if(errorVal[i].fieldName === 'FORM FAIL'){
                           clearForm();
                           GeneralErrorField.css("display", "block").html(errorVal[i].message);
                       }*/
                }
            }
            //remove error warning tags and change tips
            function clearError() {

                //clear all and return it as default.
                $('#Email').focus(function () {
                    clearForm();
                    EmailField.css("border", "2px solid lightgrey");
                    EmailField.attr("placeholder", "Email address");
                });
                $('#Password').focus(function () {
                    PasswordField.val('');
                    PasswordField.css("border", "2px solid lightgrey");
                    PasswordField.attr("placeholder", "Password");
                });
            }
            //clear fields and hide error tag.
            function clearForm() {

                EmailField.val('');
                PasswordField.val('');
                GeneralErrorField.css("display", "none");
            }
        }


    })

</script>




