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
<title>${title}</title>

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>

	<link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link href="${css}/bootstrap.min.css" rel="stylesheet">
	<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<link href="${css}/mdb.min.css" rel="stylesheet">
	<link href="${css}/style.css" rel="stylesheet">
	
	<script type="text/javascript" src="${js}/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="${js}/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>	
	<script type="text/javascript" src="${js}/dataTables.bootstrap4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>

</head>


<body style="font-family: 'lato', sans-serif; background-color:#e3f2fd">
	<div class="px-0 mx-0 container-fluid">
		<header class="">
			
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  				<div class="carousel-inner">
					<div class="carousel-item active">
				      <img class="d-block w-100" src="https://www.psafinancial.com/wp-content/uploads/2019/03/in-good-health-1600-final.jpg"
				        alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="https://www.brainyquote.com/photos_tr/en/p/publiliussyrus/391791/publiliussyrus1-2x.jpg"
				        alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="https://thumbs.dreamstime.com/b/good-health-good-life-female-hand-chalk-writing-text-blue-background-97044786.jpg"
				        alt="Third slide">
				    </div>
  				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				</a>
			  	<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
			    	<span class="sr-only">Next</span>
			  	</a>
			</div>

			<nav class="navbar navbar-expand-lg navbar-dark primary-color">
  				<a class="navbar-brand" href="#">MedForum</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav" aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
			    	<span class="navbar-toggler-icon"></span>
			  	</button>
				<div class="collapse navbar-collapse" id="basicExampleNav">
				    <ul class="navbar-nav mr-auto">
				      <li class="nav-item active">
				        <a class="nav-link" href="${contextRoot}/home">Home
				          <span class="sr-only">(current)</span>
				        </a>
				      </li>
				    </ul>
    
				    <form class="form-inline ml-auto">
				      	<div class="md-form my-0">
				        	<input class="form-control mr-sm-1 mySearch" type="text" placeholder="Search Topics" aria-label="Search">
				      	</div>
				    </form>
				    <c:choose>
					    <c:when test="${user eq null}">
					    <ul class="navbar-nav ml-auto nav-flex-icons">
					    	<li class="nav-item avatar">
					        	<div class="text-center">
								  	<a href="" class="btn btn-white btn-sm btn-rounded" data-toggle="modal" data-target="#modalLoginForm">Login</a>
								</div>
					        </li>
					    	<li class="nav-item">
					        	<div class="text-center">
					  				<a href="" class="btn btn-white btn-sm btn-rounded " data-toggle="modal" data-target="#modalRegisterForm">SignUp</a>
								</div>
					      	</li>
					    </ul>
					    </c:when>
					    <c:otherwise>
					    <ul class="navbar-nav ml-auto nav-flex-icons">
					    	<li class="nav-item avatar">
					        	<a href="${contextRoot}/newtopic"><button class="btn btn-white btn-sm">Start new Topic</button></a>
					        </li>
					    	<li class="nav-item dropdown">
					        	<a href="${contextRoot}/notifications" class="nav-link waves-effect waves-light">
					        		<span><i class="fas fa-bell"></i></span>
					        		<span class="badge badge-danger notifications" style="position:absolute; top:-2px; right: 5px"></span>	
					        	</a>
					        	
					        	
					      	</li>
					      	<li class="nav-item avatar dropdown">
					        	<a class="nav-link p-0 dropdown-toggle mt-2" href="#"  id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					          		<!-- <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" class="rounded-circle z-depth-0"
					            	alt="avatar image" height="35"> -->
					            	<span class="">Hi ${user}</span>
					        	</a>
					        	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
					          		<a href="${contextRoot}/profile" class="dropdown-item" href="#">My profile</a>
					          		<a class="dropdown-item" href="#">Inbox</a>
					          		<div class="dropdown-divider"></div>
					          		<a href="${contextRoot}/logout" class="dropdown-item text-danger" href="#">Log Out</a>
					        	</div>
					      	</li>
					    </ul>
					    </c:otherwise>
				 	</c:choose>
  				</div>
			</nav>
		</header>
		
		<section class="content my-4">
			<div class="container">
				<%-- <c:if test="${userClickTopicDetails == true}">
					<div class="row col-4">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
							    <li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
						 	</ol>
						</nav>
					</div>
				</c:if> --%>
				<%-- <c:if test="${userClickNewTopic == true}">
					<div class="row col-4">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
							    <li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
						 	</ol>
						</nav>
					</div>
				</c:if> --%>
				<%-- <c:if test="${userClickTopicBySubCat == true}">
					<div class="row col-4">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
							    <li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
						 	</ol>
						</nav>
					</div>
				</c:if> --%>
				<div class="row">
					<div class="col-lg-8 col-md-8 mb-4">
						<c:if test="${userClickHome == true}">  
							<table  class="table table-borderless incomeListTables" id="income-table-report">
								<thead class='d-none'>
									<tr>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach begin="0" end="${topictitlesLength -1}" var="i">
									<tr>
										<td class="my-0 py-0">		
											<div class="card border-left-primary mb-2">
									        	<div class="card-body">
									            	<div class="row align-items-center">
									                	<div class="col mr-2">
									                 		<div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><h4><a href="${contextRoot}/post/${topictitles.getJSONObject(i).getInt('topic_id')}" class="text-primary">${topictitles.getJSONObject(i).getString("title")}</a></h4></div>
									                 		<div class="h5 mb-0 font-wx , eight-bold text-gray-800">By ${topictitles.getJSONObject(i).getString("author")}</div>
									               		</div>
									               		<div class="col-auto">
									                 		<i class="fas fa-calendar fa-2x text-gray-300"></i>
									               		</div>
									             	</div>
									             </div>
									             <div class="card-footer">
									    		 	<div class="row no-gutters align-items-center">
										             	<div class="col mr-2">
										             		<a href="#">${topictitles.getJSONObject(i).getInt("topic_comments")}<i class="far fa-comments mr-4"></i></a> 
										             		<a href="#">21<i class="far fa-thumbs-up"></i></a> 
										             	</div>
									             		<div class="col-auto">
									             			<span class="">${topictitles.getJSONObject(i).getString("date")}</span>
									             		</div>
									             	</div>
									             </div>
											</div>
										</td>
									</tr>
								</c:forEach>
								</tbody>	
							</table>
						</c:if>
						<c:if test="${userClickNewTopic == true}">
							<%@ include file="newtopic.jsp" %>
						</c:if>
						<c:if test="${userClickTopicDetails == true}">
							<%@ include file="topic_details_page.jsp" %>
						</c:if>
						<c:if test="${userClickTopicBySubCat == true}">
							<%@ include file="topicsbysubcategory.jsp" %>
						</c:if>
						<c:if test="${userClickNotifications == true}">
							<%@ include file="notifications_page.jsp" %>
						</c:if>
						<c:if test="${userClickProfile == true}">
							<%@ include file="profile.jsp" %>
						</c:if>
					</div>
					<div class="col-lg-4 col-md-4 mb-4">
				    	<div class="card border-left-primary shadow py-2">
				        	<div class="card-body">
				            	<div class="row no-gutters align-items-center">
				                	<div class="col mr-2">
				                 		<div class="text-xs font-weight-bold text-primary text-uppercase mb-1 ml-3">Categories</div>
				                 		<div class="dropdown-divider"></div>
				                 		<div class="">
					                 		<ul class="list-group list-group-flush accordion" id="accordionExample275">
					                 			<c:forEach begin="0" end="${categoriesLength - 1}" var="i">
					                 				<li class="list-group-item d-flex justify-content-between align-items-center btn btn-link id_click"  data-toggle="collapse" data-target="#collapseOne2_${categories.getJSONObject(i).get('category_id')}" data-id ="${categories.getJSONObject(i).get('category_id')}" aria-expanded="true" aria-controls="collapseOne2_${categories.getJSONObject(i).get('category_id')}">
					                 					${categories.getJSONObject(i).get("category_name")}
					                 					<span class="badge badge-primary badge-pill">${categories.getJSONObject(i).get("no_topics_per_cat")}</span>					                 					
					                 				</li>
						                 				<ul class="mt-0 pt-0 list-group ul_${categories.getJSONObject(i).get('category_id')}">
							                 				
						                 				</ul>
					                 			</c:forEach>
					                 		</ul>	
				                 		</div>
				               		</div>
				             	</div>
				           	</div>
						</div>
					</div>
				</div>
			</div>
		</section>
			
			<footer>
				<div class="container-fluid">
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
			
			
			<!-- Modals -->
			<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
			    	<div class="modal-content">
			      		<div class="modal-header text-center">
			        		<h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
			        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          			<span aria-hidden="true">&times;</span>
			        		</button>
			      		</div>
			      		<div class="modal-body mx-3">
			        		<div class="md-form mb-3">
			          			<i class="fas fa-envelope prefix grey-text"></i>
			          			<input type="text" id="username" class="form-control  validate">
			          			<label for="username" class="py-0 my-0">Email/Username</label>
			          			<span id="username_error" class="py-0 my-0"></span>
			        		</div>
			
			        		<div class="md-form mb-3">
			          			<i class="fas fa-lock prefix grey-text"></i>
			          			<input type="password" id="pass" class="form-control validate">
			          			<label for="pass" class="py-0 my-0">Password</label>
			          			<span id="pass_error" class="py-0 my-0"></span>
			        		</div>
			      		</div>
			      		<div class="modal-footer d-flex justify-content-center">
			        		<button class="btn btn-default" id="login_btn">Login</button>
			        		<span id="success_lgn"></span>
			      		</div>
			    	</div>
			  	</div>
			</div>
			
			<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog" role="document">
    				<div class="modal-content">
      					<div class="modal-header text-center">
        					<h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body mx-3">
        					<div class="md-form mb-5">
						    	<i class="fas fa-user prefix grey-text"></i>
						        <input type="text" id="orangeForm-name" class="form-control validate">
          						<label for="orangeForm-name">Username</label>
          						<span id="usernameSignUp_error" class="py-0 my-0"></span>
        					</div>
        					<div class="md-form mb-5">
          						<i class="fas fa-envelope prefix grey-text"></i>
          						<input type="email" id="orangeForm-email" class="form-control validate">
          						<label for="orangeForm-email">Email</label>
          						<span id="emailSignUp_error" class="py-0 my-0"></span>
        					</div>
        					<div class="md-form mb-4">
					          	<i class="fas fa-lock prefix grey-text"></i>
					          	<input type="password" id="orangeForm-pass" class="form-control validate">
					          	<label for="orangeForm-pass">Password</label>
					          	<span id="passSignUp_error" class="py-0 my-0"></span>
					        </div>
					        <div class="md-form mb-4">
					          	<i class="fas fa-lock prefix grey-text"></i>
					          	<input type="password" id="orangeForm-c-pass" class="form-control validate">
					          	<label for="orangeForm-c-pass">Confirm Password</label>
					          	<span id="c-passSignUp_error" class="py-0 my-0"></span>
					        </div>
						</div>
      					<div class="modal-footer d-flex justify-content-center">
        					<button class="btn btn-deep-orange" id="signUp_btn">Sign up</button>
        					<span id="success_reg"></span>
      					</div>
    				</div>
  				</div>
			</div>
		</div>


		<script type="text/javascript" src="${js}/popper.min.js"></script>
		<script type="text/javascript" src="${js}/mdb.min.js"></script>
		<script type="text/javascript" src="${js}/custom.js"></script>
	
	<script type="text/javascript">
	
		let oTable = $('.incomeListTables').dataTable({
			"ordering": false,
			"responsive": true,
			"lengthChange": false,
			"sDom" : "rtipl",
			
			pageLength: 10,
		});
		$(".mySearch").keyup(function() {
			oTable.fnFilter($(this).val());
		})

		let sub_url = "${pageContext.request.contextPath}/subCategory";
		$.ajax({
			method: "POST",
			url : sub_url,
			success: function(response) {
				let res = JSON.parse(response);
				$(".id_click").each(function() {
					let the_id = ($(this).data("id"));
					let sub_cat = [];
					let sub_cat_id = [];
					for(let i = 0; i<res.length; i++){
						if(res[i].category_id == the_id) {
							//console.log(res[i].subcategory_id);
							sub_cat.push(res[i].subcategory_name);
							sub_cat_id.push(res[i].subcategory_id);
						}
					}
					//console.log("sub "+sub_cat_id);
					for(let i = 0; i<sub_cat.length; i++) {
						let list = '<li class="list-group-item ml-5"><i class="fas fa-bomb mr-2"></i>';
						list = list + '<a href="${pageContext.request.contextPath}/postBySubCat/'+sub_cat_id[i]+'">'+sub_cat[i]+'</a>';
						list = list + '</li>';
						//console.log("final "+ list);
						$(".ul_"+the_id).append(list).hide();
					}	
				})
			}
		})
		
		$(".id_click").click(function() {
			$(this).next().toggle();
		});

		
		$("#login_btn").click(function(e) {
			e.preventDefault();
			let spinner = `<i class="fa fa-spinner fa-spin text-white" aria-hidden="true" style="font-size:20px;"></i>`;
			let url = "${pageContext.request.contextPath}/login";
			let check = validate();
			if(!(check.includes("error"))) {
				$("#login_btn").attr("disabled", true);
				$("#login_btn").html(spinner).addClass("text-center");
				let username = $("#username").val();
				let pass = $("#pass").val();
				
				let credentials = {
					"username" : username,
					"pass" : pass
				};
				
				$.ajax({
					method : "POST",
					url : url,
					data: credentials,
					success : function(response) {
						if(response == "success") {
							$("#login_btn").html("Login Successfull").addClass("text-center");
							setTimeout(function() {
								location.reload();
							}, 2000);
						}
						else{
							$("#login_btn").attr("disabled", false);
							$("#login_btn").html("Login");
							$("#success_lgn").html("Username or Password not valid <i class='fas fa-thumbs-down'></i>").addClass("animated heartBeat slower text-danger");
						}
					}
				})
			}
		});
		
		
		$("#signUp_btn").click(function(e) {
			e.preventDefault();
			let spinner = `<i class="fa fa-spinner fa-spin text-white" aria-hidden="true" style="font-size:20px;"></i>`;
			let url = "${pageContext.request.contextPath}/register";
			let check = validateSignUp();
			if(!(check.includes("error"))) {
				$("#signUp_btn").attr("disabled", true);
				$("#usernameSignUp_error").html(" ");
				$("#emailSignUp_error").html(" ");
				$("#passSignUp_error").html(" ");
				$("#c-passSignUp_error").html(" ");
				
				$("#signUp_btn").html(spinner).addClass("text-center");
				let username = $("#orangeForm-name").val();
				let email = $("#orangeForm-email").val();
				let pass = $("#orangeForm-pass").val();
				
				let credentials = {
					"username" : username,
					"email" : email,
					"pass" : pass
				};
				
				$.ajax({
					method : "POST",
					url : url,
					data: credentials,
					success : function(response) {
						if(response == "00") {
							$("#signUp_btn").html("SignUp").addClass("text-center");
							$("#success_reg").html("Registration successfull <i class='fas fa-thumbs-up'></i>").addClass("animated heartBeat slower text-success");
							setTimeout(() => {
								$("#modalRegisterForm").modal("hide");
								$("#modalLoginForm").modal("show");
								
							}, 3000);
						}
						else if(response == "03") {
							$("#signUp_btn").attr("disabled", false);
							$("#emailSignUp_error").html("Email already exist").addClass("text-danger");
							$("#signUp_btn").html("SignUp");
							$("#success_reg").html("Registration  not successfull <i class='fas fa-thumbs-down'></i>").addClass("animated heartBeat slower text-danger");
						}
						else if(response == "02") {
							$("#signUp_btn").attr("disabled", false);
							$("#usernameSignUp_error").html("Username already exist").addClass("text-danger");
							$("#signUp_btn").html("SignUp");
							$("#success_reg").html("Registration  not successfull <i class='fas fa-thumbs-down'></i>").addClass("animated heartBeat slower text-danger");
						}
					}
				})
			}
			
		})

		
		
		function validate() {
			let error = [];
			
			let username = $("#username").val();
			let pass = $("#pass").val();
			
			if(username == "" || username == undefined) {
				error.push("error");
				$("#username_error").html("Field cannot be empty").addClass("text-danger");
			}
			else if(pass == "" || pass == undefined) {
				error.push("error");
				$("#pass_error").html("Field cannot be empty").addClass("text-danger");
			}
			return error;
		}
		
		function validateSignUp() {
			let error = [];
			
			let username = $("#orangeForm-name").val();
			let email = $("#orangeForm-email").val();
			let pass = $("#orangeForm-pass").val();
			let c_pass = $("#orangeForm-c-pass").val();
			
			if(username == "" || username == undefined) {
				error.push("error");
				$("#usernameSignUp_error").html("Field cannot be empty").addClass("text-danger");
			}
			else if(email == "" || email == undefined) {
				error.push("error");
				$("#emailSignUp_error").html("Field cannot be empty").addClass("text-danger");
			}
			else if(pass == "" || pass == undefined) {
				error.push("error");
				$("#passSignUp_error").html("Field cannot be empty").addClass("text-danger");
			}
			else if(pass !== c_pass) {
				error.push("error");
				$("#c-passSignUp_error").html("Passwords does not match").addClass("text-danger");
			}
			return error;
		}
		
		notifications();
		function notifications(){
			let update_url = "${pageContext.request.contextPath}/notificationupdatebyuser";
			let user = "${user}";
			//console.log(user);
			let credentials = {
					"user" : user
			};
			
			$.ajax({
				method: "POST",
				url: update_url,
				data: credentials,
				success: function(response){
					$(".notifications").html(response);	
				}	
			})
		}
		
		/* $(".notificationsdetails").click(function() {
			notificationsDetails();
		}) */
		
		function notificationsDetails(){
			let update_url = "${pageContext.request.contextPath}/notificationdetailsbyuser";
			let user = "${user}";
			//console.log(user);
			let noti;
			//$(".notificationsDetailsBody").html("spinner");
			let credentials = {
					"user" : user
			};
			
			$.ajax({
				method: "POST",
				url: update_url,
				data: credentials,
				success: function(response){
					let details = JSON.parse(response);
					console.log(details);
					for(let i=0; i<details.length; i++) {
						noti = '<a class="dropdown-item bg blue lighten-4 mb-1" href="#"><strong>'+details[i].author+'</strong> commented on a topic you followed <br /> <i class="far fa-comments mr-2"></i> 2 weeks ago</a>';
						console.log(details[i].date);
						$(".notificationsDetailsBody").append(noti);
					}
				}	
			})
		}
		
		
	</script>
	

</body>
</html>