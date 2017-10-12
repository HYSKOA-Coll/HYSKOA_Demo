package com.tao.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ObjectUtils.Null;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.tao.entity.Clazz;
import com.tao.entity.College;
import com.tao.entity.Info;
import com.tao.entity.Major;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.page.PageBean;
import com.tao.service.InfoService;

public class InfoAction extends ActionSupport implements ModelDriven<Info>{

	@Resource
	private InfoService infoService;
	
	Info info = new Info();
	@Override
	public Info getModel() {
		// TODO Auto-generated method stub
		return info;
	}
	private Object ResponseJSON;

	public Object getResponseJSON() {
		return ResponseJSON;
	}

	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	private List ResponseJSON1;
	

	public List getResponseJSON1() {
		return ResponseJSON1;
	}

	public void setResponseJSON1(List responseJSON1) {
		ResponseJSON1 = responseJSON1;
	}
	//-----------获取学生---------------------	
	private int pageNow = 1;

	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
		System.out.println("-------setPageNow---");
		
	}
	private String name_num;
	public String getName_num() {
		return name_num;
	}
	public void setName_num(String name_num) {
		this.name_num = name_num;
	}

	/*
	 * 分页查询
	 */
	public String getStudent() {
		
		System.out.println("----InfoAction-------getStudent-------------");
		HttpServletRequest request = ServletActionContext.getRequest();
		String college_id = request.getParameter("college_id");
		String major_id = request.getParameter("major_id");
		String clazz_id = request.getParameter("clazz_id");
		String nameOrnumber = request.getParameter("nameOrnumber");
		Map<String, Object> map = new HashMap<String, Object>();
		if (college_id == null || college_id =="" || college_id == "null") {
			college_id = "0";
		}
		if (major_id == null || major_id !="" || major_id == "null") {
			major_id ="0";
		}
		if (clazz_id == null || clazz_id =="" || clazz_id == "null") {
			clazz_id = "0" ;
		}
		if (nameOrnumber != null && nameOrnumber !="" && nameOrnumber != "null") {
			map.put("nameOrnumber", nameOrnumber);
		}
		map.put("college_id", college_id);
		map.put("major_id", major_id);
		map.put("clazz_id", clazz_id);
		
		System.out.println("college_id"+college_id+"major_id"+major_id+"clazz_id"+clazz_id+"nameOrnumber"+nameOrnumber);
		request.setAttribute("data","college_id="+college_id+"&major_id="+major_id+"&clazz_id="+clazz_id+"&nameOrnumber="+nameOrnumber);
		
		PageBean<Info> pageBean = new PageBean<Info>();
		pageBean.setConditions2(map);
		if(pageNow==0){
			pageNow=1;
		}
		pageBean.setPageNow(pageNow);
		PageBean<Info> datas = infoService.selectPage(pageBean);
		
		
		System.out.println("datas---------------"+datas);
		Map<String, Object> cmMap = pageBean.getConditions2();
		System.out.println("---cmMap-------------"+cmMap);
		
		
		
		System.out.println("pageBean----------"+pageBean);
		
		System.out.println(pageBean.getDatas());
		request.setAttribute("pageBean", pageBean);
		
		/*Map<String, Object> map2 = ActionContext.getContext().getContextMap();
		map2.put("pageBean", datas);*/
		return "success";		
		
	}
	
	
//--------------删除一个学生----------------
	public String delStudent() {
		
		System.out.println("--------delStudent---------------");
		infoService.delete(info);
		setResponseJSON("success");
		return "success";
	}
	
	
//---------------删除多个学生---------------------
	
	private String info_nums;
	public String getInfo_nums() {
		return info_nums;
	}
	public void setInfo_nums(String info_nums) {
		this.info_nums = info_nums;
	}

	public String delStudentList(){
		
		System.out.println("--------delStudentList---------------");

		String[] numAll=info_nums.split(",");
		int count = infoService.deleteList(numAll);
		
		if(count == 0){
			setResponseJSON("repeat");
			return "success";
		}
		setResponseJSON("success");
		return "success";
	}
	
//修改密码
	public String updatePwd(){
		
		System.out.println("--------updatePwd---------------");
		infoService.updatepwd(info);
		
		setResponseJSON("success");
		return "success";
	}
	
	
	
	
	//---------------------EXCEL导入-------------------------------------

	private String contentType;//文件类型
	private File upload;//文件对象
	private String fileName;//文件名
	
	//private String caption;

	/*public Object getResponseJSON() {
		return responseJSON;
	}

	public void setResponseJSON(Object responseJSON) {
		this.responseJSON = responseJSON;
	}*/

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

	
	public String Excel() throws IOException{
		
		
		System.out.println("----FileUploadAction-----upload()------------");
		
		System.out.println("fileName："+fileName);
		System.out.println("contentType："+contentType);
		System.out.println("upload："+upload);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String class_id = request.getParameter("clazz_id");
		int clazz_id = Integer.parseInt(class_id);
		
		//判断是否为excel类型
		if(fileName.endsWith(".xls")&&!fileName.endsWith(".xlsx")){
			System.out.println("文件不是excel类型");
			return "repet";
		}
		System.out.println("eeeeeeeeeeeeeeeeeeeeeee");
		FileInputStream fis = null;
		Workbook wookbook = null;

		fis = new FileInputStream(upload);
		System.out.println("--------------1111-------------------");
		//得到工作薄
		wookbook = new XSSFWorkbook(fis);
		System.out.println("--------------222-------------------"+wookbook);
		//得到工作表
		Sheet sheet = wookbook.getSheetAt(0);
		System.out.println("--------------3333-------------------");
	 //获得表头
		Row rowHead = sheet.getRow(0);
		System.out.println(rowHead);
		System.out.println("--------------4444-------------------");
		//判断表头
		if(rowHead.getPhysicalNumberOfCells() !=5){
			System.out.println("表头数量不对");
		}
		//获得数据的总行数
		int totalRowNum = sheet.getLastRowNum();
		System.out.println("totalRows----" + totalRowNum);
		//要获得属性
		int info_num;			//学号/工号
		String info_name;		//学生名/老师名
		String info_gender;	//学生性别
		long info_phone;		//学生电话
		long info_pwd;			//初始密码
		//有数据
		for (int i = 1; i <= totalRowNum ; i++) {
				Row row = sheet.getRow(i);
				info_num = (int)row.getCell((short)0).getNumericCellValue();
				info_name = row.getCell((short)1).getStringCellValue().toString();
				info_gender = row.getCell((short)2).getStringCellValue().toString();
				info_phone = (long) row.getCell((short)3).getNumericCellValue();
				info_pwd = (long) row.getCell((short)4).getNumericCellValue();
				Info info2 = new Info(0,info_num,info_name,info_gender,info_phone+"",1,info_pwd+"",clazz_id);
				System.out.println(info2);
				info=infoService.select(info2);
				if (info != null) {
					setResponseJSON("repeat");
					return "success";
				}else{
					infoService.insert(info2);
				}
		}
		setResponseJSON("success");
		return "success";
}
	
	
	
//--------------------查询学院------------------------
	public String getColl(){
		
		System.out.println("------------getCollege-------------");
		College college = new College();
		List<College> list = infoService.selectCollegeList();
		
		System.out.println("----list---------"+list);
		setResponseJSON1(list);
		return "success";
	}
	
//------------------查询专业-------------------------------
	public String getMaj(){
		
		System.out.println("------------getMajor-------------");
		HttpServletRequest request = ServletActionContext.getRequest();
		String college_id =  request.getParameter("college_id");
		System.out.println("college_id" + college_id);
		int id = Integer.parseInt(college_id);
		Major m = new Major();
		m.setCollege_id(id);
		System.out.println(m);
		List<Major> list = infoService.selectMajorList(m);
		setResponseJSON1(list);
		System.out.println(list);
		return "success";
	}
	
//------------------查询班级-------------------------------
	public String getCla(){
		System.out.println("------------getClazz-------------");
		HttpServletRequest request = ServletActionContext.getRequest();
		String major_id =  request.getParameter("major_id");
		System.out.println("major_id" + major_id);
		int id = Integer.parseInt(major_id);
		Clazz clazz = new Clazz();
		clazz.setMajor_id(id);
		System.out.println(clazz);
		List<Clazz> list = infoService.selectClazzList(clazz);
		setResponseJSON1(list);
		System.out.println(list);
		return "success";
	}
	
//-------------------添加一个学生--------------------------------
	public String addstu(){
		
		System.out.println("------------addstudent----------------");
		System.out.println(info);
		int info_num = info.getInfo_num();
		System.out.println("info_num"+info_num);
		Info info2 = infoService.select(info);
		System.out.println(info2);
		if (info2 != null) {
			setResponseJSON("repeat");
			return "success";
		}else{
		infoService.insert(info);
		
		setResponseJSON("success");
		return "success";
		}
	}
	
//获取一条学生信息
	public String getOne(){
		
		System.out.println("-------------getStudentOne----------------");
		Info info2 = infoService.select(info);
		System.out.println("info2--------------"+info2);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("info2", info2);
		setResponseJSON(info2);
		return "success";
	}
	
//---------修改一条数据-----
	public String update(){
		System.out.println("-------------update-------------------"+info);
		int a = infoService.update(info);
		
		System.out.println("a----update count---"+a);
		setResponseJSON("success");
		return "success";
	}
}

