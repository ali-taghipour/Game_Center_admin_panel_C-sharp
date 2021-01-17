<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html>
<head>
    <link href="css/login.css" rel="stylesheet" />
    <script src="js/login.js"></script>
</head>
<body>
    <form runat="server">
        <%--slider begin--%>

        <div id="slider">
            <div class="back">
                <div class="items">
                    <img src="images/login/1.jpg" />
                </div>
                <div class="items">
                    <img src="images/login/2.jpg" />
                </div>
                <div class="items">
                    <img src="images/login/3.jpg" />
                </div>
                <div class="items">
                    <img src="images/login/4.jpg" />
                </div>
                <div class="items">
                    <img src="images/login/6.jpg" />
                </div>
            </div>
        </div>

        <%--slider end--%>

        <%--signup begin--%>
        <div class="margin">
            <div id="all_front">

                <div id="form1" class="front f" runat="server" style="display: none">

                    <div class="sabtnam sa0">ثبت نام</div>
                    <div id="errore0" class="error" runat="server">
                    </div>
                    <div class="items">

                        <input type="text" runat="server" id="sign_name" placeholder="نام کاربری" />


                    </div>

                    <div class="items">

                        <input type="text" runat="server" id="sign_email" placeholder="ایمیل " />


                    </div>
                    <div class="items">
                        <input type="password" runat="server" id="sign_pass" placeholder="رمز ورود" />
                    </div>

                    <div class="items">
                        <input type="password" runat="server" id="sign_pass_repeat" placeholder="تکرار رمز" />
                    </div>


                    <div class="bottom s1">
                        <input type="submit" value="ثبت نام" runat="server" onserverclick="sign_up" />
                    </div>

                    <div class="bottom s2" runat="server">
                        <span class="key" onclick="keyToLoggin()">ورود</span>
                    </div>

                </div>


                <div id="form2" class="front f" runat="server">

                    <div class="sabtnam sa0">ورود</div>
                    <div id="errore1" class="error" runat="server"></div>
                    <div class="items">

                        <input type="text" runat="server" id="log_uEmail" placeholder="نام کاربری یا ایمیل" />


                    </div>

                    <div class="items">
                        <input type="password" runat="server" id="log_pass" placeholder="رمز ورود" />
                    </div>


                    <div class="bottom s1">
                        <input type="submit" value="ورود" runat="server" onserverclick="loggin" />
                    </div>

                    <div class="bottom s2" runat="server">
                        <span class="key" onclick="keyToReg()">ثبت نام</span>
                    </div>

                </div>
            </div>
        </div>
        <%--signup end--%>
    </form>
</body>
</html>
