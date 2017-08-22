<%@ Page Language="C#" Inherits="Tessitura.WebAPI.Controls.LoginEmailPage" %>

<%
    Subject = "Your Mount Vernon Supporter ID";
    uxBillingAddress.Address = UserInfo.BillingAddress;
%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>

<style type="text/css">
p {font-size: 18px; font-family: Times, san-serif; }
h2 { font-size: 18px; font-family: Arial, Times, san-serif; }
</style>

<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px; width: 100%; background-color: #000; color:#FFF; font-family: Arial, Times, san-serif;">
<tbody>
<tr>
<td style="margin:15px; !important;">
your supporter ID number
</td>
</tr>
</tbody>
</table>

<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px; width: 100%;">
<tbody>
<tr>
<td style="text-align:center;">
<img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/mountvernon-logo-320.jpg">
</td>
</tr>
</tbody>
</table>

    <div>
        <h2>Hello, <%= UserInfo.FullName %>. Please see your membership information below:</h2>
        <p>Your supporter ID is:</p>
        <p style="font-weight: bold; font-family: Arial, Times, san-serif;"><%= UserInfo.CustomerNo %></p>
           
    <p>This is the address we have on file for you:</p>
	<strong>
	<tweb:AddressControl runat="server" ID="uxBillingAddress" />
	</strong>
    </div>
    
   
    <div style="text-align:align:center; margin: 0 auto;">
        <hr />
    <p>Do you require further assistance? Please give us a call at 703-799-8647.</p>
    </div>
</body>
</html>