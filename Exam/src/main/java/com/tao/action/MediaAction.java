package com.tao.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Media;
import com.tao.entity.Teacher;
import com.tao.page.PageBean;
import com.tao.service.MediaService;

@Controller
public class MediaAction extends ActionSupport implements ModelDriven<Media>{

	@Resource
	private MediaService mediaservice;
	private Media media= new Media();

	@Override
	public Media getModel() {
		return media;
	} 
	//json
	private String ResponseJSON;
	public String getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(String responseJSON) {
		ResponseJSON = responseJSON;
	}

	private String contentType;// 文件类型
	private File upload;// 文件对象
	private String fileName;// 文件名

	public String getUploadContentType() {
		return contentType;
	}
	public void setUploadContentType(String contentType) {
		this.contentType = contentType;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		System.out.println("---------setUpload");
		this.upload = upload;
	}
	public String getUploadFileName() {
		return fileName;
	}
	public void setUploadFileName(String fileName) {
		System.out.println("---------setUploadFileName------");
		this.fileName = fileName;
	}

	
	/**
	 * 上传听力资源
	 * @return
	 */
	
	public String uploadmedia() {
		
		System.out.println("fileName："+fileName);
		System.out.println("contentType："+contentType);
		System.out.println("myMedia："+upload);

		//上传路径
		String filePath = ServletActionContext.getServletContext().getRealPath("/media");
		
		File destFile = new File(filePath,fileName);
		long size = upload.length();
		
		float m_size = size/1024/1024;
		String s = String.valueOf(m_size);
		if(!destFile.getParentFile().exists()){
			destFile.getParentFile().mkdirs();
		}
		try {
			FileUtils.copyFile(upload, destFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("------上传成功-------");
		
		setResponseJSON(s);
		return "success";
	}
	
	/**
	 * 添加听力资源
	 * @return
	 * @throws ParseException 
	 */
	
	
	public String addmedia() throws ParseException {
		System.out.println("----MediaAction------addmedia-------"+media);
		//获取当前服务器时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date media_time = sdf.parse(sdf.format(new Date()));
		media.setMedia_time(media_time);
		int count = mediaservice.insert(media);
		if (count != 0) {
			setResponseJSON("success");
			return "success";
		}
		setResponseJSON("repeat");
		return"success";
	}
	
	/**
	 * 修改听力资源
	 * @return
	 */
	public String editmedia() {
		System.out.println("----MediaAction------editmedia-------"+media);
		
		
		int count = mediaservice.update(media);
		if (count != 0) {
		setResponseJSON("success");
		return "success";
		}
		setResponseJSON("repeat");
		return "success";
	}
	
	/**
	 * 删除听力资源
	 * @return
	 */
	
	public String delmedia() {
		System.out.println("----MediaAction------delmedia-------"+media);
		
		String filePath = ServletActionContext.getServletContext().getRealPath("/media");
		String filename = media.getMedia_path();
    File file=new File(filePath+"/"+filename);
    if(!file.exists() && !file.isFile()) {
/*			setResponseJSON("fail");
			return "success";*/
    	}
  /*  file.delete();*/
    int count =  mediaservice.delete(media);
		if (count != 0) {
		setResponseJSON("success");
		return "success";
		}
		setResponseJSON("repeat");
		return "success";
	}
	
	/**
	 * 下载听力资源
	 * @return
	 */
	private String filename;
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	// 下载时需要将该输入流写到浏览器端
	private InputStream fileInputStream;
	public InputStream getFileInputStream() {
		return fileInputStream;
	}
	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}
	
	public String down() throws FileNotFoundException, UnsupportedEncodingException {
		System.out.println("----MediaAction------delmedia-------"+filename);

		String filePath = ServletActionContext.getServletContext().getRealPath("/media");
		File srcFile = new File(filePath, filename);
		
		fileInputStream = new FileInputStream(srcFile);
		
		filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
		System.out.println(filename);
		setFilename(filename);

		return "success";
	}
	
	/**
	 * 分页查询听力资源
	 * @return
	 */
	private int pageNow;
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
		System.out.println("-------setPageNow---");
	}
	public String getmedia() {
		System.out.println("--MediaAction----getmedia---分页查询-----"+media+"----"+pageNow);
		PageBean<Media> pageBean = new PageBean<Media>();
		pageBean.setPageNow(pageNow);
		
		Map<String,Object> nmap=new HashMap<String,Object>();
		nmap.put("info_id", media.getInfo_id());
		nmap.put("media_type", media.getMedia_type());
		nmap.put("media_level", media.getMedia_level());
		nmap.put("media_name", media.getMedia_name());
		pageBean.setParams(nmap);
		System.out.println("nmap-------"+nmap);
		System.out.println(pageBean.getParams());
		
		mediaservice.selectPage(pageBean);
		
		String term = "&info_id="+media.getInfo_id()+"&media_type="+media.getMedia_type()
		+"&media_level="+media.getMedia_level()+"&media_name="+media.getMedia_name();
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		System.out.println("pageBean---------"+pageBean);
		map.put("mediapb", pageBean);
		map.put("term", term);
		return "success";
	}

	/**
	 * 听力题库分页查询听力资源
	 * @return
	 */
	public String qgetmedia() {
		System.out.println("--MediaAction----getmedia---分页查询-----"+media+"----"+pageNow);
		PageBean<Media> pageBean = new PageBean<Media>();
		pageBean.setPageNow(pageNow);
		
		Map<String,Object> nmap=new HashMap<String,Object>();
		nmap.put("info_id", media.getInfo_id());
		nmap.put("media_type", media.getMedia_type());
		nmap.put("media_level", media.getMedia_level());
		nmap.put("media_name", media.getMedia_name());
		pageBean.setParams(nmap);
		System.out.println("nmap-------"+nmap);
		System.out.println(pageBean.getParams());
		
		mediaservice.selectPage(pageBean);
		
/*		String term = "&info_id="+media.getInfo_id()+"&media_type="+media.getMedia_type()
		+"&media_level="+media.getMedia_level()+"&media_name="+media.getMedia_name();*/
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		System.out.println("pageBean---------"+pageBean);
		map.put("getpb", pageBean);
		System.out.println(map.get("getpb"));
	/*	map.put("term", term);*/
		return "success";
	}
}
