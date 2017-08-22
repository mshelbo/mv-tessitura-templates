<%@ Page Language="C#" AutoEventWireup="true" Inherits="Tessitura.WebAPI.Controls.ConfirmationEmailPage" EnableViewState="false" %>
<%@ Register TagPrefix="tweb" Namespace="Tessitura.WebAPI.Controls" Assembly="Tessitura" %>
<%@ Import Namespace="Tessitura.WebAPI" %>
<%
    if (String.IsNullOrEmpty(Subject))
    {
        Subject = "Thank You for Your Order with the Tessitura Network";
    }
    
    uxDelivery.Address = OrderData.DeliveryAddress;
    uxBilling.Address = OrderData.BillingAddress;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Thank You for Your Order!</title>
    <link rel="stylesheet" href="http://127.0.0.1/ExpressWeb.css"/>
</head>
<body style="font-family: arial, helvetica, sans-serif; font-size: 12px;">

<table align="left" valign="top" cellpadding="3" cellspacing="0" border="0" width="650" style="display: block; font-family: arial, helvetica, sans-serif;">
    <tr>
        <td colspan="2" valign="top" align="left">
            <h3>This is the acknowledgement!</h3>
            <b>Order Date:</b> <%= OrderData.OrderDate.ToString("MM/dd/yyyy h:mmtt") %><br />
            <b>Order Number:</b> <%= OrderData.OrderNumber %><br />
            <b>Customer Number:</b> <%= OrderData.CustomerNumber %><br /><br />
            <p style="margin-top: -10px; padding-bottom: 20px;"><small>Please retain this receipt for your reference.</small></p>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top" width="50%" style="padding-bottom: 20px;">
            <b>Your Account Information:</b><BR/>
		<%= OrderData.Customer.FullName %><br />
	  	<tweb:AddressControl runat="server" ID="uxBilling" SwitchStreetLines="false" LineBreak="<br />"  DefaultCountry="[country]"/>
	
	    <%= OrderData.Customer.Phone %><br />
	    <%= OrderData.Customer.EmailAddress %><br />
        </td>
        <td align="left" valign="top" width="50%" style="padding-bottom: 20px;">
	    <b>Order Shipping Information</b><BR/>
	<% if (OrderData.DeliveryMethod == -1) { %>
            Hold order at Box Office<br />
            <i>Please pick up your tickets no later than 30 minutes before curtain</i>
	<% } else { %>
	    <tweb:AddressControl runat="server" id="uxDelivery" DefaultCountry="[country]" LineBreak="<br />" />
	<% } %>
        </td>
    </tr>
    <tr>
	<td colspan="2">
<%= TransformXml("~/templates/Sample_OrderEmail_html.xsl")%>
   	</td>
    </tr>
    <tr>
        <td align="center" valign="top" colspan="2" style="background-color: #F15E47;color: #e2e3e3;"><b>Tessitura Network</b> <BR/>P.O. Box 670245 Dallas, Texas 75367-0245 &middot; 1 888-643-5778 <br/><a href="http://express.tessituranetwork.com" style="color:#e2e3e3;">http://express.tessituranetwork.com</a>              
        </td>
    </tr>
	<tr>
		<td>
<h1>Extension Data</h1>

<h2>ConstituentInfo.ConstituentHeader</h2>
	<b>customer_no</b>: <%= ConstituentInfo.ConstituentHeader.customer_no %><br />
	<b>full_name1</b>: <%= ConstituentInfo.ConstituentHeader.full_name1 %><br />
	<b>full_name2</b>: <%= ConstituentInfo.ConstituentHeader.full_name2 %><br />
	<b>all_const</b>: <%= ConstituentInfo.ConstituentHeader.all_const %><br />
	<b>memb_level</b>: <%= ConstituentInfo.ConstituentHeader.memb_level %><br />
	<b>current_status</b>: <%= ConstituentInfo.ConstituentHeader.current_status %><br />
	<b>memb_expirtion</b>: <%= ConstituentInfo.ConstituentHeader.memb_expirtion %><br />
	<b>create_dt</b>: <%= ConstituentInfo.ConstituentHeader.create_dt %><br />
	<b>donation</b>: <%= ConstituentInfo.ConstituentHeader.donation %><br />
	<b>userid</b>: <%= ConstituentInfo.ConstituentHeader.userid %><br />
	<b>batch_no</b>: <%= ConstituentInfo.ConstituentHeader.batch_no %><br />
	<b>on_account</b>: <%= ConstituentInfo.ConstituentHeader.on_account %><br />
	<b>inactive</b>: <%= ConstituentInfo.ConstituentHeader.inactive %><br />
	<b>batch_type</b>: <%= ConstituentInfo.ConstituentHeader.batch_type %><br />

<h2>ConstituentInfo.Attributes</h2>
<% foreach (ConstituentAttribute item in ConstituentInfo.ConstituentAttributes) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>attribute</b>: <%= item.attribute %><br />
	<b>attribute_value</b>: <%= item.attribute_value %><br />
	<b>n1n2_ind</b>: <%= item.n1n2_ind %><br />
	<b>data_type</b>: <%= item.data_type %><br />
	<b>keyword_no</b>: <%= item.keyword_no %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Constituencies</h2>
<% foreach (ConstituentConstituency item in ConstituentInfo.Constituency) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>constituency</b>: <%= item.constituency %><br />
	<b>created_by</b>: <%= item.created_by %><br />
	<b>create_dt</b>: <%= item.create_dt %><br />
	<b>n1n2_ind</b>: <%= item.n1n2_ind %><br />
	<b>id</b>: <%= item.id %><br />
	<b>short_desc</b>: <%= item.short_desc %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Contribution</h2>
<% foreach (ConstituentContribution item in ConstituentInfo.Contribution) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>customer_no</b>: <%= item.customer_no %><br />
	<b>cont_date</b>: <%= item.cont_date %><br />
	<b>recd_amt</b>: <%= item.recd_amt %><br />
	<b>cont_amt</b>: <%= item.cont_amt %><br />
	<b>type</b>: <%= item.type %><br />
	<b>campaign</b>: <%= item.campaign %><br />
	<b>appeal</b>: <%= item.appeal %><br />
	<b>media_type</b>: <%= item.media_type %><br />
	<b>source_name</b>: <%= item.source_name %><br />
	<b>fund_no</b>: <%= item.fund_no %><br />
	<b>ref_no</b>: <%= item.ref_no %><br />
	<b>billing_type</b>: <%= item.billing_type %><br />
	<b>credit_ind</b>: <%= item.credit_ind %><br />
	<b>n1n2_ind</b>: <%= item.n1n2_ind %><br />
	<b>creditee_name</b>: <%= item.creditee_name %><br />
	<b>credited_amt</b>: <%= item.credited_amt %><br />
	<b>solicitor</b>: <%= item.solicitor %><br />
	<b>cont_designation</b>: <%= item.cont_designation %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Interests</h2>
<% foreach (ConstituentInterest item in ConstituentInfo.Interests) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>customer_no</b>: <%= item.customer_no %><br />
	<b>id</b>: <%= item.id %><br />
	<b>description</b>: <%= item.description %><br />
	<b>selected</b>: <%= item.selected %><br />
	<b>weight</b>: <%= item.weight %><br />
	<b>category</b>: <%= item.category %><br />
	<b>create_dt</b>: <%= item.create_dt %><br />
	<b>created_by</b>: <%= item.created_by %><br />
	<b>create_loc</b>: <%= item.create_loc %><br />
	<b>last_updated_by</b>: <%= item.last_updated_by %><br />
	<b>last_update_dt</b>: <%= item.last_update_dt %><br />
	</div>
<% } %>

<h2>ConstituentInfo.EmailAddresses</h2>
<% foreach (ConstituentEmail item in ConstituentInfo.EmailAddresses) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>eaddress_no</b>: <%= item.eaddress_no %><br />
	<b>address</b>: <%= item.address %><br />
	<b>eaddress_type</b>: <%= item.eaddress_type %><br />
	<b>address_type_desc</b>: <%= item.address_type_desc %><br />
	<b>email_ind</b>: <%= item.email_ind %><br />
	<b>start_dt</b>: <%= item.start_dt %><br />
	<b>end_dt</b>: <%= item.end_dt %><br />
	<b>n1n2_ind</b>: <%= item.n1n2_ind %><br />
	<b>months</b>: <%= item.months %><br />
	<b>primary_ind</b>: <%= item.primary_ind %><br />
	<b>inactive</b>: <%= item.inactive %><br />
	<b>mail_purposes</b>: <%= item.mail_purposes %><br />
	<b>html_ind</b>: <%= item.html_ind %><br />
	<b>market_ind</b>: <%= item.market_ind %><br />
	<b>inactive1</b>: <%= item.inactive1 %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Rankings</h2>
<% foreach (ConstituentRanking item in ConstituentInfo.Rankings) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>rank_type</b>: <%= item.rank_type %><br />
	<b>rank_type_desc</b>: <%= item.rank_type_desc %><br />
	<b>rank</b>: <%= item.rank %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Associations</h2>
<% foreach (ConstituentAssociation item in ConstituentInfo.Associations) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>xref_no</b>: <%= item.xref_no %><br />
	<b>xref_no_inv</b>: <%= item.xref_no_inv %><br />
	<b>associate_no</b>: <%= item.associate_no %><br />
	<b>category</b>: <%= item.category %><br />
	<b>xref_type</b>: <%= item.xref_type %><br />
	<b>xref_type_desc</b>: <%= item.xref_type_desc %><br />
	<b>name</b>: <%= item.name %><br />
	<b>gender</b>: <%= item.gender %><br />
	<b>title</b>: <%= item.title %><br />
	<b>start_dt</b>: <%= item.start_dt %><br />
	<b>end_dt</b>: <%= item.end_dt %><br />
	<b>salary</b>: <%= item.salary %><br />
	<b>notes</b>: <%= item.notes %><br />
	<b>n1n2_ind</b>: <%= item.n1n2_ind %><br />
	<b>n1n2_ind_assoc</b>: <%= item.n1n2_ind_assoc %><br />
	<b>inactive</b>: <%= item.inactive %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Memberships</h2>
<% foreach (ConstituentMembership item in ConstituentInfo.Memberships) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>memb_org_no</b>: <%= item.memb_org_no %><br />
	<b>current_status</b>: <%= item.current_status %><br />
	<b>memb_level</b>: <%= item.memb_level %><br />
	<b>init_dt</b>: <%= item.init_dt %><br />
	<b>expr_dt</b>: <%= item.expr_dt %><br />
	<b>current_status_desc</b>: <%= item.current_status_desc %><br />
	<b>memb_level_desc</b>: <%= item.memb_level_desc %><br />
	<b>memb_level_category</b>: <%= item.memb_level_category %><br />
	<b>category_desc</b>: <%= item.category_desc %><br />
	<b>memb_org_desc</b>: <%= item.memb_org_desc %><br />
	<b>inception_dt</b>: <%= item.inception_dt %><br />
	<b>ben_provider</b>: <%= item.ben_provider %><br />
	<b>lapse_dt</b>: <%= item.lapse_dt %><br />
	<b>renewal_dt</b>: <%= item.renewal_dt %><br />
	<b>declined_ind</b>: <%= item.declined_ind %><br />
	<b>cust_memb_no</b>: <%= item.cust_memb_no %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Phones</h2>
<% foreach (ConstituentPhone item in ConstituentInfo.Phones) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>phone_no</b>: <%= item.phone_no %><br />
	<b>address_no</b>: <%= item.address_no %><br />
	<b>phone</b>: <%= item.phone %><br />
	<b>type</b>: <%= item.type %><br />
	<b>type_desc</b>: <%= item.type_desc %><br />
	<b>day_ind</b>: <%= item.day_ind %><br />
	<b>tele_ind</b>: <%= item.tele_ind %><br />
	<b>primary_adr</b>: <%= item.primary_adr %><br />
	</div>
<% } %>

<h2>ConstituentInfo.Addresses</h2>
<% foreach (ConstituentAddress item in ConstituentInfo.Addresses) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>address_no</b>: <%= item.address_no %><br />
	<b>customer_no</b>: <%= item.customer_no %><br />
	<b>address_type</b>: <%= item.address_type %><br />
	<b>address_type_desc</b>: <%= item.address_type_desc %><br />
	<b>street1</b>: <%= item.street1 %><br />
	<b>street2</b>: <%= item.street2 %><br />
	<b>city</b>: <%= item.city %><br />
	<b>state</b>: <%= item.state %><br />
	<b>postal_code</b>: <%= item.postal_code %><br />
	<b>postal_code_format</b>: <%= item.postal_code_format %><br />
	<b>country</b>: <%= item.country %><br />
	<b>country_long</b>: <%= item.country_long %><br />
	<b>country_short</b>: <%= item.country_short %><br />
	<b>start_dt</b>: <%= item.start_dt %><br />
	<b>end_dt</b>: <%= item.end_dt %><br />
	<b>months</b>: <%= item.months %><br />
	<b>primary_ind</b>: <%= item.primary_ind %><br />
	<b>inactive</b>: <%= item.inactive %><br />
	<b>mail_purposes</b>: <%= item.mail_purposes %><br />
	<b>geo_area</b>: <%= item.geo_area %><br />
	</div>
<% } %>

<h2>ConstituentInfo.ProgramListings</h2>
<% foreach (ConstituentProgramListing item in ConstituentInfo.ProgramListings) { %>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>customer_no</b>: <%= item.customer_no %><br />
	<b>program_type</b>: <%= item.program_type %><br />
	<b>program_type_desc</b>: <%= item.program_type_desc %><br />
	<b>cust_pname</b>: <%= item.cust_pname %><br />
	<b>sort_name</b>: <%= item.sort_name %><br />
	<b>donation_level</b>: <%= item.donation_level %><br />
	<b>donation_level_desc</b>: <%= item.donation_level_desc %><br />
	</div>
<% } %>

<h2>LoginInfo</h2>
	<div style="border: 1px solid blue; margin: 5px 5px 5px 15px;">
	<b>bu: </b><%= LoginInfo.bu %><br />
	<b>MOS: </b><%= LoginInfo.MOS %><br />
	<b>OriginalMOS: </b><%= LoginInfo.OriginalMOS %><br />
	<b>promotion_code: </b><%= LoginInfo.promotion_code %><br />
	<b>status: </b><%= LoginInfo.status %><br />
	</div>
<br />

<h1>Additional Data</h1>
<% foreach (string key in AdditionalData.Keys) { %>
	<b>'<%= key %>':</b> '<%= AdditionalData[key] %>'<br />
<% } %>
		</td>
	</tr>
</table>

</body>
</html>

