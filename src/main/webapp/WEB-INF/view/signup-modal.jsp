<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<%--Sign up--%>
<div class="ui modal signup"  style="max-width: 50%"  >

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
            <input  name="email" placeholder="Email"  required/>
        </div>
        <div class="field">
            <label style="font-size: 16px">Username</label>
            <input type="text" name="username" placeholder="Username" required/>
        </div>
        <div class="field">
            <label style="font-size: 16px">Password</label>
            <input type="text" name="password" placeholder="Password" required/>
        </div>
        <div class="field">
            <label style="font-size: 16px">Retype Password</label>
            <input type="text" name="password1" placeholder="Retype Password" required>
        </div>
        <div class="inline field">
            <div class="ui checkbox">
                <input type="checkbox" name="terms" required>
                <label>I agree to the terms and conditions</label>
            </div>
        </div>
        <button class="ui orange submit button" id="login-btn-form1" type="submit" style="font-size: 17px">Signup</button>
    </form>


    <div class="actions">
        <div class="ui error message signup" style="display: none"></div>
        <div class="ui cancel button">Cancel</div>
    </div>

</div>

<script>
    function signupModal() {
        $('.ui.modal.signup')
            .modal('show')
        ;
    }
</script>

<script>
    $('.ui.form.sign1').validate({
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
                $(".ui.modal.signup").html(summary);
                submitted = false;
            }

            this.defaultShowErrors();
        },
        invalidHandler: function(form, validator) {
            submitted = true;
        }
    });
</script>