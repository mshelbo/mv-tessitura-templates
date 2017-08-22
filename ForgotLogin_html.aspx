<%@ Page Language="C#" Inherits="Tessitura.WebAPI.Controls.LoginEmailPage" %>
<%

    Subject = "Your Online Account Credentials from Tessitura Network";

%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body style="">
<table align="center" width="500" cellpadding="7" style="font-family: arial, sans-serif, helvetica; font-size: 14px;">
    <tr>
        <td align="left" valign="top" style="background-color: #FFF; color: #C00; font-size: 30px;">Forgotten Something?</td>
    </tr>
    <tr>
        <td align="left" valign="top">
            <p>
            A 'forgot password' request was made for your email address on our website.<BR><BR>
	        If you did not make this request, please contact <a href="mailto: mail@tessituranetwork.com" style="color: #C00">mail@tessituranetwork.com</a> or call 888-123-4567.<BR><BR>
	    If you did make this request, click the link below to log into your account:
            </p>
	    <p align="center">
		<a href="http://www.tessituranetwork.com/Account/Login.aspx?l=<%= UserInfo.EmailAddress %>&t=<%= UserInfo.PasswordToken %>" style="color:#C00; font-size: 18px; padding: 10px; font-weight: bold;">Click Here to Login Now</a>
	    </p>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top" style="background-color: #C00;color: #FFF"><b>Tessitura Network</b><br/>123 Main Street<br/>City, ST 00000<br/>888-123-4567<br/>http://www.tessituranetwork.com
        </td>
    </tr>
</table>
    
</body>
</html>

