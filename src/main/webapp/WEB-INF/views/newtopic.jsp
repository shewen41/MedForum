<div class="">
   	<div class="card border-left-primary shadow">
       	<div class="card-body">
       	<form action="" id="topic_form">
       		<div class="md-form md-outline">
				<input type="text" id="title" name="topic_title" class="form-control">
				<label for="topic_title">Topic Title</label>
				<span id="title_error"></span>
			</div>
			<div class="row">
				<div class="col-6">
					<select class="custom-select custom-select-md cat_select" id="category_id">
						<option value="" selected>Select Category</option>
						<c:forEach begin="0" end="${categoriesLength -1}" var="i">
							<option value="${categories.getJSONObject(i).get("category_id")}">${categories.getJSONObject(i).getString("category_name")}</option>
						</c:forEach>
					</select>
					<span id="cat_error"></span>
				</div>
				<div class="col-6">
					<select class="custom-select custom-select-md sub_cat_select" id="subcategory_id">
						<option id="first_option" value="" selected>Select SubCategory</option>
					</select>
					<span id="subCat_error"></span>
				</div>
			</div>
			<div class="md-form mb-4 md-outline">
			  <textarea id="content" name="editor2" class="md-textarea form-control" rows="5"></textarea>
			  <label class="mt-5 pt-3" for="content">Enter Post details</label>
			  <span id="content_error"></span>
			</div>
			
			<button type="button" class="btn btn-info btn-app btn-sm" onclick="$('#btn-upload-image').click()">Add Image</button>
            <input type="file" accept="image/jpeg, image/png, image/jpg" id="btn-upload-image" hidden />
            <input type="text" id="image" disabled class="form-control mb-2">
			
			<div class="d-flex">
				<a href="${contextRoot}/home" class="btn btn-sm btn-danger">Cancel</a>
				<div class="ml-auto">
					<button type="button" id="post_topic" class="btn btn-sm btn-primary">Post</button>
				</div>
				<div id="responseStatus"></div>
			</div>
			
			</form>
       	</div>
          	
	</div>
</div>				

	
	<script>
	
	
		let sub_cat_url = "${pageContext.request.contextPath}/subCategory";
		$.ajax({
			method: "POST",
			url : sub_cat_url,
			success: function(response) {
				let res = JSON.parse(response);
				$(".cat_select").change(function() {
					$("#first_option").siblings().remove();
					let str = "";
					$( ".cat_select option:selected" ).each(function() {
				    	str += $( this ).val();
				    });
					let sub_cat = [];
					let sub_cat_id = [];
					for(let i = 0; i<res.length; i++){
						if(res[i].category_id == str) {
							sub_cat.push(res[i].subcategory_name);
							sub_cat_id.push(res[i].subcategory_id);
						}
					}
					for(let i = 0; i<sub_cat.length; i++) {
						list = '<option value="'+sub_cat_id[i]+'">'+sub_cat[i]+'</option>';
						$("#first_option").after(list);
					}
				})
			}
		})
		
		$(document).on('change', "#btn-upload-image", function() {
	        let fileName = $('#btn-upload-image')[0].files[0].name;
	        $("#image").val(fileName);
    	});
	
		$("#post_topic").click(function() {
			let check = ValidateTopicForm();
			if(!(check.includes("error"))) {
				$("#post_topic").attr("disabled", true);
				let url = "${contextRoot}/addPost";
				let author = "${user}";
				let title = $("#title").val();
				let category_id = $("#category_id").val();
				let subcategory_id = $("#subcategory_id").val();
				let content = CKEDITOR.instances.content.getData();
				
				let img = $('#btn-upload-image')[0].files[0];
		        let formData = new FormData();
		        if(img != null) {
		        	formData.append('file', img);
				}
				else{
					formData.append('file', new File([""], "null"));
				} 
		        formData.append('author', author);
		        formData.append('title', title);
		        formData.append('category_id', category_id);
		        formData.append('subcategory_id', subcategory_id);
		        formData.append('content', content);

				/* let credentials = {
						"author" : author,
						"title": title,
						"category_id": category_id,
						"subcategory_id": subcategory_id,
						"content": content
				}; */
				$.ajax({
					url : url,
	                type: 'POST',
	                beforeSend: function() {
	                },
	                data: formData,
	                contentType: false,
	                processData: false,
	                dataType: 'json',
	                success : function(response) {
	                	if(response.responsecode == "00"){
							$("#responseStatus").html('Post added Successfully<i class="far fa-thumbs-up ml-1"></i>').addClass("animated wobble slower text-success");
							setTimeout(function() {
								window.location.href = "${contextRoot}/home";
							}, 5000);
						}
	                }
				})
			}
		})
		
		
		function ValidateTopicForm() {
			let error = [];
			let title = $("#title").val();
			let category_id = $("#category_id").val();
			let subcategory_id = $("#subcategory_id").val();
			let content = CKEDITOR.instances.content.getData();
			
			if(title == "" || title == undefined) {
				error.push("error");
				$("#title_error").html("Field cannot be empty").addClass("text-danger");
			}
			else if(category_id == "" || category_id == undefined) {
				error.push("error");
				$("#cat_error").html("Please Select a category").addClass("text-danger");
			}
			else if(subcategory_id == "" || subcategory_id == undefined) {
				error.push("error");
				$("#subCat_error").html("Please Select a Sub Category").addClass("text-danger");
			}
			else if(content == "" || content == undefined) {
				error.push("error");
				$("#content_error").html("Field cannot be empty").addClass("text-danger");
			}
			else {
				$("#title_error").html("");
				$("#cat_error").html("");
				$("#subCat_error").html("");
				$("#content_error").html("");
			}
			return error;
		}
		
		CKEDITOR.replace( 'editor2' );
		
	</script>
	

</body>
</html>