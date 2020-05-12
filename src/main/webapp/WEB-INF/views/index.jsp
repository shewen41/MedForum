<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<spring:url var="css" value="/resources/mdb/css" />
<spring:url var="js" value="/resources/mdb/js" />
<spring:url var="img" value="/resources/mdb/img" />
<spring:url var="scss" value="/resources/mdb/scss" />
<spring:url var="font" value="/resources/mdb/font" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>${title}</title>


<script>

	window.menu = '${title}';
	
	window.contextRoot = '${contextRoot}';

	
</script>

<!-- google fonts -->
<link rel="stylesheet" href="${css}/all.min.css"/>
	
		<!-- Bootstrap core CSS -->
	<link href="${css}/bootstrap.min.css" rel="stylesheet">
	
		<!-- Material Design Bootstrap -->
	<link href="${css}/mdb.min.css" rel="stylesheet">
	
		<!-- Your custom styles (optional) -->
	<link rel="stylesheet" href="${css}/style.css">




</head>


<body style="font-family: 'lato', sans-serif; background-color:#e3f2fd">
		
		<section>
		
			<div class="container">
			
				<div class="row mb-2 mt-2">
					<div class="col-md-12 text-black text-center border rounded-lg mb-0 mx-0 px-0" style="background-color:#bbdefb">
						<h2 class="mb-0"><strong>Solution Forum</strong></h2>
						<p class="py-0 my-0">Welcome, <a href="#">Shewen(m)</a>: <a href="#">Edit Profile</a>/<a href="#">Followed Topics</a>/<a href="#">Latest Topics</a>/<a href="#">Trending</a></p>
						<p>Date:<script> var date = new Date(); document.write(date);</script>/<a href="#">LogOut()</a></p>
						<p>
							<form class="form-inline active-cyan-4 ml-5">
								<input type="text" name="search" class="rounded form-control form-control-sm  w-75" placeholder="Search" aria-label="Search" /><button type="button" class="btn btn-sm blue-gradient">Search</button>
							</form>
						</p>
					</div>
				</div>

				<div class="row mb-2">
					<div class="col-md-12 text-black border rounded-lg mb-0 mx-0 px-0" style="background-color:#bbdefb">
						<strong><h3 class="text-center">Solution Forum</h3></strong>
						<b><p style="background-color:#e3f2fd" class="my-0 py-2 px-2"><a href="#">M-Care / General: </a><a href="#">Cancer, </a><a href="#">Brain and Nerves, </a><a href="#">Allergies, </a><a href="#">Infections, </a><a href="#">Heart Health, </a>
							<a href="#">Bones Joint and Muscle, </a><a href="#">Diabetes, </a><a href="#">Eyes, </a><a href="#">Sexual, </a><a href="#">Symptoms</a>
						</p></b>
						<b><p class="my-0 py-2 px-2"><a href="#">Cancer: </a><a href="#">Breast Cancer, </a><a href="#">Prostate Cancer, </a><a href="#">Bowel Cancer, </a><a href="#">Oesophageal Cancer, </a><a href="#">Cervical Cancer</a></p></b>
						<b><p style="background-color:#e3f2fd" class="my-0 py-2 px-2"><a href="#">Sexual: </a><a href="#">Weak Erection, </a><a href="&#187;#">Watery Sperm, </a><a href="#">Goloconcos</a><a href="#">Still Processing, </a><a href="#">Quick Ejaculation</a></p></b>
					</div>
				</div>
				
				<div class="row mb-2">
					<div class="col-md-12 text-black border rounded-lg mb-0 mx-0 px-0" style="background-color:#bbdefb">
						<b><p class="my-0 py-2 px-2 text-center"><a href="">Latest news / </a><a href="#">Follow on Twitter / </a><a href="#">Follow on Facebook</a></p></b>
						<div style="background-color:#e3f2fd">
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Facebook Boss, Mark Zuckerberg Mocked On Twitter Over His New Haircut (Photos)</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Fresh Graduate Rocks "Cheated In Every Exam" T-shirt (Pictured)</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Thief Abandons Mission To Watch Couple Have Sex In Lagos (Photo) </a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Wizkid Holds Tiwa Savage's Backside On Stage In Paris (Video)</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Confession Of A Yahoo Yahoo Man Who Is An MSc Holder Goes Viral (Photos, Video)</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija Winner, Mercy Steps Out In Skimpy Blue Dress For Her Victory Party In Lagos</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">One Reason Not To Act So Wickedly </a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">FOI: SERAP Seeks Details Of Spending On Failed $460m CCTV, Other Chinese Loans </a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Six Wrong Reasons For Attending Church Service</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">How To Secure The Help Of God As A Christian</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Jesus Never Wore Robe": A Preaching Against Men Who Wear Women's Clothing</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">Meet Ex-Nigerian Prison Inmate Who Earned Two Degrees While In Prison</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
							<b><p class="my-0 py-2 px-2 text-center">&#187;<a class="px-1" href="#">BBNaija's Mercy Making Jest Of Ike's Walking Step In The Dressing Room</a>&#171;</p></b>
						</div>
						<b><p class="my-0 py-2 px-2 text-center"><a href="#">(1) (2) (3) (4) (5) (6) (7) (8) (9) (10) (11) / Mail Supermods</a></p></b>
					</div>
				</div>
				
				<div class="row mb-2">
					<div class="col-md-12 text-black text-center border rounded-lg mb-0 mx-0 px-0" style="background-color:#e3f2fd">
						<b><p class="my-0 py-0 px-2">Members Online:</p></b>
						<b><p class="my-0 py-0 px-2">(2542 Members and 6422 Guests online in last 5 minutes!)</p></b>
					</div>
				</div>
				<div class="row">
				<div class="col-md-12 text-center">
					<b><a href="#">(GO UP)</a></b>	
				</div>
				</div>
			</div>
		</section>
		
		<footer>
			<div class="container">
				<div class="row mb-2">
					<div class="col-md-12 text-black text-center border rounded-lg mb-0 mx-0 px-0" style="background-color:#bbdefb">
						<form class="form-inline active-cyan-4 ml-5">
							<input class="form-control form-control-sm mr-1 w-75" type="text" placeholder="Search" aria-label="Search">
							<i class="btn btn-sm blue-gradient" aria-hidden="true">Search</i>
						</form>
						<p class="my-0 py-0 px-2">Solution - Copyright © 2019 Oluwaseun. All rights reserved.</p>
						<p class="my-0 py-0 px-2">Disclaimer: Every Solution member is solely responsible for anything that he/she posts or uploads on Solution.</p>
					</div>
				</div>
			</div>
		</footer>




	<!-- SCRIPTS -->
	<!-- JQuery -->
	
	<script type="text/javascript" src="${js}/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="${js}/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="${js}/mdb.min.js"></script>
	<!-- Your custom javascript file (optional) -->
	<script type="text/javascript" src="${js}/main2.js"></script>
	
	<script>
		
	function toggleNav() {
	    let menu = document.getElementById("app-sidebar");
	    let content = document.getElementById("content");
	    if (menu.style.width === "0px") {
	        menu.style.width = "250px";
	        content.style.marginLeft = "250px";
	        content.style.transition = "0.7s";
	    }
	    else {
	        menu.style.width = "0";
	        content.style.marginLeft = "0";
	        content.style.transition = "0.5s";
	    }
	}
		
	</script>
	

</body>
</html>