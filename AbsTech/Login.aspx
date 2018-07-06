<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AbsTech.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap-3.1.0.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap-3.1.0.min.js"></script>
    <link href="css/Login.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="pr-wrap">
                    <div class="pass-reset">
                        <label>
                            Enter the email you signed up with</label>
                        <input type="email" placeholder="Email" />
                        <input type="submit" value="Submit" class="pass-reset-submit btn btn-success btn-sm" />
                    </div>
                </div>
                <div class="wrap">
                    <p class="form-title">
                        Sign In
                    </p>
                    <form class="login" runat="server">
                        <asp:TextBox ID="txtUserName" runat="server" placeholder="Username"></asp:TextBox>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                        <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-success btn-sm" OnClick="btnSignIn_Click"/>
                        <div class="remember-forgot">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" />
                                            Remember Me
                               
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-6 forgot-pass-content">
                                    <a href="javascription:void(0)" class="forgot-pass">Forgot Password</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="posted-by">By: <a href="#">ABSTECH</a></div>
    </div>
</body>
</html>
