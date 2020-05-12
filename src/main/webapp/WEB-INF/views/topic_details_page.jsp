<div>
	<div class="card border-left-primary mb-2">
		<div class="card-header">
			<div class="d-flex">
				<h2 class="col-8">${topic_details.getString("title")}</h2>
				<c:choose>
					<c:when test="${user eq null}">
						<span class="col-4 text-center"><button class="btn btn-sm btn-info" data-toggle="modal" data-target="#modalLoginForm">FOLLOW TOPIC</button></span>
					</c:when>
					<c:otherwise>
						<span class="col-4 text-center">
							<button class="btn btn-sm btn-info d-none follows" id="addfollows">FOLLOW TOPIC</button>
							<button class="btn btn-sm btn-danger d-none follows" id="removefollows">UNFOLLOW TOPIC</button>
						</span>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="container mt-2">
				
              
              <%-- <fmt:formatDate type="both" value="${now}" /> --%>
				<p class="mb-0 py-0">${topic_details.getString("date")}, <span id="total_follows"></span></p>
			</div>
		</div>
       	<div class="card-body">
           	<div class="container">
           		<div class="mb-2">
           			<i class="fas fa-user fa-1x mr-1"></i>${topic_details.getString("author")}
           		</div>
           		<div class="d-none" id="topic_id">${topic_details.get("topic_id")}</div>
           		<div>
           			<p class="mt-3">${topic_details.getString("content")}</p>
               	</div>
               	<c:if test="${topic_details.get('image_path') != 'null'}">
               		<strong><img class="d-inline-block align-top mb-2" src="${img}/${topic_details.get("image_path")}" width="200" height="200" /></strong>
            	</c:if>
               	<div>
               		<c:if test="${rep_respLen > 0}">
               			<span>${rep_respLen}<i class="far fa-comments mr-2"></i></span>
               		</c:if> 
             		<span id="total_likes"></span>
               	</div>
               	
               	
            	
            </div>
		</div>
        <div class="card-footer">
        	<div class="row no-gutters">
        	<c:choose>
        		<c:when test="${user eq null}">
        			<a href="" class="btn btn-sm btn-grey" data-toggle="modal" data-target="#modalLoginForm"><span style="font-size: 15px">NEW TOPIC</span></a>
        			<a href="#comment_box" class="ml-auto mr-3" data-toggle="modal" data-target="#modalLoginForm"><span class="btn btn-sm btn-primary"><i class="far fa-comments fa-2x mr-2"></i><strong style="font-size: 15px">Reply</strong></span></a>
        			<a href="" class="mt-2" data-toggle="modal" data-target="#modalLoginForm"><i class="far fa-thumbs-up fa-2x"></i><span style="font-size: 15px">LIKE</span></a>
        		</c:when>
        		<c:otherwise>
	        		<a href="${contextRoot}/newtopic" class="btn btn-sm btn-grey"><span style="font-size: 15px">NEW TOPIC</span></a>
					<a href="#comment_box" class="ml-auto mr-3" id="reply_btn"><span class="btn btn-sm btn-primary"><i class="far fa-comments fa-2x mr-2"></i><strong style="font-size: 15px">Reply</strong></span></a>
					
	        				<a class="mt-2 d-none like" id="addlikes"><i class="far fa-thumbs-up fa-2x"></i><span style="font-size: 15px">LIKE</span></a>
        				
        					<a class="mt-2 d-none like" id="removelikes"><i class="fas fa-thumbs-up fa-2x text-primary"></i><span class="text-primary" style="font-size: 15px">UNLIKE</span></a>
        				
        					<a class="mt-2 d-none" id="readdlikes"><i class="far fa-thumbs-up fa-2x"></i><span style="font-size: 15px">LIKE</span></a>
        				
        		</c:otherwise>
        	</c:choose>
        	</div>
        </div>
	</div>
	<div class="" id="comment_box">
		<div class="card">
			<div class="card-header">
				<i class="fas fa-user fa-1x mr-1"></i><span id="logged_user">${user}</span>
			</div>
			<div class="card-body">
				<div class="md-form mt-0 pt-0 mb-4 md-outline">
			  		<textarea id="reply_content" class="md-textarea form-control" rows="5"></textarea>
			  		<label for="reply_content">Type your reply</label>
				</div>
				<div class="row">
					<a class="btn btn-sm btn-info ml-auto mr-3" id="post_reply_btn"><span style="font-size: 15px">POST REPLY</span></a>
				</div>
			</div>
		</div>
	</div>
	
	<div id="responseStatus"></div>
	
	<div class="mt-5 mb-4 border border-dark border-right-0 border-left-0 border-top-0">
		<h2>${rep_respLen} <c:choose><c:when test="${rep_respLen < 2}">Reply</c:when> <c:otherwise>Replies</c:otherwise></c:choose></h2>
	</div>
	<c:if test="${rep_respLen > 0}">
		<table  class="table table-borderless commentsTable" id="income-table-report">
			<thead class='d-none'>
				<tr>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" end="${rep_respLen - 1}" var="i">
					<tr>
						<td class="my-0 py-0">
							<div class="card mb-1">
								<div class="card-body">
						           	<div class="container">
						           		<div class="mb-2">
						           			<i class="fas fa-user fa-1x mr-1"></i>${rep_resp.getJSONObject(i).getString("author")}
						           		</div>
						           		<div>
						           			<p class="mt-3">${rep_resp.getJSONObject(i).getString("comment")}</p>
						               	</div>
						            </div>
								</div>
					            <div class="card-footer my-1 py-1">
					            	<div class="d-flex row">
						             	<a href="" class="btn btn-sm"><i class="fas fa-quote-left mr-1"></i>Quote<i class="fas fa-quote-right ml-1"></i></a>
						             	<div class="ml-auto mt-2 mr-2">${rep_resp.getJSONObject(i).getString("date")}</div>
					            	</div>
					            </div>
							</div>
							</td>
							</tr>
				</c:forEach>
			</tbody>
		</table>
		<%-- <c:forEach begin="0" end="${rep_respLen - 1}" var="i">
		<div class="card mb-1">
			<div class="card-body">
	           	<div class="container">
	           		<div class="mb-2">
	           			<i class="fas fa-user fa-1x mr-1"></i>${rep_resp.getJSONObject(i).getString("author")}
	           		</div>
	           		<div>
	           			<p class="mt-4">${rep_resp.getJSONObject(i).getString("comment")}</p>
	               	</div>
	            </div>
			</div>
            <div class="card-footer">
            	<div class="d-flex row">
	             	<a href="" class="btn btn-sm"><i class="fas fa-quote-left mr-1"></i>Quote<i class="fas fa-quote-right ml-1"></i></a>
	             	<div class="ml-auto mt-2 mr-2">${rep_resp.getJSONObject(i).getString("date")}</div>
            	</div>
            </div>
		</div>
		</c:forEach> --%>
	</c:if>				
</div>	

	
	<!-- SCRIPTS -->
	<script type="text/javascript" src="${js}/tableHTMLExport.js"></script>

	<script type="text/javascript" src="${js}/popper.min.js"></script>

	<script type="text/javascript" src="${js}/mdb.min.js"></script>

	<script type="text/javascript" src="${js}/custom.js"></script>
	
	<script>
	
		$("#comment_box").hide();
		
		$("#reply_btn").click(function() {
			$("#comment_box").toggle();
		})
		
		let cTable = $('.commentsTable').dataTable({
			"ordering": false,
			"responsive": true,
			"lengthChange": false,
			"sDom" : "rtipl",
			
			pageLength: 10,
		});
		
		$("#post_reply_btn").click(function() {
			$("#post_reply_btn").attr("disabled", true);
			let url = "${contextRoot}/addComment";
			
			let user = $("#logged_user").html();
			let topic_id = $("#topic_id").html();
			let reply_content = $("#reply_content").val();
			
			let credentials = {
					"user" : user,
					"topic_id": topic_id,
					"reply_content": reply_content
			};
			
			$.ajax({
				method: "POST",
				url: url,
				data: credentials,
				success: function(response){
					if(response == 00){
						$("#responseStatus").html('Reply added Successfully<i class="far fa-thumbs-up ml-1"></i>').addClass("animated heartBeat slower text-success");
						setTimeout(function() {
							location.reload();
						}, 2000);
					}
				}	
			})	
		})
		
		let like = "${like}";
		like == "1" ? $("#removelikes").removeClass("d-none") : $("#addlikes").removeClass("d-none");
		
		$(".like").click(function() {
			let id = this.id;
			let like_url = "${contextRoot}/likeandunlike";
			let user = $("#logged_user").html();
			let topic_id = $("#topic_id").html();
			let status = id == "addlikes" ? '1' : '2';
			let credentials = {
					"user" : user,
					"topic_id": topic_id,
					"status": status
			};
			
			$.ajax({
				method: "POST",
				url: like_url,
				data: credentials,
				success: function(response){
					if(response == "00") {
						totalLikes();
						if(id == "addlikes") {
							$("#addlikes").addClass("d-none");
							$("#removelikes").removeClass("d-none")
						}
						else{
							$("#addlikes").removeClass("d-none");
							$("#removelikes").addClass("d-none")
						}
					}
				}	
			})
		})
		
		totalLikes();
		function totalLikes() {
			let url = "${contextRoot}/totallikes";
			let topic_id = $("#topic_id").html();
			let credentials = {
					"topic_id": topic_id,
			};
			$.ajax({
				method: 'POST',
				url : url,
				data : credentials,
				success : function(response) {
					//alert(response);
					//if(response != '0') {
						$("#total_likes").html(response+'<i class="far fa-thumbs-up"></i>');
					//}
				}
			})
			
		}
		
		follows();
		function follows() {
			let follows = "${follow}";
			follows == 1 ? $("#removefollows").removeClass("d-none") : $("#addfollows").removeClass("d-none");
			
			$(".follows").click(function() {
				let id = this.id;
				let follows_url = "${contextRoot}/followandunfollow";
				let user = $("#logged_user").html();
				let topic_id = $("#topic_id").html();
				let status = id == "addfollows" ? '1' : '2';
				let credentials = {
						"user" : user,
						"topic_id": topic_id,
						"status": status
				};
				
				$.ajax({
					method: "POST",
					url: follows_url,
					data: credentials,
					success: function(response){
						if(response == "00") {
							totalFollows();
							if(id == "addfollows") {
								$("#addfollows").addClass("d-none");
								$("#removefollows").removeClass("d-none")
							}
							else{
								$("#addfollows").removeClass("d-none");
								$("#removefollows").addClass("d-none")
							}
						}
					}	
				})
			})
		}
		
		totalFollows();
		function totalFollows() {
			let url = "${contextRoot}/totalfollows";
			let topic_id = $("#topic_id").html();
			let credentials = {
					"topic_id": topic_id,
			};
			$.ajax({
				method: 'POST',
				url : url,
				data : credentials,
				success : function(response) {
					//alert(response);
					//if(response != '0') {
						$("#total_follows").html(response + ' Follows');
					//}
				}
			})
			
		}

	</script>
	

</body>
</html>