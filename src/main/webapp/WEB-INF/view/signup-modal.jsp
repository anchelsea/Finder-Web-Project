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
    <div id="or1">
        <b> <h4 style="text-align: center">OR</h4></b>
    </div>
    <br>
    <form class="ui form sign1"  enctype="multipart/form-data" >
        <div class="field">
            <label style="font-size: 16px">Email</label>
            <input  name="email" placeholder="Email" />
        </div>
        <div class="field">
            <label style="font-size: 16px">Username</label>
            <input type="text" name="username" placeholder="Username" />
        </div>
        <div class="field">
            <label style="font-size: 16px">Password</label>
            <input type="text" name="password" placeholder="Password" />
        </div>
        <div class="field">
            <label style="font-size: 16px">Retype Password</label>
            <input type="text" name="retype-password" placeholder="Retype Password">
        </div>
        <div class="field">
            <div class="ui checkbox">
                <input type="checkbox" tabindex="0" class="hidden">
                <label>Show Password</label>
            </div>
        </div>
        <button class="ui orange button" id="login-btn-form1" style="font-size: 17px">Signup</button>
    </form>


    <div class="actions">
        <div class="ui error message"></div>
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