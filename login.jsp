 <!DOCTYPE html>
<html>

<head>
    <title>Login Form</title>
    <link rel="stylesheet" href="clogin.css">
    <script type="text/javascript">
        function validateForm() {
            var username = document.getElementById("t1").value;
            var password = document.getElementById("t2").value;
            var usernameValid = username.length >= 3;
            var passwordValid = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(password);

            if (!usernameValid || !passwordValid) {
                var message = "Please correct the following errors:\\n";
                if (!usernameValid) {
                    message += "- Username must be at least 3 characters long.\\n";
                }
                if (!passwordValid) {
                    message += "- Password must be at least 8 characters long and include at least one lowercase letter, one uppercase letter, one digit, and one special character.";
                }
                alert(message);
                return false; 
            }
            return true; 
        }
        function redirectToGoogle() {
            // Replace this URL with your Google OAuth redirect URL
            const googleAuthUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id=YOUR_CLIENT_ID&redirect_uri=YOUR_REDIRECT_URI&response_type=code&scope=email profile";
            window.location.href = googleAuthUrl;
        }
    </script>
</head>

<body>
    <form action="login1.jsp" method="post" onsubmit="return validateForm()">
        <%
            String errorMessage = request.getParameter("error");
            if (errorMessage != null) {
        %>
            <p style="color: red;"><%= errorMessage %></p>
        <% } %>
        <div class="login-container">
    <div class="content-wrapper">
      <div class="image-column"></div>
      <div class="form-column">
        <div class="login-wrapper">
          <h1 class="login-title">Log-In</h1>
          <form class="login-form">
            <input type="text" id="t1" name="u1" class="input-field" placeholder="Username" aria-label="Username">
            <input type="password" id="t2" name="u2" class="input-field" placeholder="Password" aria-label="Password">
            <div class="form-group">
                            <label for="unique-code">Unique Code</label>
                            <input id="t4" name="u4" type="text" class="form-input" required aria-label="Unique Code">
                        </div>
            <button type="submit" class="login-button">Login</button>
            <div class="create-account">
                <p>Create an account? <a href="signup.jsp">Sign Up</a></p>
            </div>
<div class="google-login">
  <img class="google-icon" src="https://cdn.builder.io/api/v1/image/assets/TEMP/394a44207ee6307ff20d71d1bb38036bfb879a36728d7d5d88c25582bcf1a230?placeholderIfAbsent=true&apiKey=69dcfc83bd48480aa5d75b3c711dd446" alt="Google Icon">
  <button type="submit" class="google-button">Continue with Google</button>
</div>
          </form>
        </div>
      </div>
    </div>
  </div>
    </form>
</body>

</html>
