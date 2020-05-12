package com.shewen.MedForum;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.shewen.MedForum.service.RestCall;


@Controller
public class PageController {
	
		RestCall restCall = new RestCall();
		
		ImageUploads imageUploads = new ImageUploads();
	

		@RequestMapping(value= {"/", "index"})
		public ModelAndView index() {		
			ModelAndView mv = new ModelAndView("index");

			return mv;	
		}
		
		@RequestMapping(value= {"/home"})
		public ModelAndView home(HttpServletRequest request) throws JsonParseException, JSONException {		
			ModelAndView mv = new ModelAndView("home");
			
			String url = "http://localhost:8080/MedForumRestServices/json/data/topics/titles";
			String categories_url = "http://localhost:8080/MedForumRestServices/json/data/categories";
			String subcategories_url = "http://localhost:8080/MedForumRestServices/json/data/subcategories";
			
			String user = (String)request.getSession().getAttribute("username");
			
			System.out.println("user home "+ user);
			
			try {
				JSONArray topictitles = new JSONArray(restCall.executeGet(url));
				JSONArray categories = new JSONArray(restCall.executeGet(categories_url));
				int categoriesLength = categories.length();
				JSONArray sub_categories = new JSONArray(restCall.executeGet(subcategories_url));
				int sub_categoriesLength = sub_categories.length();
				
				System.out.println("category "+ categories);
				System.out.println("sub category "+ sub_categories );
				
				int topictitlesLength = topictitles.length();
				
				mv.addObject("topictitles", topictitles);
				mv.addObject("topictitlesLength", topictitlesLength);
				mv.addObject("categories", categories);
				mv.addObject("categoriesLength", categoriesLength);
				mv.addObject("sub_categories", sub_categories);
				mv.addObject("sub_categoriesLength", sub_categoriesLength);
				mv.addObject("user", user);
				mv.addObject("userClickHome", true);
				
				return mv;
			}
			catch(Exception e) {
				e.printStackTrace();
				return mv;
			}
		}
		
		@RequestMapping(value= {"/newtopic"})
		public ModelAndView newTopic(HttpServletRequest request, HttpServletResponse response) {
			
			String user = (String)request.getSession().getAttribute("username");

			String categories_url = "http://localhost:8080/MedForumRestServices/json/data/categories";
			
			//String subcategories_url = "http://localhost:8080/MedForumRestServices/json/data/subcategories";
			
			ModelAndView mv = new ModelAndView("home");
			
			try {
				if(user != null) {
					JSONArray categories = new JSONArray(restCall.executeGet(categories_url));
					int categoriesLength = categories.length();
			
					//JSONArray sub_categories = new JSONArray(restCall.executeGet(subcategories_url));
					//int sub_categoriesLength = sub_categories.length();
					
					mv.addObject("categories", categories);
					mv.addObject("categoriesLength", categoriesLength);
					//mv.addObject("sub_categories", sub_categories);
					//mv.addObject("sub_categoriesLength", sub_categoriesLength);
					mv.addObject("user", user);
					mv.addObject("userClickNewTopic", true);
					//mv.setViewName("home");
		
					return mv;
				}
				else {
					
					response.sendRedirect("/MedForum/home");
					return null;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				return mv;
			}
		}
		
		@RequestMapping(value= {"/notifications"})
		public ModelAndView notifications(HttpServletRequest request, HttpServletResponse response) {
			
			String user = (String)request.getSession().getAttribute("username");

			String categories_url = "http://localhost:8080/MedForumRestServices/json/data/categories";
			
			String subcategories_url = "http://localhost:8080/MedForumRestServices/json/data/subcategories";

			String url = "http://localhost:8080/MedForumRestServices/json/data/getNotifications";
			
			ModelAndView mv = new ModelAndView("home");
			
			try {
				if(user != null) {
					JSONObject js = new JSONObject();
					js.put("author", user);
					
					JSONArray categories = new JSONArray(restCall.executeGet(categories_url));
					int categoriesLength = categories.length();
					
					JSONArray notifications = new JSONArray(restCall.processRequest(url, js));
					
					//System.out.println("hjdfbvddjdjv "+ notifications);
					
					mv.addObject("categories", categories);
					mv.addObject("categoriesLength", categoriesLength);
					mv.addObject("notifications", notifications);
					mv.addObject("notificationsLength", notifications.length());
					mv.addObject("user", user);
					mv.addObject("userClickNotifications", true);
		
					return mv;
				}
				else {
					
					response.sendRedirect("/MedForum/home");
					return null;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				return mv;
			}
		}
		
		@RequestMapping(value= {"/post/{id}"})
		public ModelAndView topicDetailsPage(HttpServletRequest request, HttpServletResponse response, @PathVariable(name = "id") int id) throws IOException {
			//System.out.println(id);
			String user = (String)request.getSession().getAttribute("username");
			
			String url = "http://localhost:8080/MedForumRestServices/json/data/topicsById";
			
			String replies_url = "http://localhost:8080/MedForumRestServices/json/data/repliesByTopicId";
			
			String categories_url = "http://localhost:8080/MedForumRestServices/json/data/categories";
			
			String likes_url = "http://localhost:8080/MedForumRestServices/json/data/getlikes";
			
			String follows_url = "http://localhost:8080/MedForumRestServices/json/data/getfollows";
			
			try {
				JSONObject js = new JSONObject();
				js.put("topic_id", id);
				
				JSONObject likeJs = new JSONObject();
				likeJs.put("topic_id", id);
				likeJs.put("author", user);
				
				JSONObject followJs = new JSONObject();
				followJs.put("topic_id", id);
				followJs.put("author", user);
				
				JSONObject resp = new JSONObject(restCall.processRequest(url, js));
				
				JSONArray rep_resp = new JSONArray(restCall.processRequest(replies_url, js));
				
				JSONArray categories = new JSONArray(restCall.executeGet(categories_url));
				int categoriesLength = categories.length();
				
				JSONObject like_resp = new JSONObject(restCall.processRequest(likes_url, likeJs));
				
				String like = (String) like_resp.get("like");
				
				JSONObject follow_resp = new JSONObject(restCall.processRequest(follows_url, followJs));
				
				int follow = (Integer) follow_resp.get("status");
				
				System.out.println("this is for the follows "+ follow_resp + "some damn space " + follow );
				
				System.out.println("topicDetails" + resp);
				System.out.println(rep_resp.length());
				System.out.println("replies "+ rep_resp);
				
				ModelAndView mv = new ModelAndView("home");
				
				mv.addObject("topic_details", resp);
				mv.addObject("rep_resp", rep_resp);
				mv.addObject("rep_respLen", rep_resp.length());
				mv.addObject("categories", categories);
				mv.addObject("categoriesLength", categoriesLength);
				mv.addObject("user", user);
				mv.addObject("like", like);
				mv.addObject("follow", follow);
				mv.addObject("userClickTopicDetails", true);
	
				return mv;
			}
			catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/MedForum/home");
				return null;
			}
		}
		
		@RequestMapping("/profile")
		public ModelAndView profile(HttpServletRequest request) {
			String user = (String)request.getSession().getAttribute("username");
			String email = (String)request.getSession().getAttribute("email");
			String date = (String)request.getSession().getAttribute("date");
			String categories_url = "http://localhost:8080/MedForumRestServices/json/data/categories";
			ModelAndView mv = new ModelAndView();
			try {
				if(user != null) {
					JSONObject js = new JSONObject();
					js.put("author", user);
					
					JSONArray categories = new JSONArray(restCall.executeGet(categories_url));
					int categoriesLength = categories.length();
					
					mv.addObject("categories", categories);
					mv.addObject("categoriesLength", categoriesLength);
					mv.addObject("user", user);
					mv.addObject("email", email);
					mv.addObject("date", date);
					mv.addObject("userClickProfile", true);
					mv.setViewName("home");
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return mv;
		}
		
		@RequestMapping(value = {"/likeandunlike"})
		@ResponseBody
		public String likes(@RequestParam("user") String author, @RequestParam("topic_id") String topic_id, @RequestParam("status") String status) {

			try {
				JSONObject js = new JSONObject();
				js.put("topic_id", topic_id);
				js.put("author", author);
				
				if(status .equals("1")) {
					String url = "http://localhost:8080/MedForumRestServices/json/data/likes";
					JSONObject resp = new JSONObject(restCall.processRequest(url, js));
					String response = resp.getString("responsecode");
					return response;
				}
				else {
					String url = "http://localhost:8080/MedForumRestServices/json/data/removelikes";
					JSONObject resp = new JSONObject(restCall.processRequest(url, js));
					String response = resp.getString("responsecode");
					return response;
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
		@RequestMapping(value = {"/totallikes"})
		@ResponseBody
		public String totalLikes(@RequestParam("topic_id") String topic_id) {
			try {
				JSONObject js = new JSONObject();
				js.put("topic_id", topic_id);
				
				String url = "http://localhost:8080/MedForumRestServices/json/data/gettotallikesbytopicid";
				String response = restCall.processRequest(url, js);
				return response;
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "0";
		}
		
		@RequestMapping(value = {"/followandunfollow"})
		@ResponseBody
		public String follows(@RequestParam("user") String author, @RequestParam("topic_id") String topic_id, @RequestParam("status") String status) {

			try {
				JSONObject js = new JSONObject();
				js.put("topic_id", topic_id);
				js.put("author", author);
				
				if(status .equals("1")) {
					String url = "http://localhost:8080/MedForumRestServices/json/data/follows";
					JSONObject resp = new JSONObject(restCall.processRequest(url, js));
					String response = resp.getString("responsecode");
					return response;
				}
				else {
					String url = "http://localhost:8080/MedForumRestServices/json/data/removefollows";
					JSONObject resp = new JSONObject(restCall.processRequest(url, js));
					String response = resp.getString("responsecode");
					return response;
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
		@RequestMapping(value = {"/totalfollows"})
		@ResponseBody
		public String totalfollows(@RequestParam("topic_id") String topic_id) {
			try {
				JSONObject js = new JSONObject();
				js.put("topic_id", topic_id);
				
				String url = "http://localhost:8080/MedForumRestServices/json/data/gettotalfollowsbytopicid";
				String response = restCall.processRequest(url, js);
				System.out.println("dfghjk "+ response);
				return response;
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "0";
		}
		
		@RequestMapping(value = {"/notificationupdatebyuser"})
		@ResponseBody
		public String notificationUpdates(@RequestParam("user") String author) {
			try {
				JSONObject js = new JSONObject();
				js.put("author", author);
				
				String url = "http://localhost:8080/MedForumRestServices/json/data/gettotalupdatebyuser";
				String response = restCall.processRequest(url, js);
				//System.out.println("dfghjk "+ response);
				return response;
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "0";
		}
		
		@RequestMapping(value = {"/notificationdetailsbyuser"})
		@ResponseBody
		public String notificationDetails(@RequestParam("user") String author, @RequestParam("noti_topic_id") String topic_id) {
			try {
				JSONObject js = new JSONObject();
				js.put("author", author);
				js.put("topic_id", topic_id);
				
				String url = "http://localhost:8080/MedForumRestServices/json/data/setS_updateTo0";
				JSONObject response = new JSONObject(restCall.processRequest(url, js));
				String responsecode = response.getString("responsecode");
				//System.out.println("dfghjk "+ responsecode);
				return responsecode;
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "0";
		}
		
		@RequestMapping(value = {"/addPost"}, method=RequestMethod.POST)
		@ResponseBody
		public String addPost(HttpServletRequest request, @RequestParam(name="file", required=false) MultipartFile file, @RequestParam("author") String author, @RequestParam("title") String title, @RequestParam("category_id") int category_id, @RequestParam("subcategory_id") int subcategory_id, @RequestParam("content") String content) throws IOException {
			String fileName = file.getOriginalFilename();
			if(fileName != "null") {
				imageUploads.uploadFile(request, file);
			}
			String addTopic_url = "http://localhost:8080/MedForumRestServices/json/data/topics";
			
			JSONObject js = new JSONObject();
			
			js.put("category_id", category_id);
			js.put("subcategory_id", subcategory_id);
			js.put("author", author);
			js.put("title", title);
			js.put("content", content);
			js.put("image_path", (String)fileName);
			
			try {
				JSONObject addRes = new JSONObject(restCall.processRequest(addTopic_url, js));
				//responsecode = addRes.getString("responsecode");
				return addRes.toString();
				
			} catch (JsonParseException e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
		@RequestMapping(value = {"/addComment"}, method=RequestMethod.POST)
		@ResponseBody
		public String addComment(@RequestParam("user") String author, @RequestParam("topic_id") String topic_id,  @RequestParam("reply_content") String comment) {
			
			//String author = "Shewen";
			
			System.out.println(topic_id + comment + author);
			
			String addComment_url = "http://localhost:8080/MedForumRestServices/json/data/replies";
			
			JSONObject js = new JSONObject();
			
			js.put("author", author);
			js.put("topic_id", topic_id);
			js.put("comment", comment);

			try {
				JSONObject addRes = new JSONObject(restCall.processRequest(addComment_url, js));
				
				String responsecode = addRes.getString("responsecode");
				
				System.out.println("responsecode "+ responsecode);
		
				return responsecode;
				
				
			} catch (JsonParseException e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
		@RequestMapping(value= {"/postBySubCat/{id}"})
		public ModelAndView topicsBySubCat(HttpServletRequest request, HttpServletResponse response, @PathVariable(name = "id") int id) throws IOException {
			System.out.println(id);
			String user = (String)request.getSession().getAttribute("username");
			
			String url = "http://localhost:8080/MedForumRestServices/json/data/topics/subcategory/titles";
			
			String replies_url = "http://localhost:8080/MedForumRestServices/json/data/repliesByTopicId";
			
			String categories_url = "http://localhost:8080/MedForumRestServices/json/data/categories";
			
			try {
				JSONObject js = new JSONObject();
				js.put("subcategory_id", id);
				
				JSONArray resp = new JSONArray(restCall.processRequest(url, js));
				
				JSONArray rep_resp = new JSONArray(restCall.processRequest(replies_url, js));
				
				JSONArray categories = new JSONArray(restCall.executeGet(categories_url));
				int categoriesLength = categories.length();
				
				System.out.println("topicBySubCat" + resp);
				//System.out.println(rep_resp.length());
				//System.out.println("replies "+ rep_resp);
				
				ModelAndView mv = new ModelAndView("home");
				
				mv.addObject("topicbysubcat", resp);
				mv.addObject("topicbysubcatLength", resp.length());
				mv.addObject("rep_respLen", rep_resp.length());
				mv.addObject("categories", categories);
				mv.addObject("categoriesLength", categoriesLength);
				mv.addObject("user", user);
				mv.addObject("userClickTopicBySubCat", true);
	
				return mv;
			}
			catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/MedForum/home");
				return null;
			}
		}

		
		@RequestMapping("/login")
		@ResponseBody
		public String login(HttpServletRequest request, @RequestParam("username") String username, @RequestParam("pass") String password) {
			
			String login1_url = "http://localhost:8080/MedForumRestServices/json/data/login1";
			
			try {
				JSONObject js = new JSONObject();
				js.put("username", username);
				
				JSONObject response = new JSONObject(restCall.processRequest(login1_url, js));
				
				//System.out.println("response " + response);
				
				String responsecode = response.getString("responsecode");
				if(responsecode.equals("00")) {
					String token = response.getString("token");
					String login2_url = "http://localhost:8080/MedForumRestServices/json/data/login2";
					JSONObject js_2 = new JSONObject();
					js_2.put("token", token);
					js_2.put("password", password);
					
					JSONObject response_2 = new JSONObject(restCall.processRequest(login2_url, js_2));
					
					//System.out.println("response 2 "+ response_2 );
					String responsecode_2 = response_2.getString("responsecode");
					if(responsecode_2.equals("00")) {
						request.getSession().setAttribute("id", response_2.get("user_id"));
						request.getSession().setAttribute("token", response_2.get("token"));
						request.getSession().setAttribute("username", response_2.get("username"));
						request.getSession().setAttribute("email", response_2.get("email"));
						request.getSession().setAttribute("date", response_2.get("date"));
						
						return "success";
					}
					else {
						return "password_error";
					}
				}
				else {
					return "username_error";
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				return "username_error";
			}
			
		}
	

		@RequestMapping("/register")
		@ResponseBody
		public String register(HttpServletRequest request, @RequestParam("username") String username, @RequestParam("email") String email, @RequestParam("pass") String password) {
			
			String role = "USER";
			String reg_url = "http://localhost:8080/MedForumRestServices/json/data/register";
			
			try {
				JSONObject js = new JSONObject();
				js.put("username", username);
				js.put("role", role);
				js.put("password", password);
				js.put("email", email);
				
				JSONObject response = new JSONObject(restCall.processRequest(reg_url, js));
				
				String responsecode = response.getString("responsecode");
				
				//System.out.println("responseReg "+ responsecode);
				
				return responsecode;
				
				
			}
			catch(Exception e) {
				e.printStackTrace();
				return "error";
			}
			
		}
		
		@RequestMapping("/subCategory")
		@ResponseBody
		public String subCategory(HttpServletRequest request) {
			
			String subcategories_url = "http://localhost:8080/MedForumRestServices/json/data/subcategories";
			
			try {
				String response = restCall.executeGet(subcategories_url);
				
				return response;
				
			}
			catch(Exception e) {
				e.printStackTrace();
				return "error";
			}	
		}
		
		@RequestMapping("/logout")
		public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
			request.getSession().invalidate();
			response.sendRedirect("/MedForum/home");
			return null;
		}

		
}
