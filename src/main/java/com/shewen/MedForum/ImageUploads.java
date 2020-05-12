package com.shewen.MedForum;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUploads{

	/*
	 * private static final long serialVersionUID = 1L; private ServletFileUpload
	 * uploader = null;
	 * 
	 * @Override public void init() throws ServletException{ DiskFileItemFactory
	 * fileFactory = new DiskFileItemFactory(); File filesDir = (File)
	 * getServletContext().getAttribute("FILES_DIR_FILE");
	 * fileFactory.setRepository(filesDir); this.uploader = new
	 * ServletFileUpload(fileFactory); }
	 * 
	 * @Override protected void doPost(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException {
	 * if(!ServletFileUpload.isMultipartContent(request)){ throw new
	 * ServletException("Content type is not multipart/form-data"); }
	 * 
	 * response.setContentType("application/json"); PrintWriter out =
	 * response.getWriter(); try { //List<FileItem> fileItemsList =
	 * uploader.parseRequest(request);
	 * org.apache.commons.fileupload.FileItemIterator fileItemsIterator =
	 * uploader.getItemIterator(request); StringBuilder paths = new StringBuilder();
	 * JSONObject path = new JSONObject(); while(fileItemsIterator.hasNext()){
	 * FileItemStream fileItem = (FileItemStream) fileItemsIterator.next(); File
	 * file = new File("webapps/images/"+File.separator+fileItem.getName()); String
	 * s = "C:\\Users\\Habeeb O. Lawal\\Images\\" + fileItem.getName();
	 * if(!file.exists()) { file.mkdir(); // fileItem.write(file); } else {
	 * System.out.println("Image exists already"); } paths.append(s);
	 * System.out.println(paths.toString()); } path.put("path", paths);
	 * System.out.println(path.toString()); out.write(path.toString()); } catch
	 * (FileUploadException e) { System.out.println(e +
	 * "Exception uploading file."); } catch (Exception ex) {
	 * Logger.getLogger(ImageUploads.class.getName()).log(Level.SEVERE, null, ex); }
	 * }
	 */
	
	

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/UploadImage", method = RequestMethod.POST)
	public @ResponseBody
	String uploadFileHandler(HttpServletRequest request,
			@RequestParam("file") MultipartFile file) {
		
		String fileName = file.getOriginalFilename();
		
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = "C:\\Users\\Habeeb O. Lawal\\eclipse-workspace\\MedForum\\src\\main\\webapp\\assets\\mdb\\";
				String Real_path = "C:\\Users\\Habeeb O. Lawal\\Images\\";
				System.out.println(rootPath);
				System.out.println(Real_path);
				File dir = new File(rootPath + File.separator + "img");
				System.out.println(dir);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				file.transferTo(new File(Real_path + fileName));

				return "You successfully uploaded file=" + fileName;
			} catch (Exception e) {
				return "You failed to upload " + fileName + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + fileName
					+ " because the file was empty.";
		}
	}

	public void uploadFile(HttpServletRequest request, MultipartFile file) throws IOException {
		String fileName = file.getOriginalFilename();
		
		System.out.println(fileName);
		
		/*
		 * String rootPath =
		 * "C:\\Users\\Habeeb O. Lawal\\eclipse-workspace\\MedForum\\src\\main\\webapp\\assets\\mdb\\"
		 * ; String Real_path = "C:\\Users\\Habeeb O. Lawal\\Images\\";
		 */
		
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = "C:\\Users\\Habeeb O. Lawal\\eclipse-workspace\\MedForum\\src\\main\\webapp\\assets\\mdb\\";
				String Real_path = "C:\\Users\\Habeeb O. Lawal\\Images\\";
				String path = new File(".").getAbsolutePath();
				System.out.println(rootPath);
				System.out.println(Real_path);
				System.out.println(path);
				File dir = new File(rootPath + File.separator + "img");
				System.out.println(dir);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				file.transferTo(new File(Real_path + fileName));
			} catch (Exception e) {
				e.getMessage();
			}
		}
	}

	/**
	 * Upload multiple file using Spring Controller
	 */
	
}
