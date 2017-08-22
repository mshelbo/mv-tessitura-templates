<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
	<!-- style notes for TN EXPRESS WEB mgmt 
  Item type subheader: bgC1 c4 medium
  Item type col title: c1
  Item type subtotal: (border color:c1 c3
  Rows set to interchange : EFEFEF, FFFFFF
  Cart Totals: (border color:c1 c3
  -->


	<xsl:output method="html" indent="yes" encoding="utf-8" omit-xml-declaration="yes" />
	<xsl:param name="showDelete"></xsl:param>
	<!-- show 'delete' link per lineitem -->
	<xsl:param name="showChange"></xsl:param>
	<!-- show 'change' link per lineitem -->
	<xsl:param name="showPackageChange"></xsl:param>
	<!-- show 'change' link per package line item - for renewals -->
	<xsl:param name="actionURL"></xsl:param>
	<!-- what URL should delete/change point to -->
	<xsl:decimal-format name="dollar" decimal-separator="." grouping-separator=","/>

	<xsl:template match="/">

		<!-- SUBS HANDLING -->
		<!-- 2/19/09: Super Packages are not currently supported by the GetOrderDetails dataset.  As this change is coming in v9, I will withhold addressing super packages in the order conf XSL until the 'official' fix is deployed -->
		<xsl:if test="count(//GetOrderDetailsInfoResults/LineItem[pkg_no!=0]) &gt; 0">
			<!--<xsl:variable name="thisTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[pkg_no!=0 and primary_ind != 'Y']/li_seq_no) and ((sli_status=2 or sli_status=3 or sli_status=12 or sli_status=6)]/due_amt)" />-->
			<xsl:variable name="thisTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[not(li_seq_no=//GetOrderDetailsInfoResults/LineItem[pkg_no !=0 and primary_ind != 'Y']/li_seq_no) and pkg_no!=0 and (sli_status=2 or sli_status=3 or sli_status=12 or sli_status=6)]/due_amt)" />
			<tr>
				<th align="left" valign="top" style="background-color: #F15E47;	color: #e2e3e3;	font-weight: bold;	font-size: 12px;	text-align: left;">
					<b>Subscription(s):</b>
				</th>
			</tr>
			<tr>
				<td align="left" valign="top">
					<table align="left" valign="top" cellpadding="2" cellspacing="0" width="100%" class="lineitem">
						<tr>
							<th align="left" valign="top" width="275" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Description</th>
							<th align="left" valign="top" width="128" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Location</th>
							<th align="left" valign="top" width="108" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Seat(s)</th>
							<th align="left" valign="top" width="81" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Price</th>
							<th align="right" valign="top" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Total</th>
							<th align="right" valign="top" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">
								<!-- change / delete -->
							</th>
						</tr>
						<!-- handle supr packages first -->
						<!--<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[not(super_pkg_no=preceding-sibling::LineItem/super_pkg_no) and pkg_no != 0 and primary_ind = 'Y' and super_pkg_no &gt; 0]">-->
						<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[not(super_pkg_no=preceding-sibling::LineItem/super_pkg_no and pkg_li_no=preceding-sibling::LineItem/pkg_li_no) and pkg_no != 0 and primary_ind = 'Y' and super_pkg_no &gt; 0]">
							<xsl:variable name="pkgNo" select="pkg_no" />
							<xsl:variable name="supPkgNo" select="super_pkg_no"/>
							<xsl:variable name="subs_title">
								<xsl:choose>
									<xsl:when test="string(super_pkg_desc) != ''">
										<xsl:value-of select="super_pkg_desc"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pkg_desc"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="subs_facility" select="facility" />
							<xsl:variable name="parLiNo" select="pkg_li_no" />
							<xsl:variable name="bg">
								<xsl:choose>
									<xsl:when test="position() mod 2 =  1">
										<xsl:text>background-color: #EEEEEE;</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>background-color: #FFFFFF;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr style="{$bg}">
								<td align="left" valign="top" colspan="5">
									<b>
										<xsl:value-of select="$subs_title" />
									</b>
								</td>
								<td align="left" valign="top" rowspan="{count(//GetOrderDetailsInfoResults/LineItem[super_pkg_no = $supPkgNo and pkg_li_no = $parLiNo and perf_no &gt; 0])+1}" style="padding-left: 8px; padding-right: 4px; padding-top: 20px;">

									<xsl:if test="$showChange = 'Y' or $showPackageChange = 'Y'">
										<a href="../subscription/packageDetail.aspx?pkg={$pkgNo}&amp;liSeqNo={$parLiNo}">change</a>
										<BR/>
									</xsl:if>
									<xsl:if test="$showDelete = 'Y'">
										<a href="{$actionURL}?act=DSub&amp;id={$parLiNo}">delete</a>
									</xsl:if>
								</td>
							</tr>
							<!--</xsl:if>-->
							<!-- display primary selection first -->
							<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[super_pkg_no = $supPkgNo and pkg_li_no = $parLiNo and perf_no &gt; 0]">
								<xsl:variable name="liNo" select="li_seq_no" />
								<xsl:variable name="dt">
									<xsl:call-template name="FormatDate">
										<xsl:with-param name="DateTime" select="perf_dt"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="liSeatsTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/due_amt)" />
								<tr  style="{$bg}">
									<td align="left" valign="top" width="275">
										<xsl:value-of select="perf_desc" />
										<BR/>
										<xsl:value-of select="facility_desc" />
										<BR/>
										<xsl:value-of select="$dt" />
									</td>
									<td align="left" valign="top" width="128">
										<xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc"/>
									</td>
									<td align="left" valign="top" width="108">
										<xsl:for-each select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]">
											<xsl:if test="string(seat_num) != ''">
												<xsl:value-of select="seat_row"/>
												<xsl:value-of select="seat_num"/>
												<BR/>
											</xsl:if>
											<xsl:if test="string(seat_num) = ''">
												TBD<BR/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td align="left" valign="top" width="81">
										<xsl:for-each select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]">
											<xsl:value-of select="format-number(number(due_amt), '$####.00', 'dollar')"/>
											<BR/>
										</xsl:for-each>
									</td>
									<td align="right" valign="top">
										<xsl:value-of select="format-number(number($liSeatsTotal), '$####.00', 'dollar')" />
									</td>
								</tr>

							</xsl:for-each>
							<!-- display secondary selection(s) -->
							<!--xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[pkg_no = $pkgNo and primary_ind != 'Y' and li_no != pkg_li_no]"-->
							<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[primary_ind != 'Y' and li_no=$parLiNo]">
								<xsl:variable name="pkgLiNo" select="pkg_li_no"/>
								<xsl:variable name="liNo" select="li_seq_no" />
								<xsl:variable name="liSeatCount" select="count(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo])" />
								<xsl:variable name="liSeatsTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=//GetOrderDetailsInfoResults/LineItem[pkg_li_no=$pkgLiNo]/li_seq_no]/due_amt)" />
								<xsl:variable name="pricePerSeat" select="$liSeatsTotal div $liSeatCount"/>
								<xsl:if test="position() = 1">
									<!-- only show the first row -->
									<tr style="{$bg}">
										<td align="left" valign="top" width="275" style="color: #333333;">
											<b>
												Alternate Seating Choice <xsl:value-of select="position()"/>
											</b>
											<BR/>
											<xsl:value-of select="pkg_desc" />
											<BR/>
										</td>
										<td align="left" valign="top" width="128" style="color: #333333;">
											<xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc"/>
										</td>
										<td align="left" valign="top" width="108" style="color: #333333;">
											<xsl:value-of select="$liSeatCount"/>
										</td>
										<td align="left" valign="top" width="81" style="color: #333333;">
											<xsl:value-of select="format-number(number($pricePerSeat), '$####.00', 'dollar')" />
										</td>
										<td align="right" valign="top" style="color: #333333;">
											<xsl:value-of select="format-number(number($liSeatsTotal), '$####.00', 'dollar')" />
										</td>
										<td></td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</xsl:for-each>
						<!-- regular and flex packages -->
						<!--<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[not(pkg_no=preceding-sibling::LineItem/pkg_no) and pkg_no != 0 and primary_ind = 'Y' and string(super_pkg_no) = '']">-->
						<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[not(pkg_no=preceding-sibling::LineItem/pkg_no and pkg_li_no=preceding-sibling::LineItem/pkg_li_no) and pkg_no != 0 and primary_ind = 'Y' and string(super_pkg_no) = '']">
							<xsl:variable name="pkgNo" select="pkg_no" />
							<xsl:variable name="subs_facility" select="facility" />
							<xsl:variable name="parLiNo" select="pkg_li_no" />
							<xsl:variable name="bg">
								<xsl:choose>
									<xsl:when test="position() mod 2 =  1">
										<xsl:text>background-color: #EEEEEE;</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>background-color: #FFFFFF;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr style="{$bg}">
								<td align="left" valign="top" colspan="5">
									<b>
										<xsl:value-of select="pkg_desc" />
									</b>
								</td>
								<td align="left" valign="top" rowspan="{count(//GetOrderDetailsInfoResults/LineItem[pkg_no = $pkgNo and pkg_li_no = $parLiNo and perf_no &gt; 0])+1}" style="padding-left: 8px; padding-right: 4px; padding-top: 20px;">

									<xsl:if test="$showChange = 'Y' or $showPackageChange = 'Y'">
										<a href="../subscription/packageDetail.aspx?pkg={$pkgNo}&amp;liSeqNo={$parLiNo}">change</a>
										<BR/>
									</xsl:if>
									<xsl:if test="$showDelete = 'Y'">
										<a href="{$actionURL}?act=DSub&amp;id={$parLiNo}">delete</a>
									</xsl:if>
								</td>
							</tr>
							<!--</xsl:if>-->
							<!-- display primary selection first -->
							<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[pkg_no = $pkgNo and pkg_li_no = $parLiNo and perf_no &gt; 0]">
								<xsl:variable name="liNo" select="li_seq_no" />
								<xsl:variable name="dt">
									<xsl:call-template name="FormatDate">
										<xsl:with-param name="DateTime" select="perf_dt"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="liSeatsTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/due_amt)" />
								<tr  style="{$bg}">
									<td align="left" valign="top" width="275">
										<xsl:value-of select="perf_desc" />
										<BR/>
										<xsl:value-of select="facility_desc" />
										<BR/>
										<xsl:value-of select="$dt" />
									</td>
									<td align="left" valign="top" width="128">
										<xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc"/>
									</td>
									<td align="left" valign="top" width="108">
										<xsl:for-each select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]">
											<xsl:if test="string(seat_num) != ''">
												<xsl:value-of select="seat_row"/>
												<xsl:value-of select="seat_num"/>
												<BR/>
											</xsl:if>
											<xsl:if test="string(seat_num) = ''">
												TBD<BR/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td align="left" valign="top" width="81">
										<xsl:for-each select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]">
											<xsl:value-of select="format-number(number(due_amt), '$####.00', 'dollar')"/>
											<BR/>
										</xsl:for-each>
									</td>
									<td align="right" valign="top">
										<xsl:value-of select="format-number(number($liSeatsTotal), '$####.00', 'dollar')" />
									</td>
								</tr>

							</xsl:for-each>
							<!-- display secondary selection(s) -->
							<!--xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[pkg_no = $pkgNo and primary_ind != 'Y' and li_no != pkg_li_no]"-->
							<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[primary_ind != 'Y' and li_no=$parLiNo]">
								<xsl:variable name="pkgLiNo" select="pkg_li_no"/>
								<xsl:variable name="liNo" select="li_seq_no" />
								<xsl:variable name="liSeatCount" select="count(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo])" />
								<xsl:variable name="liSeatsTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=//GetOrderDetailsInfoResults/LineItem[pkg_li_no=$pkgLiNo]/li_seq_no]/due_amt)" />
								<xsl:variable name="pricePerSeat" select="$liSeatsTotal div $liSeatCount"/>
								<xsl:if test="position() = 1">
									<!-- only show the first row -->
									<tr style="{$bg}">
										<td align="left" valign="top" width="275" style="color: #333333;">
											<b>
												Alternate Seating Choice <xsl:value-of select="position()"/>
											</b>
											<BR/>
											<xsl:value-of select="pkg_desc" />
											<BR/>
										</td>
										<td align="left" valign="top" width="128" style="color: #333333;">
											<xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc"/>
										</td>
										<td align="left" valign="top" width="108" style="color: #333333;">
											<xsl:value-of select="$liSeatCount"/>
										</td>
										<td align="left" valign="top" width="81" style="color: #333333;">
											<xsl:value-of select="format-number(number($pricePerSeat), '$####.00', 'dollar')" />
										</td>
										<td align="right" valign="top" style="color: #333333;">
											<xsl:value-of select="format-number(number($liSeatsTotal), '$####.00', 'dollar')" />
										</td>
										<td></td>
									</tr>
								</xsl:if>
							</xsl:for-each>

						</xsl:for-each>
						<tr>
							<td align="right" valign="top" colspan="4" style="border-top: 1px solid #F15E47; color: #6e6d6d;">
								<b>Total Subscription Cost:</b>
							</td>
							<td align="right" valign="top" style="border-top: 1px solid #F15E47; color: #6e6d6d;">
								<b>
									<xsl:value-of select="format-number($thisTotal, '$####.00', 'dollar')" />
								</b>
							</td>
							<td style="border-top: 1px solid #F15E47;"> </td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:if>
		<!-- /SUBS HANDLING -->

		<!-- SINGLE TIX HANDLING -->
		<xsl:if test="count(//GetOrderDetailsInfoResults/LineItem[pkg_no=0]) &gt; 0">
			<!--<xsl:variable name="thisTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[pkg_no=0]/due_amt)"/>-->
			<xsl:variable name="thisTotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[(li_seq_no=//GetOrderDetailsInfoResults/LineItem[pkg_no = 0 and primary_ind = 'Y']/li_seq_no)]/due_amt)"/>
			
			
			
													
													<!-- BLUE INFO -->
													<table style="text-align:center; width: 100%; padding: 10px;" bgcolor="#ebe8e0">
														<tr>
															<td style="background-color:#00597A; width:50%">
																<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:25px; padding: 10px;">DATE OF VISIT - 
																<span id="arrival-date" style="font-weight:bold;">
																	<a href="#" style="color:#fff; text-decoration: none;">
																	<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[pkg_no=0]">
																	<xsl:variable name="dta">
																	<xsl:call-template name="FormatDateMoDay">
																	<xsl:with-param name="DateTime" select="perf_dt"/>
																	</xsl:call-template>
																	</xsl:variable>																		
																	<xsl:if test="position() = 1">
																	<xsl:value-of select="$dta"/>
																	</xsl:if>
																	</xsl:for-each>
																	</a>
																</span>																
																</div>
															</td>
															
															<td style="background-color:#00597A; width:50%">
																<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:25px; padding: 10px;">ARRIVAL TIME - 
																<strong>
																<a href="#" style="color:#fff; text-decoration: none;">
																<xsl:value-of select="//GetOrderDetailsInfoResults/Order/custom_2"/>
																
																<!-- MANSION TIME
																<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[pkg_no=0 and perf_desc = 'Mansion Tour']">
																<xsl:variable name="liNo" select="li_seq_no"/>
																	<xsl:variable name="perfDesc" select="//GetOrderDetailsInfoResults/LineItem[pkg_no=0]/perf_desc"/>
																	<xsl:if test="position() = 1">
																	<xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc"/>
																	</xsl:if>
																	</xsl:for-each>
																-->
																</a>																
																</strong>
																</div>
															</td>
														</tr>
													</table>													
													
													<!-- ITEM GRID -->													
													<table width="100%" bgcolor="#ebe8e0" style="padding: 10px;">
													<tr style="background-color:#000;">
													
													<td>
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">QUANTITY</div>
													</td>																									
													
													<td>
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">PRICE TYPE</div>
													</td>		
													
													<td>
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">DESCRIPTION</div>
													</td>
													
													<td>
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">TIME</div>
													</td>
													
													<td>
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">UNIT PRICE</div>
													</td>

													<td>
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">TOTAL</div>
													</td>													
													</tr>										
													
												
												<!-- LIST OUT THE TICKETS THEY BOUGHT -->
												<xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[pkg_no=0]">
													<xsl:variable name="liNo" select="li_seq_no"/>
													<xsl:variable name="total" select="sum(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/due_amt)"/>
													<xsl:variable name="perfDesc" select="//GetOrderDetailsInfoResults/LineItem[pkg_no=0]/perf_desc"/>
													
													<tr style="background-color:#FFF;">													
													<td style="border: 1px solid #000;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">
													<!-- QUANTITY -->
													<xsl:value-of select="count(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo])"/>
													</div>
													</td>	
													<td style="border: 1px solid #000;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">
													<!-- PRICE TYPE -->
													<xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/price_type_desc"/>
													</div>
													</td>	
													<td style="border: 1px solid #000;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">
													<!-- DESCRIPTION -->
													<xsl:value-of select="perf_desc"/>
													</div>
													</td>
												
													<td style="border: 1px solid #000;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">
													
													<!-- TIME -->
													<xsl:choose>
													<xsl:when test="contains(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc,':')">
													<xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc"/>
													</xsl:when>
													<xsl:otherwise>
													<xsl:variable name="dtt">
													<xsl:call-template name="FormatTime">
													<xsl:with-param name="JustTime" select="perf_dt"/>
													</xsl:call-template>
													</xsl:variable>
													<xsl:value-of select="$dtt"/>
													</xsl:otherwise>
													</xsl:choose>
													
													</div>
													</td>
													<td style="border: 1px solid #000;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">
													<!-- UNIT PRICE -->
													<xsl:for-each select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]">
													<xsl:if test="position() = 1">
													<xsl:value-of select="format-number(number(due_amt), '$####.00', 'dollar')"/>
													</xsl:if>
													</xsl:for-each>
													</div>
													</td>													
													<td style="border: 1px solid #000;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; padding: 10px;">
													<!-- TOTAL PRICE -->
													<xsl:value-of select="format-number(number($total), '$####.00', 'dollar')"/>
													</div>
													</td>
													</tr>
												</xsl:for-each>
													
													
													<tr>
													<td></td>	
													<td></td>	
													<td></td>
													<td></td>
													<td style="background-color:#000;">
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight: bold; padding: 10px;">TOTAL:</div>
													</td>													
													<td style="border: 1px solid #000; background-color:#FFF;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight: bold; padding: 10px;"><xsl:value-of select="format-number($thisTotal, '$####.00', 'dollar')" /></div>
													</td>
													</tr>
													
													<tr>
													<td></td>	
													<td></td>	
													<td></td>
													<td></td>
													<td style="background-color:#000;">
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight: bold; padding: 10px;">PAID:</div>
													</td>													
													<td style="border: 1px solid #000; background-color:#FFF;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight: bold; padding: 10px;"><xsl:value-of select="format-number(//GetOrderDetailsInfoResults/Order/tot_paid_amt, '$####.00', 'dollar')"/></div>
													</td>
													</tr>
													
													<tr>
													<td></td>	
													<td></td>	
													<td></td>
													<td></td>
													<td style="background-color:#000;">
													<div class="text" style="color:#FFF; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight: bold; padding: 10px;">BALANCE:</div>
													</td>													
													<td style="border: 1px solid #000; background-color:#FFF;">
													<div class="text" style="color:#000; font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:15px; line-height:15px; font-weight: bold; padding: 10px;"><xsl:value-of select="format-number(//GetOrderDetailsInfoResults/Order/balance_due, '$####.00', 'dollar')"/></div>
													</td>
													</tr>
													
													</table>
													
													<table style="text-align:center; width: 100%;" bgcolor="#ebe8e0">
														<tr>
															<td>
																<div class="text" style="font-family:Tahoma, Arial, sans-serif, 'Open Sans'; font-size:12px; line-height:20px;">
																All sales are final, non-transferable, and non-refundable.
																</div>
																<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"><tr><td height="28" class="spacer" style="font-size:0pt; line-height:0pt; text-align:center; width:100%; min-width:100%"> </td></tr></table>
															</td>
														</tr>
													</table>

			<!-- STUFF WE DON'T NEED
        <tr>
          <td align="left" valign="top">
            <table align="left" valign="top" cellpadding="2" cellspacing="0" width="100%" class="lineitem">
              <xsl:for-each select="//GetOrderDetailsInfoResults/LineItem[pkg_no=0]">

                <xsl:variable name="bg">
                  <xsl:choose>
                    <xsl:when test="position() mod 2 =  1">
                      <xsl:text>background-color: #EEEEEE;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>background-color: #FFFFFF;</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>

                <xsl:variable name="liNo" select="li_seq_no"/>
                <xsl:variable name="dt">
                  <xsl:call-template name="FormatDate">
                    <xsl:with-param name="DateTime" select="perf_dt"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="total" select="sum(//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/due_amt)"/>
                <tr style="{$bg}">
                  <td align="left" valign="top" width="275">
                    <xsl:value-of select="perf_desc"/>

                  </td>
                  <td align="left" valign="top" width="128">
                    <xsl:value-of select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]/zone_desc"/>
                  </td>

				  <td align="left" valign="top" width="108">
                  <xsl:for-each select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]">
                    <xsl:if test="string(seat_num) != ''">
                      <xsl:value-of select="seat_row"/>
                      <xsl:value-of select="seat_num"/>
                      <BR/>
                    </xsl:if>
                    <xsl:if test="string(seat_num) = ''">
                      TBD<BR/>
                    </xsl:if>
                  </xsl:for-each>
                </td>
                <td align="left" valign="top" width="81">
                  <xsl:for-each select="//GetOrderDetailsInfoResults/SubLineItem[li_seq_no=$liNo]">
                    <xsl:value-of select="format-number(number(due_amt), '$####.00', 'dollar')"/>
                    <BR/>
                  </xsl:for-each>
                </td>
                <td align="right" valign="top">
                  <xsl:value-of select="format-number(number($total), '$####.00', 'dollar')"/>
                </td>
                <td align="left" valign="top" style="padding-left: 4px; padding-right: 4px;">
                  <xsl:if test="$showChange = 'Y'"><a href="ticketorderform.aspx?act=CTix&amp;id={li_seq_no}">change</a><BR/>
                  </xsl:if>
                  <xsl:if test="$showDelete = 'Y'"><a href="{$actionURL}?act=DTix&amp;id={li_seq_no}">delete</a></xsl:if>
                </td>
				

                </tr>
              </xsl:for-each>
              <tr>
                <td align="right" valign="top" colspan="4" style="border-top: 1px solid #F15E47; color: #6e6d6d;">
                  <b>Total Single Tickets Cost:</b>
                </td>
                <td align="right" valign="top" style="border-top: 1px solid #F15E47; color: #6e6d6d;">
                  <b>
                    <xsl:value-of select="format-number($thisTotal, '$####.00', 'dollar')" />
                  </b>
                </td>
                <td style="border-top: 1px solid #F15E47;"></td>
              </tr>
            </table>
          </td>
        </tr>
-->
		</xsl:if>
		<!-- /SINGLE TIX HANDLING -->

		<!-- GIFT CERT HANDLING -->
		<xsl:if test="count(//GetOrderDetailsInfoResults/Payment[gc_no != '' and payment_amt &lt; 0]) &gt; 0">
			<xsl:variable name="thisTotal" select="number(sum(//GetOrderDetailsInfoResults/Payment[gc_no != ''  and payment_amt &lt; 0]/payment_amt)*-1)"/>
			<tr>
				<th align="left" valign="top" style="background-color: #F15E47;	color: #e2e3e3;	font-weight: bold;	font-size: 12px;	text-align: left;">
					<b>Gift Certificate(s):</b>
				</th>
			</tr>
			<tr>
				<td align="left" valign="top">
					<table align="left" valign="top" cellpadding="2" cellspacing="0" width="100%" class="lineitem">
						<tr>
							<th align="left" valign="top" width="100%" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Description</th>
							<th width="50" align="right" valign="top" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Total</th>
							<th>
								<!-- change / delete -->
							</th>
						</tr>
						<xsl:for-each select="//GetOrderDetailsInfoResults/Payment[gc_no != '' and payment_amt &lt; 0]">
							<xsl:variable name="bg">
								<xsl:choose>
									<xsl:when test="position() mod 2 =  1">
										<xsl:text>background-color: #EEEEEE;</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>background-color: #FFFFFF;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr style="{$bg}">
								<td align="left" valign="top" width="100%">
									<b>Gift Certificate:</b><BR/>
									Redemption Code: <xsl:value-of select="gc_no"/>
								</td>
								<td align="right" valign="top" width="50" >
									<xsl:value-of select="format-number(number(payment_amt) * -1, '$####.00', 'dollar')"/>
								</td>
								<td align="left" valign="top" style="padding-left: 4px; padding-right: 4px;">
									<xsl:if test="$showChange = 'Y'">
										<a href="giftcertorderform.aspx?act=CGift&amp;id={gc_no}">change</a>
										<BR/>
									</xsl:if>
									<xsl:if test="$showDelete = 'Y'">
										<a href="{$actionURL}?act=DGift&amp;id={gc_no}">delete</a>
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td align="right" valign="top" style="border-top: 1px solid #F15E47; color: #6e6d6d;" width="100%">
								<b>Total Gift Certificate Cost:</b>
							</td>
							<td align="right" valign="top" style="border-top: 1px solid #F15E47; color: #6e6d6d;" width="50">
								<b>
									<xsl:value-of select="format-number($thisTotal, '$####.00', 'dollar')" />
								</b>
							</td>
							<td style="border-top: 1px solid #F15E47;"></td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:if>
		<!-- /GIFT CERT HANDLING -->

		<!-- CONTRIB HANDLING -->
		<xsl:if test="count(//GetOrderDetailsInfoResults/Contribution) &gt; 0 or count(//GetOrderDetailsInfoResults/Payment[payment_amt &lt; 0 and gc_no = '']) &gt; 0">
			<xsl:variable name="thisPmtTotal" select="sum(//GetOrderDetailsInfoResults/Payment[payment_amt &lt; 0 and gc_no = '']/payment_amt)*-1"/>
			<xsl:variable name="thisContribTotal" select="sum(//GetOrderDetailsInfoResults/Contribution/cont_amt)"/>
			<xsl:variable name="thisPmtCount" select="count(//GetOrderDetailsInfoResults/Payment[payment_amt &lt; 0 and gc_no = ''])"/>
			<tr>
				<th align="left" valign="top" style="background-color: #F15E47;	color: #e2e3e3;	font-weight: bold;	font-size: 12px;	text-align: left;">
					<b>Donation:</b>
				</th>
			</tr>
			<tr>
				<td align="left" valign="top">
					<table align="left" valign="top" cellpadding="2" cellspacing="0" width="100%" class="lineitem">
						<tr>
							<th align="left" valign="top" width="100%" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Description</th>
							<th width="50" align="right" valign="top" style="background-color:#FFFFFF ! important; font-size: 11px ! important; font-weight: bold; text-decoration: underline;color: #F15E47;">Total</th>
							<th>
								<!-- change / delete -->
							</th>
						</tr>
						<xsl:for-each select="//GetOrderDetailsInfoResults/Payment[payment_amt &lt; 0 and gc_no = '']">
							<xsl:variable name="bg">
								<xsl:choose>
									<xsl:when test="position() mod 2 =  1">
										<xsl:text>background-color: #EEEEEE;</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>background-color: #FFFFFF;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr style="{$bg}">
								<td align="left" valign="top" width="100%">
									<xsl:value-of select="description"/>
								</td>
								<td width="50" align="right" valign="top">
									<xsl:value-of select="format-number(number(payment_amt) * -1, '$####.00', 'dollar')" />
								</td>
								<td style="padding-left: 4px; padding-right: 4px;">
									<xsl:if test="$showChange = 'Y'">
										<a href="donationorderform.aspx?act=CDon&amp;id={payment_no}">change</a>
										<BR/>
									</xsl:if>
									<xsl:if test="$showDelete = 'Y'">
										<a href="{$actionURL}?act=DDon&amp;id={payment_no}">delete</a>
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="//GetOrderDetailsInfoResults/Contribution">
							<xsl:variable name="bg">
								<xsl:choose>
									<xsl:when test="position() mod 2 =  1">
										<xsl:if test="thisPmtCount mod 2 = 1">background-color: #EEEEEE</xsl:if>
										<xsl:if test="thisPmtCount mod 2 != 1">background-color: #FFFFFF</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="thisPmtCount mod 2 = 1">background-color: #FFFFFF</xsl:if>
										<xsl:if test="thisPmtCount mod 2 != 1">background-color: #EEEEEE</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr style="{$bg}">
								<td align="left" valign="top" width="100%">
									<xsl:value-of select="fund_desc"/>
								</td>
								<td width="50" align="right" valign="top">
									<xsl:value-of select="format-number(number(cont_amt), '$####.00', 'dollar')" />
								</td>
								<td align="left" valign="top" style="padding-left: 4px; padding-right: 4px;">
									<xsl:if test="$showChange = 'Y'">
										<a href="{$actionURL}?act=CDon&amp;id={ref_no}">change</a>
										<BR/>
									</xsl:if>
									<xsl:if test="$showDelete = 'Y'">
										<a href="{$actionURL}?act=DDon&amp;id={ref_no}">delete</a>
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td align="right" valign="top" style="border-top: 1px solid #F15E47; color: #6e6d6d;" width="100%">
								<b>Total Contribution Cost:</b>
							</td>
							<td align="right" valign="top" width="50" style="border-top: 1px solid #F15E47; color: #6e6d6d;">
								<b>
									<xsl:value-of select="format-number(number($thisPmtTotal + $thisContribTotal), '$####.00', 'dollar')" />
								</b>
							</td>
							<td style="border-top: 1px solid #F15E47;"></td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:if>
		<!-- /CONTRIB HANDLING -->


		<!-- generate section subtotals and order subtotals, total -->
		<!--<xsl:variable name="subscription_subtotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[pkg_no!=0 and ((sli_status=2 or sli_status=3 or sli_status=12 or sli_status=6) or (primary_ind='Y'))]/due_amt)" />-->
		<xsl:variable name="subscription_subtotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[not(li_seq_no=//GetOrderDetailsInfoResults/LineItem[pkg_no !=0 and primary_ind != 'Y']/li_seq_no) and pkg_no!=0 and (sli_status=2 or sli_status=3 or sli_status=12 or sli_status=6)]/due_amt)" />
		<!--<xsl:variable name="singTix_subtotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[pkg_no=0]/due_amt)"/>-->
		<xsl:variable name="singTix_subtotal" select="sum(//GetOrderDetailsInfoResults/SubLineItem[(li_seq_no=//GetOrderDetailsInfoResults/LineItem[pkg_no=0 and primary_ind = 'Y']/li_seq_no)]/due_amt)" />
		<xsl:variable name="giftCert_subtotal" select="number(sum(//GetOrderDetailsInfoResults/Payment[gc_no != '' and payment_amt &lt; 0]/payment_amt)*-1)"/>
		<xsl:variable name="giftCert_applied" select="sum(//GetOrderDetailsInfoResults/Payment[gc_no != '' and payment_amt &gt; 0]/payment_amt)" />
		<xsl:variable name="contrib_subtotal" select="number(sum(//GetOrderDetailsInfoResults/Payment[payment_amt &lt; 0 and gc_no = '']/payment_amt)*-1)+sum(//GetOrderDetailsInfoResults/Contribution/cont_amt)"/>
		<xsl:variable name="fee_total" select="sum(//GetOrderDetailsInfoResults/Fee/total_fees)"/>
		<!--xsl:variable name="fee_total" select="//GetOrderDetailsInfoResults/Order/tot_fee_paid_amt"/-->
		<xsl:variable name="subtotal" select="$subscription_subtotal+$singTix_subtotal+$giftCert_subtotal+$contrib_subtotal"/>
		<xsl:variable name="order_total" select="$fee_total+$subtotal"/>
		<!-- /subtotals -->
		<table>
			<tr>
				<td align="right" valign="top">
					<table align="right" valign="top" cellpadding="2" cellspacing="0" class="lineitem"  style="padding-top: 20px;">
						<xsl:if test="$order_total != $subtotal">
							<tr>
								<td align="right" valign="top" style="padding-right: 10px;color: #6e6d6d;">
									<b>Order Subtotal:</b>
								</td>
								<td align="right" valign="top" style="color: #6e6d6d;">
									<b>
										<xsl:value-of select="format-number(number($subtotal), '$####.00', 'dollar')" />
									</b>
								</td>
								<td></td>
							</tr>
							<tr>
								<td align="right" valign="top" style="padding-right: 10px; color: #6e6d6d;">
									<b>Fees:</b>
								</td>
								<td align="right" valign="top" style="color: #6e6d6d;">
									<b>
										<xsl:value-of select="format-number(number($fee_total), '$####.00', 'dollar')" />
									</b>
								</td>
								<td></td>
							</tr>
						</xsl:if>
						<!--
            <tr>
              <td align="right" valign="top" style="border-top: 1px solid #F15E47;padding-right: 10px; color: #6e6d6d;">
                <b>Toad El:</b>
              </td>
              <td align="right" valign="top" style="border-top: 1px solid #F15E47; color: #6e6d6d;">
                <b>
                  <xsl:value-of select="format-number(number($order_total), '$####.00', 'dollar')" />
                </b>
              </td>
              <td style="color:#FFFFFF">
                <xsl:if test="$showChange = 'Y'">
                  change
                  <BR/>
                </xsl:if>
                <xsl:if test="$showDelete = 'Y'">
                  delete
                </xsl:if>
              </td>
            </tr>
			-->
						<xsl:if test="$giftCert_applied &gt; 0">
							<tr>
								<td align="right" valign="top" style="padding-top: 10px; padding-right: 10px; color: #6e6d6d;">
									<b>Gift Certificate Value Applied to Order:</b>
								</td>
								<td align="right" valign="top" style="padding-top: 10px; color: #6e6d6d;">
									<b>
										<xsl:value-of select="format-number(number($giftCert_applied), '$####.##', 'dollar')" />
									</b>
								</td>
								<td></td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
		</table>

		<!--
      <xsl:if test="count(//GetOrderDetailsInfoResults/LineItem[primary_ind != 'Y']) &gt; 0 and count(//GetOrderDetailsInfoResults/LineItem[primary_ind = 'Y']) &gt; 0">
        <tr>
          <td align="left" class="c2 medium bTop">
            <b>Your Order Contains Alternate or Upgrade Package Line Items</b>
            <BR/>
            You will be billed now for the original cost of your order.  Should your alternate/upgrade seating request be granted, your account will be credited any difference between your original and alternate/upgrade price, or, should your alternate/upgrade option have a greater cost than your original subscription order, you will be billed at that time for the cost difference.

          </td>
        </tr>
      </xsl:if>
		-->

	</xsl:template>


	<!--<xsl:template name="itemCount">
    <xsl:if test="//GetOrderDetailsInfoResults/LineItem[pkg_no=0 and perf_desc = 'Mansion Tour']">
      <xsl:variable name="liSeqNo" select="li_seq_no"/>
      <xsl:value-of select="count(//GetOrderDetailsInfoResults/SubLineItem/[li_seq_no=$liSeqNo])"/>
      
    </xsl:if>
  </xsl:template>-->

	<!-- format date time values -->
	<xsl:template name="FormatDateMoDay">
		<xsl:param name="DateTime"/>
		<xsl:variable name="month">
			<xsl:value-of select="substring($DateTime,6,2)" />
		</xsl:variable>
		<xsl:variable name="day">
			<xsl:value-of select="substring($DateTime,9,2)" />
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$month = 01">
				Jan <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 02">
				Feb <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 03">
				Mar <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 04">
				Apr <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 05">
				May <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 06">
				Jun <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 07">
				Jul <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 08">
				Aug <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 09">
				Sep <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 10">
				Oct <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 11">
				Nov <xsl:value-of select="$day" />
			</xsl:when>
			<xsl:when test="$month = 12">
				Dec <xsl:value-of select="$day" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="FormatDate">
		<xsl:param name="DateTime"/>
		<xsl:variable name="year">
			<xsl:value-of select="substring($DateTime,1,4)" />
		</xsl:variable>
		<xsl:variable name="mo">
			<xsl:value-of select="substring($DateTime,6,2)" />
		</xsl:variable>
		<xsl:variable name="day">
			<xsl:value-of select="substring($DateTime,9,2)" />
		</xsl:variable>
		<xsl:variable name="time">
			<xsl:value-of select="substring($DateTime,12,5)"/>
		</xsl:variable>
		<xsl:variable name="hour">
			<xsl:value-of select="number(substring($time,1,2))" />
		</xsl:variable>
		<xsl:variable name="minute">
			<xsl:value-of select="number(substring($time,4,2))" />
		</xsl:variable>
		<xsl:variable name="finalTime">
			<xsl:call-template name="AdjustTime">
				<xsl:with-param name="Hour1" select="$hour"/>
				<xsl:with-param name="Minute1" select="$minute"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$mo"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$day"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$year"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$finalTime" />
	</xsl:template>
	
	<xsl:template name="FormatTime">
		<xsl:param name="JustTime"/>		
		<xsl:variable name="time">
			<xsl:value-of select="substring($JustTime,12,5)"/>
		</xsl:variable>
		<xsl:variable name="hour">
			<xsl:value-of select="number(substring($time,1,2))" />
		</xsl:variable>
		<xsl:variable name="minute">
			<xsl:value-of select="number(substring($time,4,2))" />
		</xsl:variable>
		<xsl:variable name="finalTime">
			<xsl:call-template name="AdjustTime">
				<xsl:with-param name="Hour1" select="$hour"/>
				<xsl:with-param name="Minute1" select="$minute"/>
			</xsl:call-template>
		</xsl:variable>		
		<xsl:value-of select="$finalTime" />
	</xsl:template>

	<xsl:template name="AdjustTime">
		<xsl:param name="Hour1"/>
		<xsl:param name="Minute1"/>
		<xsl:variable name="FinalHourNum">
			<xsl:value-of select="number($Hour1)"/>
		</xsl:variable>
		<xsl:variable name="FinalMinute">
			<xsl:value-of select="number($Minute1)"/>
		</xsl:variable>
		<xsl:variable name="AMPM">
			<xsl:choose>
				<xsl:when test="number($FinalHourNum) &gt; 11">pm</xsl:when>
				<xsl:otherwise>am</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="finalHour">
			<xsl:choose>
				<xsl:when test="$FinalHourNum = 0">
					<xsl:value-of select="$FinalHourNum + 12"/>
				</xsl:when>
				<xsl:when test="$FinalHourNum &lt; 13">
					<xsl:value-of select="$FinalHourNum"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$FinalHourNum - 12"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="$finalHour"/>
		<xsl:value-of select="format-number($FinalMinute,':00')"/>
		<xsl:value-of select="$AMPM" />
	</xsl:template>

</xsl:stylesheet>