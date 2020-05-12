<div>
	<div class="card border-left-primary mb-2">
		<div class="card-header">Notifications</div>
		<div class="card-body">
			<c:choose>
			<c:when test="${notificationsLength > 0 }">
			<ul>
				<c:forEach begin="0" end="${notificationsLength - 1}" var="i">
					<div class="d-none noti_date_${i}">${notifications.getJSONObject(i).getString("date")}</div>
					<li class="mb-1">
						<c:choose>
							<c:when test="${notifications.getJSONObject(i).getInt('s_update') eq 0}">
								<a class="dropdown-item notification_d"  data-no = "${notifications.getJSONObject(i).getInt('topic_id')}"><Strong>
									<c:choose><c:when test="${notifications.getJSONObject(i).getString('author') eq user}">You</c:when>
									<c:otherwise>${notifications.getJSONObject(i).getString("author")}</c:otherwise>
									</c:choose></strong> commented on a topic you followed <br /> <i class="far fa-comments mr-2"></i> <span id="postedDate_${i}"></span></a>
							</c:when>
							<c:otherwise>
								<a class="dropdown-item bg blue lighten-4 mb-1 notification_d"  data-no = "${notifications.getJSONObject(i).getInt('topic_id')}"><strong>
									<c:choose><c:when test="${notifications.getJSONObject(i).getString('author') eq user}">You</c:when>
									<c:otherwise>${notifications.getJSONObject(i).getString("author")}</c:otherwise>
									</c:choose></strong> commented on a topic you followed <br /> <i class="far fa-comments mr-2"></i> <span id="postedDate_${i}"></span></a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				
			</ul>
			</c:when>
			<c:otherwise>
				<h3>You have no Notifications</h3>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="card-footer text-center">
			
		</div>
	</div>
</div>

<script>

	$(".notification_d").click(function() {
		let noti_topic_id = $(this).data("no");
		let user = "${user}";
		let update_url = "${pageContext.request.contextPath}/notificationdetailsbyuser";
		let credentials = {
				"user" : user,
				"noti_topic_id" : noti_topic_id
		};
		
		$.ajax({
			method: "POST",
			url: update_url,
			data: credentials,
			success: function(response){
				console.log(response);
				if(response == "00") {
					let redirect = "${pageContext.request.contextPath}/post/"+noti_topic_id+"";
					window.location.href = redirect;
				}
			}	
		})
	})
	
	//let todaysDate =new Date();
	/* console.log(todaysDate);
	let month =(todaysDate.getMonth() + 1);
	month = month < 10 ? '0' + month : month;
	let day = todaysDate.getDate();
	day = day < 10 ? '0' + day : day;
	let year = todaysDate.getFullYear();
	let hours = todaysDate.getHours();
	hours = hours < 10 ? '0' + hours : hours;
	let minutes = todaysDate.getMinutes();
	minutes = minutes < 10 ? '0' + minutes : minutes;
	let seconds = todaysDate.getSeconds();
	seconds = seconds < 10 ? '0' + seconds : seconds;
	console.log(seconds);
	todaysDate = [year, month, day].join('-') + ' ' + [hours, minutes, seconds].join(':');
	console.log(todaysDate); */
	let tDate = new Date().getTime();
	let postedDate;
	for(let i = 0; i<"${notificationsLength}"; i++) {
		let d = $(".noti_date_"+i).html();
		let theDate = new Date(d).getTime();
		let dDiff = Math.round((tDate - theDate)/(1000*3600*24));
		if(dDiff == 0) {
			postedDate = "Today";
		}
		else if(dDiff == 1) {
			postedDate = "Yesterday"
		}
		else if(dDiff > 7) {
			weekDate = Math.round(dDiff / 7);
			postedDate = ""+weekDate+ " week(s) ago";
		}
		else {
			postedDate = ""+dDiff+ " days(s) ago";
		}
		$("#postedDate_"+i).html(postedDate);
	}
	
	/* $("a").hover(function() {
		$(this).css({background: 'grey'});
	}) */
</script>
