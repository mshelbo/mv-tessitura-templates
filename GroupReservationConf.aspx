<%@ Page Language="C#" AutoEventWireup="true" Inherits="Tessitura.WebAPI.Controls.ConfirmationEmailPage" EnableViewState="false" %>
<%@ Register TagPrefix="tweb" Namespace="Tessitura.WebAPI.Controls" Assembly="Tessitura" %>
<%@ Import Namespace="Tessitura.WebAPI" %>
<%
    if (String.IsNullOrEmpty(Subject))
    {
        Subject = "Thank You for Your Reservation";
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
		a { color:#8D2838; text-decoration:none; }
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
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="8" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

													<div class="text-header" style="color:#ffffff; font-family: 'Open Sans', Tahoma, Arial, sans-serif; font-size:20px; line-height:25px; text-align:left">
														RESERVATION CONFIRMATION
													</div>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="8" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

												</td>
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
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
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="28" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

																<div class="fluid-img2" style="font-size:0pt; line-height:0pt; text-align:left">
																	<div class="img-center" style="font-size:0pt; line-height:0pt; text-align:center"><a href="http://www.mountvernon.org" target="_blank"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/tessitura-email_logo.jpg" border="0" width="376" height="50" alt="" /></a></div>
																</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="28" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>


																<div class="h2" style="color:#59595b; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:21px; line-height:25px; text-align:left; font-weight:bold">Your reservation is confirmed; we look forward to your visit!</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="12" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>


																<div class="text"><span style="color:#64605a; font-family:'Libre Baskerville', Georgia, Times, 'Times New Roman', serif; font-size:16px; line-height:21px; text-align:left">Please review the following reservation and payment details carefully and contact us as soon as possible with any adjustments.<br><br>
																<strong>Print this confirmation and bring it with you</strong>. Present it at the Will Call window at the main entrance to receive your tickets.<br><br>
																Please arrive at least 45 minutes before your scheduled Mansion line entry time. Your entry time will be forfeited if you arrive less than 30 minutes before your assigned time.</span></div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="18" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
																	
																			
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="18" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
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
																		
																		<!-- BASIC INFO -->
																		<table width="100%" border="0" cellspacing="0" cellpadding="0">
																			<tr>
																				<td width="50%">
																					<div class="text" style="color:#59595b; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:16px; line-height:25px; text-align:left;">
																					ORDER NUMBER:<br>
																					<strong><%= OrderData.OrderNumber %></strong><br><br>
																					Group Description<br>
																					<strong><%= OrderData.Customer.FullName %><br>
																					<%= OrderData.Custom.Custom1 %>&nbsp;</strong>														
																					</div>
																				</td>
																				<td width="50%">
																					<div class="text" style="color:#59595b; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:16px; line-height:25px; text-align:left;">
																					ORDER OPEN DATE:<br>
																					<strong><%= OrderData.OrderDate.ToString("MM/dd/yyyy") %></strong><br><br>
																					Email Address<br>
																					<strong><%= OrderData.Customer.EmailAddress %><br>
																					&nbsp;</strong>
																					</div>
																				</td>
																			</tr>
																		</table>
																		
																		</td>
																	</tr>
																</table>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="25" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>

															</td>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt;" width="52"></td>

														</tr>
													</table>
													<!-- END Brown Section -->
													
													<!-- INFO -->
													<table>
													<tr>
													<td>
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:16px; line-height:25px; text-align:center;">
													ORDER NUMBER:<br>
													<strong><%= OrderData.OrderNumber %></strong>
													</div>
													</td>
													</tr>
													<tr>
													<td>
													<!-- XLS -->
													<%= TransformXml("~/templates/GroupPaymentConf.xsl")%>
													</td>
													</tr>
													</table>													
													
										
																						
													<!-- Important Notice -->													

													<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#fff" style="background-color: #fff;">
														<tr style="background-color: #fff;">
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left; background-color: #fff; color: #f5f3ee" width="52"></td>
															<td>
																<div class="h2" style="color:#59595b; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:21px; line-height:25px; text-align:left; font-weight:bold">Important Notice:</div>
																
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
																
																<div class="text"><span style="color:#64605a; font-family:'Libre Baskerville', Georgia, Times, 'Times New Roman', serif; font-size:16px; line-height:21px; text-align:left">Please discourage your group from bringing bags. Bags larger than 16x16x8 inches are prohibited, and all bags will be searched. <a href="http://www.mountvernon.org/baginspection">mountvernon.org/baginspection</a>.<br><br>
																Please review our <em>Guest Rules of Civility</em> with your group prior to arrival. <a href="http://www.mountvernon.org/guestrules">mountvernon.org/guestrules</a>.</span></div>

															</td>
															<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
														</tr>
													</table>
													
													<table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center; display:none;">
														<tr style="background-color: #fff;">
															<td class="content-spacing" width="150"></td>
															<td>
																<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/No_Smoking.svg/2000px-No_Smoking.svg.png" width="50">
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
															<td>
																<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/No_Smoking.svg/2000px-No_Smoking.svg.png" width="50">
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
															<td>
																<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/No_Smoking.svg/2000px-No_Smoking.svg.png" width="50">
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
															<td>
																<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/No_Smoking.svg/2000px-No_Smoking.svg.png" width="50">
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
															<td class="content-spacing" width="150"></td>
														</tr>
													</table>														
													
													<!-- END Important Notice -->

													
													<!-- Your Day, etc -->
													
													<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFF" style="background-color: #FFF;">
														<tr style="background-color: background-color: #FFF; text-align:center;">
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
																<div class="h2" style="color:#59595b; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight:bold;">
																<a href="http://www.mountvernon.org/calendar"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/email_yourday.png" height="67"></a><br><br>
																YOUR DAY AT<br>MOUNT VERNON</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
															
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
																<div class="h2" style="color:#59595b; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight:bold;">
																<a href="http://www.mountvernon.org/plan-your-visit/what-to-see/"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/email_whattosee.png"></a><br><br>
																WHAT TO SEE<br>&nbsp;</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
															
															<td>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
																<div class="h2" style="color:#59595b; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight:bold;">
																<a href="http://onelink.to/y4t7rh"><img src="http://s3.amazonaws.com/mtv-main-assets/files/resources/email_app.png" height="67"></a><br><br>
																GET OUR FREE APP<br>&nbsp;</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="26" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>
															</td>
														</tr>
													</table>
										
										<!-- END Main -->
										<!-- Footer -->
										<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#37312b">
											<tr>
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="32" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>													
													
													<div class="text-footer" style="color:#ffffff; font-family: 'Open Sans', Tahoma, Arial, sans-serif; font-size:22px; line-height:22px; text-align:left">
														<strong>MOUNT VERNON RESERVATIONS OFFICE</strong><br><br>
													</div>

													<div class="text-footer" style="color:#ffffff; font-family: 'Open Sans', Tahoma, Arial, sans-serif; font-size:16px; line-height:22px; text-align:left">
														
														Post Office Box 110<br>
														Mount Vernon, Virginia 22121<br><br>
													
														Phone: 703.799.8688<br>
														Email: GroupTours@mountvernon.org<br>
														Fax: 703.799.5238<br><br>
													</div>													

													<div class="text-footer" style="color:#ffffff; font-family: 'Open Sans', Tahoma, Arial, sans-serif; font-size:16px; line-height:22px; text-align:left">
													<strong>Hours</strong>:<br>
													April-October 9-5 p.m.; November-March 9-4 p.m.<br>
													Group Bonus Hour 8-9 a.m. March 18-June 23, 2017.
													</div>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="30" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%">&nbsp;</td></tr></table>												

												</td>
												<td class="content-spacing" style="font-size:0pt; line-height:0pt; text-align:left" width="52"></td>
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