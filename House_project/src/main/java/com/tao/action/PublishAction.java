package com.tao.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.PageBean;
import com.tao.dao.PublishDao;
import com.tao.entity.Publish;

/**
 * 
 * @author hyskoa
 *	发布房源Action类
 */
public class PublishAction extends ActionSupport implements ModelDriven<Publish>{

	private Publish publish = new Publish();
	private PublishDao publishDao = new PublishDao();
	
	private int rentmin;
	private int rentmax;
	private int room;
	
	private String pageNow;
	
	private String contentType;//文件类型
	private File upload;//文件对象
	private String fileName;//文件名
	
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
		this.upload = upload;
	}
	public String getUploadFileName() {
	    return fileName;
	}
	public void setUploadFileName(String fileName) {
	    this.fileName = fileName;
	}

	public String getPageNow() {
		return pageNow;
	}
	public void setPageNow(String pageNow) {
		this.pageNow = pageNow;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public int getRentmin() {
		return rentmin;
	}

	public void setRentmin(int rentmin) {
		System.out.println("---setRentmin----");
		this.rentmin = rentmin;
	}

	public int getRentmax() {
		return rentmax;
	}

	public void setRentmax(int rentmax) {
		System.out.println("---setRentmax----");
		this.rentmax = rentmax;
	}

	private Object responseJSON;
	
	public Object getResponseJSON() {
		return responseJSON;
	}

	public void setResponseJSON(Object responseJSON) {
		this.responseJSON = responseJSON;
	}

	@Override
	public Publish getModel() {
		return publish;
	}

	
	/**
	 * 添加房源信息
	 */
	
	public String publish() {
		
		System.out.println("----FileUploadAction-----upload()------------");
		
		try {
			
		
		//获取当前服务器时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = sdf.parse(sdf.format(new Date()));
		
		/*String name = publish.getName();*/
		String aname = publish.getAname();
		int hroom = publish.getHroom();
		int hhall =publish.getHhall();
		int hwei = publish.getHwei();
		int hrice = publish.getHrice();
		int fthis = publish.getFthis();
		int fall = publish.getFall();
		int rent = publish.getRent();
		String title = publish.getTitle();
		String hsay = publish.getHsay();
		String picture = fileName;
		String position = publish.getPosition();
		String divice = publish.getDivice();
		String genre = publish.getGenre();
		
		String name = (String) ActionContext.getContext().getSession().get("name");
		
		System.out.println(time);
		System.out.println(name);
		Object[] param = {name,aname,hroom,hhall,hwei,hrice,fthis,fall,rent,title,hsay,picture,time,position,divice,genre};
		
		int count = publishDao.insertlist(param);
		
		
		if(count == 1) {
			setResponseJSON("success");
			return "success";
			
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		setResponseJSON("repeat");
		return "success";
	}
	/*
	 * 上传
	 */
	public String upload() {
		

		System.out.println("fileName："+fileName);
		System.out.println("contentType："+contentType);
		System.out.println("upload："+upload);
		
		//上传路径
		String filePath = ServletActionContext.getServletContext().getRealPath("/images");
		
		File destFile = new File(filePath,fileName);
		if(!destFile.getParentFile().exists()){
			destFile.getParentFile().mkdirs();
		}
		try {
			FileUtils.copyFile(upload, destFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(fileName);
		ActionContext.getContext().getContextMap().put("fileName", fileName);
		System.out.println("------上传成功-------");
		
		
		
		setResponseJSON("success");
		return "success";
	}

	/**
	 * 查询用户发布房源列表
	 */
	public String list() {
		
		System.out.println("-------PublishAction--------PublishList-------");
			
		System.out.println("hroom-----"+room);
		System.out.println("rentmin-----"+rentmin);
		System.out.println("rentmax-----"+rentmax);

			try {

				/** 5.3
				 * 直接访问getAll  点击首页------->默认显示第一页，没有pageNow这个参数传过来
				 * 点击上一页  下一页  尾页  ----->需要传入pageNow参数
				 * 获取pageNow参数时，有时候存在  有时候不存在
				 * 所以需要进行判断*/
				
				PageBean<Publish> pb = new PageBean<Publish>();
					
				if(pageNow!=null && !"".equals(pageNow)){
					//如果可以获取到当前需要显示的页数，就修改pb的pageNow属性
					pb.setPageNow(Integer.parseInt(pageNow));
				}		

	 			List<Publish> data= publishDao.getByPage(pb, rentmin, rentmax, room);
	 			pb.setData(data);
	 			
			Map<String,Object> map = ActionContext.getContext().getContextMap();
			map.put("pb", pb);
			
			} catch (SQLException e) {
				e.printStackTrace();
			}

 			
			return "success";
	}
	
	/**
	 * 通过Id查询详情页
	 */
	
	public String content() {
		
		System.out.println("-------PublishAction--------content-------");
		
		System.out.println(publish.getId());
		
		try {
			
			publish = publishDao.selectid(publish.getId());
			
			Map<String,Object> map = ActionContext.getContext().getContextMap();
			map.put("publish", publish);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "success";
	}
}
