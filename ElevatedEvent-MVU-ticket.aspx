<%@ Page Language="C#" AutoEventWireup="true" Inherits="Tessitura.WebAPI.Controls.ConfirmationEmailPage" EnableViewState="false" %>
<%@ Register TagPrefix="tweb" Namespace="Tessitura.WebAPI.Controls" Assembly="Tessitura" %>
<%@ Import Namespace="Tessitura.WebAPI" %>
<%
    if (String.IsNullOrEmpty(Subject))
    {
        Subject = "Your Tickets to A Mount Vernon Masquerade";
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<!--[if gte mso 15]>
	<xml>
		<o:OfficeDocumentSettings>
		<o:AllowPNG/>
		<o:PixelsPerInch>96</o:PixelsPerInch>
		</o:OfficeDocumentSettings>
	</xml>
	<![endif]-->
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="format-detection" content="date=no" />
	<meta name="format-detection" content="address=no" />
	<meta name="format-detection" content="telephone=no" />
	<link href='https://fonts.googleapis.com/css?family=Libre+Baskerville:400,400italic,700' rel='stylesheet' type='text/css' />
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700italic,700' rel='stylesheet' type='text/css' />
	<title>Email Template</title>
	

	<style type="text/css" media="screen">
		[style*="Open Sans"] { 
			font-family: 'Open Sans', Tahoma, Arial, sans-serif !important
		}
		[style*="Libre Baskerville"] { 
			font-family: 'Libre Baskerville', Georgia, Times, serif !important
		}
		/* Linked Styles */
		body { padding:0 !important; margin:0 !important; display:block !important; min-width:100% !important; width:100% !important; background:#f8f8f8; -webkit-text-size-adjust:none }
		a { color:#999999; text-decoration:none }
		p { padding:0 !important; margin:0 !important } 
		img { -ms-interpolation-mode: bicubic; /* Allow smoother rendering of resized image in Internet Explorer */ }
		.text-list a { color:#64605a; text-decoration:none }
		.text-footer a { color:#ffffff; text-decoration:none }

		/* Mobile styles */
		@media only screen and (max-device-width: 480px), only screen and (max-width: 480px) { 
			div[class='mobile-br-5'] { height: 5px !important; }
			div[class='mobile-br-10'] { height: 10px !important; }
			div[class='mobile-br-15'] { height: 15px !important; }

			th[class='m-td'], 
			td[class='m-td'], 
			div[class='hide-for-mobile'], 
			span[class='hide-for-mobile'] { display: none !important; width: 0 !important; height: 0 !important; font-size: 0 !important; line-height: 0 !important; min-height: 0 !important; }

			span[class='mobile-block'] { display: block !important; }

			div[class='wgmail'] img { min-width: 320px !important; width: 320px !important; }

			div[class='img-m-center'] { text-align: center !important; }
			div[class='text-center2'] { text-align: center !important; }

			div[class='fluid-img2'] img { width: 100% !important; max-width: 370px !important; height: auto !important; }
			
			div[class='fluid-img'] img,
			td[class='fluid-img'] img { width: 100% !important; max-width: 480px !important; height: auto !important; }

			table[class='mobile-shell'] { width: 100% !important; min-width: 100% !important; }
			table[class='center'] { margin: 0 auto; }

			td[class='column'],
			th[class='column'] { float: left !important; width: 100% !important; display: block !important; }

			td[class='td'] { width: 100% !important; min-width: 100% !important; }

			div[class='text-center'] { font-size: 12px !important; line-height: 16px !important; white-space: nowrap !important; }
			div[class='text-center2'] { font-size: 12px !important; line-height: 16px !important; }

			td[class='content-spacing'] { width: 15px !important; }

			a[href^="tel"], a[href^="sms"] { text-decoration: none; color: black; pointer-events: none; cursor: default; }

			.mobile_link a[href^="tel"], .mobile_link a[href^="sms"] { text-decoration: default; color: orange !important; pointer-events: auto; cursor: default; }
		} 
	</style>
</head>
<body class="body" style="padding:0 !important; margin:0 !important; display:block !important; min-width:100% !important; width:100% !important; background:#f8f8f8; -webkit-text-size-adjust:none">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
		<tr>
			<td align="center" valign="top">
				<table width="620" border="0" cellspacing="0" cellpadding="0" class="mobile-shell">
					<tr>
						<td class="img" style="font-size:0pt; line-height:0pt; text-align:left" width="10"></td>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="td" style="width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal; Margin:0">
										<!-- Header -->
										<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#1a3869">
											<tr>
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="50"></td>
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="8" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

													<div class="text-header" style="color:#ffffff; font-family: 'Open Sans', Tahoma, Arial, sans-serif; font-size:20px; line-height:25px; text-align:left">
														ticket confirmation
													</div>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="8" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

												</td>
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="50"></td>
											</tr>
										</table>
										<!-- END Header -->
										
										<!-- Main -->
										<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff"> 
											<tr>
												<td>
													<!-- White Section -->
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="66"></td>
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="28" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

																<div class="fluid-img2" style="font-size:0pt; line-height:0pt; text-align:left">
																	<div class="img-center" style="font-size:0pt; line-height:0pt; text-align:center"><a href="http://www.mountvernon.org" target="_blank"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_logo.jpg" border="0" width="376" height="50" alt="" /></a></div>
																</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="28" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

																<div class="text"><span style="color:#64605a; font-family:'Libre Baskerville', Georgia, Times, 'Times New Roman', serif; font-size:16px; line-height:21px; text-align:left">
																Thank you for purchasing tickets to <em>A Mount Vernon Masquerade</em>.<br><br>
																We look forward to seeing you on Saturday, September 23 2017 at 6:30 p.m. You will be receiving more information about the evening as it gets closer to the event. If you have any questions please feel free to contact Kara Hershorin at 703-799-8658 or <a href="mailto:khershorin@mountvernon.org">khershorin@mountvernon.org</a>.<br><br>
																We hope you also enjoy your MVUnderground membership <a href="http://www.mountvernon.org/become-a-member/">benefits</a>.  An acknowledgement and your membership card will be arriving in the mail in the next couple of weeks.<br><br>
																Thank you again for your support for Mount Vernon's mission of historic preservation, education, and the legacy of George Washington. 
																</span></div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="18" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

															</td>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="66"></td>
														</tr>
													</table>
													<!-- END White Section -->
													
																										<!-- Brown Section -->
													<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ebe8e0">
														<tr>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="18" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

																<table width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td>																		
																<!-- Donation Info -->													
																<p style="font-family: 'Open Sans', Tahoma, Arial, sans-serif; text-align:center; font-size:14px; line-height:25px; color:#64605a;">
																AMOUNT:<br>
																<span style="color:#8d2838; font-size:24px; font-weight: bold">
																<% string date = ""; %>															
																<% decimal amount = 69; %>
																<% foreach (ConstituentContribution item in ConstituentInfo.Contribution) { %>
																<% date = item.cont_date.ToString("MM/dd/yyyy"); %>
																	<% if (date == OrderData.OrderDate.ToString("MM/dd/yyyy")) { %>
																	<% amount = item.cont_amt; %>
																	<%= amount.ToString("C2") %>
																	<% Response.Write("<br>"); %>
																	<% } %>
																<% } %>		
																</span><br>
																<!--
																DATE:<br>
																<span style="color:#8d2838; font-size:24px; font-weight: bold"><%= OrderData.OrderDate.ToString("MM/dd/yyyy") %>
																</span>															
																
																<br><br>
																
																DESIGNATION:<br>
																<span style="color:#8d2838; font-size:24px; font-weight: bold">
																<% string designation = ""; %>
																<% foreach (ConstituentContribution item in ConstituentInfo.Contribution) { %>
																<% date = item.cont_date.ToString("MM/dd/yyyy"); %>
																	<% if (date == OrderData.OrderDate.ToString("MM/dd/yyyy")) { %>
																	<% designation = item.campaign; %>
																	<%= designation %>
																	<% Response.Write("<br>"); %>
																	<% } %>
																<% } %>	
																</span>						
																-->
																
																</p>																			
																		</td>
																	</tr>
																</table>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="25" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

															</td>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
														</tr>
													</table>
													<!-- END Brown Section -->


													<!-- Brown Section
													<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ebe8e0">
														<tr>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="18" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
																
																<table width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td>
																		
																																
																<%= TransformXml("~/templates/EventTicketOrder.xsl")%>	
																			
																		</td>
																	</tr>
																</table>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="25" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

															</td>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
														</tr>
													</table>
													-->
												</td>
											</tr>
										</table>
										
																						
													<!-- Unorder List -->													

													<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f5f3ee" style="background-color: background-color: #f5f3ee;">
														<tr style="background-color: background-color: #f5f3ee;">
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left; background-color: #f5f3ee; color: #f5f3ee" width="68"></td>
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

																<div class="text-list" style="color:#64605a; font-family: 'Open Sans', Tahoma, Arial, sans-serif; font-size:15px; line-height:28px; text-align:left">																	
																	Order Number: <%= OrderData.OrderNumber %><br />
																	Purchase Date: <span id="purchase-date"><%= OrderData.OrderDate.ToString("MM/dd/yyyy") %></span><br />
																	Purchased by: <span id="name-full"><%= OrderData.Customer.FullName %></span><br />
																</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

															</td>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="68"></td>
														</tr>
													</table>
													<!-- END Unorder List -->
										
										<!-- END Main -->
										<!-- Footer -->
										<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#37312b">
											<tr>
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="60"></td>
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="32" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

													<div class="text-footer" style="color:#ffffff; font-family: 'Open Sans', Tahoma, Arial, sans-serif; font-size:16px; line-height:22px; text-align:left">
														3200 MOUNT VERNON MEMORIAL PARKWAY<br />
														MOUNT VERNON, VIRGINIA 22121
														<br />
														<br />

														<a href="#" target="_blank" class="link-white" style="color:#ffffff; text-decoration:none"><span class="link-white" style="color:#ffffff; text-decoration:none">800.429.1520</span></a><br />
														<a href="mailto:tickets@mountvernon.org" target="_blank" class="link-white" style="color:#ffffff; text-decoration:none"><span class="link-white" style="color:#ffffff; text-decoration:none">tickets@mountvernon.org</span></a>
													</div>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="30" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>


													<!-- Socials -->
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td align="left">
																<div class="text-socials" style="color:#ac9766; font-family:'Libre Baskerville', Georgia, Times, 'Times New Roman', serif; font-size:16px; line-height:22px; text-align:left; text-transform:uppercase">
																	STAY CONNECTED
																</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="10" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>


																<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td class="img" style="font-size:0pt; line-height:0pt; text-align:left" width="53"><a href="http://www.facebook.com/HistoricMountVernon" target="_blank"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_ico_facebook.jpg" border="0" width="30" height="30" alt="" /></a></td>
																		<td class="img" style="font-size:0pt; line-height:0pt; text-align:left" width="53"><a href="http://twitter.com/intent/follow?source=followbutton&variant=1.0&screen_name=mountvernon" target="_blank"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_ico_twitter.jpg" border="0" width="36" height="30" alt="" /></a></td>
																		<td class="img" style="font-size:0pt; line-height:0pt; text-align:left" width="53"><a href="http://instagram.com/mount_vernon" target="_blank"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_ico_instagram.jpg" border="0" width="30" height="30" alt="" /></a></td>
																		<td class="img" style="font-size:0pt; line-height:0pt; text-align:left" width="53"><a href="http://www.youtube.com/user/HistoricMountVernon?sub_confirmation=1" target="_blank"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_ico_youtube.jpg" border="0" width="43" height="30" alt="" /></a></td>
																		<td class="img" style="font-size:0pt; line-height:0pt; text-align:left" width="33"><a href="http://www.vimeo.com/mountvernon" target="_blank"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_ico_vimeo.jpg" border="0" width="33" height="30" alt="" /></a></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
													<!-- END Socials -->
													<div class="hide-for-mobile">
														<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="30" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

													</div>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="30" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

												</td>
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="60"></td>
											</tr>
										</table>
										<!-- END Footer -->
									</td>
								</tr>
							</table>
						</td>
						<td class="img" style="font-size:0pt; line-height:0pt; text-align:left" width="10"></td>
					</tr>
				</table>
				<div class="wgmail" style="font-size:0pt; line-height:0pt; text-align:center"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_gmail_fix.gif" width="640" height="1" style="min-width:640px" alt="" border="0" /></div>
			</td>
		</tr>
	</table>
	
	<!--
<table align="left" valign="top" cellpadding="3" cellspacing="0" border="0" width="650" style="display: block; font-family: arial, helvetica, sans-serif;">
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
-->
</body>
</html>