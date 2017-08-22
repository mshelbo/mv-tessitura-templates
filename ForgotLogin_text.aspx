<%@ Page Language="C#" Inherits="Tessitura.WebAPI.Controls.LoginEmailPage" %>
<%

    Subject = "Your Online Account Credentials from Tessitura Network";

%>

Forgotten Something?

A 'forgot password' request was made for your email address on our website.

If you did not make this request, please contact mail@tessituranetwork.com or call 888-123-4567.

If you did make this request, click the link below to log into your account:


Login now at:

http://www.tessituranetwork.com/Account/Login.aspx?l=<%= UserInfo.EmailAddress %>&t=<%= UserInfo.PasswordToken %>


                            Tessitura Network
			    123 Main Street
			    City, ST 00000
			    888-123-4567
			    http://www.tessituranetwork.com
