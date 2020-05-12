package com.shewen.MedForum.service;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;

public class RestCall {
	
	
	public String processRequest(String targetURL, JSONObject js) throws JsonParseException {
		//HttpURLConnection con = null;
		
		try {
			URL url = new URL(targetURL);
			HttpURLConnection con1 = (HttpURLConnection)url.openConnection();
			con1.setRequestMethod("POST");
			con1.setRequestProperty("Content-Type", "application/json; utf-8");
			con1.setRequestProperty("Accept", "application/json");
			con1.setDoOutput(true);
			String jsonInputString = js.toString();
			
			System.out.println("jsonInputString" + jsonInputString);
			
			try(OutputStream os = con1.getOutputStream()) {
				byte[] input = jsonInputString.getBytes("utf-8");
				os.write(input, 0, input.length);
			}
			try(BufferedReader br = new BufferedReader(
				new InputStreamReader(con1.getInputStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine = null;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}
				return response.toString();
			}
		}
		catch (IOException e) {
			e.toString(); return null;
		}
	}
	
	
	
	
	public String executeGet(String targetURL) throws JSONException {
        HttpURLConnection connection = null;
        try {
            URL url = new URL(targetURL);
            //Secure secure = new Secure();
            //String header = secure.GetSha512("StudyisfunForChildrenPaymentIsImportant");
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestProperty ("Accept", "application/json");
            connection.setRequestProperty("Content-Type", "application/json; utf-8");
            connection.setDoOutput(true);
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder myResponse = new StringBuilder();
            String my_response;
            while ((my_response = rd.readLine()) != null) {
                myResponse.append(my_response);
            }
            return myResponse.toString();
        } catch (IOException e) {
            System.out.println(e.toString());
            return null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }
	
	
	/*
	 * public String executeRequest(String targetURL, String methodType, JSONObject
	 * js) throws JSONException { HttpURLConnection connection = null; try { URL url
	 * = new URL(targetURL); Secure secure = new Secure(); String header =
	 * secure.GetSha512("StudyisfunForChildrenPaymentIsImportant"); connection =
	 * (HttpURLConnection) url.openConnection();
	 * connection.setRequestMethod(methodType);
	 * connection.setRequestProperty("Content-Type", "application/json");
	 * connection.setRequestProperty (header, "header");
	 * connection.setDoOutput(true); String dataToSend = js.toString();
	 * System.out.println("dataToSend: " + dataToSend); try (OutputStream wr =
	 * connection.getOutputStream()){ byte[] in = dataToSend.getBytes("utf-8");
	 * wr.write(in, 0, in.length); } BufferedReader rd = new BufferedReader(new
	 * InputStreamReader(connection.getInputStream())); StringBuilder myResponse =
	 * new StringBuilder(); String my_response; while ((my_response = rd.readLine())
	 * != null) { myResponse.append(my_response); } return myResponse.toString(); }
	 * catch (IOException e) { System.out.println(e.toString()); return null; }
	 * finally { if (connection != null) { connection.disconnect(); } } }
	 * 
	 * public String executeGet(String targetURL) throws JSONException {
	 * HttpURLConnection connection = null; try { URL url = new URL(targetURL);
	 * Secure secure = new Secure(); String header =
	 * secure.GetSha512("StudyisfunForChildrenPaymentIsImportant"); connection =
	 * (HttpURLConnection) url.openConnection(); connection.setRequestProperty
	 * (header, "header"); connection.setDoOutput(true); BufferedReader rd = new
	 * BufferedReader(new InputStreamReader(connection.getInputStream()));
	 * StringBuilder myResponse = new StringBuilder(); String my_response; while
	 * ((my_response = rd.readLine()) != null) { myResponse.append(my_response); }
	 * return myResponse.toString(); } catch (IOException e) {
	 * System.out.println(e.toString()); return null; } finally { if (connection !=
	 * null) { connection.disconnect(); } } }
	 * 
	 * public String executeRequest(String targetURL, String methodType,
	 * MultipartFile file, String subject, String uploader) { HttpURLConnection
	 * connection = null; try { URL url = new URL(targetURL); Secure secure = new
	 * Secure(); String header =
	 * secure.GetSha512("StudyisfunForChildrenPaymentIsImportant"); connection =
	 * (HttpURLConnection) url.openConnection();
	 * connection.setRequestMethod(methodType);
	 * connection.setRequestProperty("Content-Type", "multipart/form-data");
	 * connection.setRequestProperty (header, "header");
	 * connection.setDoOutput(true);
	 * 
	 * 
	 * BufferedReader rd = new BufferedReader(new
	 * InputStreamReader(connection.getInputStream())); StringBuilder myResponse =
	 * new StringBuilder(); String my_response; while ((my_response = rd.readLine())
	 * != null) { myResponse.append(my_response); } return myResponse.toString(); }
	 * catch (IOException e) { System.out.println(e.toString()); return null; }
	 * finally { if (connection != null) { connection.disconnect(); } } }
	 */
	

}
