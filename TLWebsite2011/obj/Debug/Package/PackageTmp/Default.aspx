<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TLWebsite2011.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Technically Learning</title>
	<meta http-equiv="Content-Type" content="text/html; charset=us-ascii" />
	<meta name="description" content="Technically Learning is a non-profit based in Seattle, WA to help inspire students in the Science, Technology, Engineering and Mathemetics Fields" />
	<meta name="keywords" content="Technically, Learning, non-profit, Technology, Education, Seattle, WA, Science, Technology, Engineering, Mathematics, Minorities, Women, Girls, Students" />
	<link href="/SiteResources/stylesheet.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.5.3/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#featured > ul").tabs({ fx: { opacity: "toggle"} }).tabs("rotate", 5000, true);
		});

	</script>
	<script type="text/javascript">

		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-286230-5']);
		_gaq.push(['_trackPageview']);

		(function () {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();

	</script>
</head>
<body>
	<form id="form1" runat="server">
	<table summary="" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<img src="SiteResources/Images/bg-top-shadow.jpg" alt="bg-top-shadow" />
				<div class="pgbody">
					<div class="header">
						<div class="header-wrap">
							<a href="Default.aspx">
								<img src="SiteResources/Images/Logo.jpg" alt="Technically Learning - Enabling teachers to inspire and engage students in science, engineering, technology and math" /></a>
						</div>
						<div class="menu">
							<a class="navlink" href="Default.aspx">Home</a> <a class="navlink" href="Show.aspx?page=about">
								About</a> <a class="navlink" href="News.aspx">News</a> <a class="navlink" href="Show.aspx?page=programs">
									Programs</a> <a class="navlink" href="Show.aspx?page=resources">Resources</a>
							<a class="navlink" href="Show.aspx?page=donate">Donate</a><br />
						</div>
					</div>
					<div class="main">
						<div class="header-tag">
							Enabling teachers to inspire and engage students in science, engineering, technology
							and math.</div>
						<!--BEGIN Flashy Header-->
						<div id="featured">
							<ul class="ui-tabs-nav">
								<li class="ui-tabs-nav-item ui-tabs-selected" id="nav-fragment-1"><a href="#fragment-1">
								</a></li>
								<li class="ui-tabs-nav-item" id="nav-fragment-2"><a href="#fragment-2"></a></li>
								<li class="ui-tabs-nav-item" id="nav-fragment-3"><a href="#fragment-3"></a></li>
								<li class="ui-tabs-nav-item" id="nav-fragment-4"><a href="#fragment-4"></a></li>
								<li class="ui-tabs-nav-item" id="nav-fragment-5"><a href="#fragment-5"></a></li>
								<!--<li class="ui-tabs-nav-item" id="nav-fragment-6"><a href="#fragment-6"></a></li>-->
							</ul>
							<!-- First Content -->
							<div id="fragment-1" class="ui-tabs-panel" style="">
								<a href="#">
									<img src="/SiteResources/Images/banner1.jpg" border="0" alt="" /></a>
								<div class="info">
									<h2>
										Innovative Curriculum</h2>
									<p>
										<a href="#">Technically Learning's innovative curriculum helps inspire students to engage
											in Science, Technology, Engineering and Mathemetics in new and exciting ways. They'll
											be learning before they realize it!</a></p>
								</div>
							</div>
							<!-- Second Content -->
							<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide" style="">
								<a href="#">
									<img src="/SiteResources/Images/banner2.jpg" border="0" alt="" /></a>
								<div class="info">
									<h2>
										Hands On</h2>
									<p>
										<a href="#">Hands on from the beginning. Students immediatly get their hands dirty building
											rovers, rubber-band powered cars and other exciting LEGO based projects</a></p>
								</div>
							</div>
							<!-- Third Content -->
							<div id="fragment-3" class="ui-tabs-panel ui-tabs-hide" style="">
								<a href="#">
									<img src="/SiteResources/Images/banner3.jpg" border="0" alt="" /></a>
								<div class="info">
									<h2>
										Exciting Math!</h2>
									<p>
										<a href="#">Students use hands on labs to learn about ratios, algebra and other complex
											concepts.</a></p>
								</div>
							</div>
							<!-- Fourth Content -->
							<div id="fragment-4" class="ui-tabs-panel ui-tabs-hide" style="">
								<a href="#">
									<img src="/SiteResources/Images/banner4.jpg" border="0" alt="" /></a>
								<div class="info">
									<h2>
										Engaging Science</h2>
									<p>
										<a href="#">Students collaborate to solve difficult problems to create LEGO rovers that
											will detect objects, follow lines or use other sensors to make complex decisions.</a></p>
								</div>
							</div>
							<!-- Fifth Content -->
							<div id="fragment-5" class="ui-tabs-panel ui-tabs-hide" style="">
								<a href="#">
									<img src="/SiteResources/Images/banner5.jpg" border="0" alt="" /></a>
								<div class="info">
									<h2>
										Environmental Projects</h2>
									<p>
										<a href="#">Students learn how wind generation and other future technology work with
											hands on guidance from their Technically Learning trained teacher.</a></p>
								</div>
							</div>
							<!-- Sixth Content -->
							<!--<div id="fragment-6" class="ui-tabs-panel ui-tabs-hide" style="">
                    <a href="#" ><img src="SiteResources/Images/banner6.jpg" border="0" alt="" /></a>
                    <div class="info" >
                      <h2><a href="#" >Engaging Science</a></h2>
                      <p><a href="#" >Students collaborate to solve difficult problems to create LEGO rovers that will
                            detect objects, follow lines or use other sensors to make complex decisions.</a></p>
                    </div>
                  </div>-->
						</div>
						<!--END Flashy Header-->
						<div class="sub-main">
							<div class="sub-main-box">
								<div class="sub-main-title">
									<a href="Show.aspx?page=What_We_Do">What We Do</a></div>
								<div class="idx-detail-wrap">
									<img class="idx-detail-pic" src="/SiteResources/Images/kids-sm.jpg" alt="kids-robotics" />
									<div class="idx-detail-content">
										<div class="idx-detail-title">
											Lego Robots</div>
										Our LEGO robotics activities stress the scientific method by testing hypothesis
										through experimentation, iterating designs, collaborating in groups, and documenting
										results. Learn More
									</div>
								</div>
								<div class="idx-detail-wrap">
									<img class="idx-detail-pic" src="/SiteResources/Images/animation-sm.jpg" alt="animation" />
									<div class="idx-detail-content">
										<div class="idx-detail-title">
											3D Animation</div>
										Students use a visual programming environment, Alice, to create 3D animations. Students
										develop computer programming knowledge, build problem solving skills, and work in
										groups. Learn More
									</div>
								</div>
								<div class="idx-detail-wrap">
									<img class="idx-detail-pic" src="/SiteResources/Images/prog-sm.jpg" alt="programming" />
									<div class="idx-detail-content">
										<div class="idx-detail-title">
											Basic Programming</div>
										Students use a programming language, Scratch, to design interactive stories, animations,
										and games, while learning important math and logic concepts.
										<br />
										Learn More
									</div>
								</div>
							</div>
							<img class="sub-divider" src="/SiteResources/Images/sub-divider.jpg" alt="sub-divider" />
							<div class="sub-main-box">
								<div class="sub-main-title">
									<a href="News.aspx">News</a></div>
								<asp:ListView ID="NewsList" runat="server">
									<LayoutTemplate>
										<asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
									</LayoutTemplate>
									<ItemTemplate>
										<div class="idx-news-wrap">
											<div class="idx-news-content">
												<div class="sub-main-title-small">
													<%# Eval("Title")%></div>
												<div class="idx-news-title">
													<%# Eval("Date")%>
													- Posted by
													<%# Eval("Author")%></div>
												<%# Eval("Body")%>
											</div>
										</div>
									</ItemTemplate>
									<EmptyDataTemplate>
										No News has been posted yet.
									</EmptyDataTemplate>
								</asp:ListView>
							</div>
						</div>
						<div class="sub-content">
							<div class="sub-content-box">
								<div class="sub-content-title">
									<a href="Show.aspx?page=GetInvolved">Get Involved</a></div>
								<b>Parents, Teachers, and School Administrators</b>
								<p>
									We partner with public schools to integrate technological hands-on projects into
									existing school curriculum. We can work with the school's teachers to craft engaging
									activities utilizing technology to meet existing requirements.</p>
								<b>Volunteering Time</b><p>
									Regardless of your technical skill, you can help us improve public school education.
									If you or your business are looking to volunteer your time please contact <a href="mailto:getinvolved@technicallylearning.org">
										getinvolved@technicallylearning.org</a>.
								</p>
							</div>
							<div class="break">
							</div>
							<div class="sub-feature-box">
								<div class="box">
									<div class="sub-feature-wrap">
										<div class="sub-feature-title">
											<a href="Show.aspx?page=donate">Please Donate</a></div>
										Help Technically Learning continue to inspire children across Washington State in
										the Science, Technology, Engineering and Math fields through innovative activities.
										<p>
											We need your help to engage new schools and bring on new volunteers in the coming
											year.</p>
										<div class="button">
											<a href="Show.aspx?page=donate"><span class="donate-button">Donate Now</span></a></div>
									</div>
								</div>
							</div>
							<div class="break">
							</div>
							<div class="sub-feature-box">
								<div class="box">
									<div class="sub-feature-wrap">
										<div class="sub-feature-title">
											Social Networks</div>
										<a href="https://twitter.com/#!/TechLearn">
											<img class="social-icon" src="/SiteResources/Images/twitter-icon-sm.png" alt="twitter-icon"
												width="180" /></a> <a href="https://www.facebook.com/TechnicallyLearning">
													<img class="social-icon" src="/SiteResources/Images/facebook-icon-sm.png" alt="facebook-icon"
														width="180" /></a> <a href="http://www.linkedin.com/company/379262">
															<img class="social-icon" src="/SiteResources/Images/linkedin-icon-sm.png" alt="linkedin-icon"
																width="180" /></a> <a href="http://www.idealnetwork.com/seattle/technicallylearning">
																	<img class="social-icon" src="/SiteResources/Images/IdealNetworkLogo.gif" alt="idealNetwork-icon"
																		width="180" /></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="footer-nav">
						<a class="footer-link" href="http://visitor.r20.constantcontact.com/d.jsp?llr=54vsuydab&p=oi&m=1103559743486"
							target="_blank">Signup for the Newsletter</a> <a class="footer-link" href="SiteMap.aspx">
								Sitemap</a> <a class="footer-link" href="Show.aspx?page=PrivacyPolicy">Privacy Policy</a>
						<a class="footer-link" href="Show.aspx?page=About">About</a> <a class="footer-link"
							href="Show.aspx?page=Contact">Contact</a>
					</div>
					<div class="footer">
						Copyright &copy; 2011 Technically Learning. All Rights Reserved. Designed by <a href="http://www.revelae.com"
							target="_blank">Revelae Design Studio</a><br />
						<asp:Label ID="loginlogout" runat="server" /></div>
				</div>
				<img src="/SiteResources/Images/bg-bottom-shadow.jpg" alt="bg-bottom-shadow" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
