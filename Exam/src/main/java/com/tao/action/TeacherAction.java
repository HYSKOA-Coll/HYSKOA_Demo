package com.tao.action;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Teacher;
import com.tao.page.PageBean;
import com.tao.service.TeacherService;

@Controller
public class TeacherAction extends ActionSupport implements ModelDriven<Teacher> {

	@Resource
	private TeacherService teacherService;
	private Teacher teacher = new Teacher();

	@Override
	public Teacher getModel() {
		return teacher;
	}

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
		this.upload = upload;
	}
	public String getUploadFileName() {
		return fileName;
	}
	public void setUploadFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * 添加教师信息
	 * 1、查询数据是否存在该教师
	 * 2、不存在则添加一个教师
	 * @return
	 */
	public String addteacher() {

		System.out.println("----InfoAction-------addteacher-------------" + teacher);
		teacher.setInfo_judge(0);
		teacher.setInfo_pwd("666666");	
		Teacher sinfo = teacherService.select(teacher);
		if (sinfo == null) {
			int count = teacherService.insert(teacher);
			if (count != 0) {
				setResponseJSON("success");
				return "success";
			}
		}
		setResponseJSON("repeat");
		return "success";
	}

	/**
	 * 批量添加教师信息
	 * 1、解析获取的excel
	 * 2、将字段set入对象中
	 * 3、遍历调用添加方法
	 * @return
	 */
	public String addteachers() {
		
		System.out.println("fileName："+fileName);
		System.out.println("contentType："+contentType);
		System.out.println("upload："+upload);
		
	    //判断是否为excel类型文件
    if(!fileName.endsWith(".xls")&&!fileName.endsWith(".xlsx")){
	    System.out.println("文件不是excel类型");
	    return "repeat";
    	}
    FileInputStream fis =null;
    Workbook wookbook = null;
		
 	  try {
		fis = new FileInputStream(upload);
		wookbook = new XSSFWorkbook(fis);//得到工作簿
		Sheet sheet = wookbook.getSheetAt(0);//得到一个工作表
		Row rowHead = sheet.getRow(0);//获得表头
		int totalRowNum = sheet.getLastRowNum();//获得数据的总行数
		
		/*获得所有数据*/
		for(int i = 1 ; i <= totalRowNum ; i++){
	    Row row = sheet.getRow(i);
		
	    int info_num = (int) row.getCell((short)0).getNumericCellValue();
	    String info_name = row.getCell((short)1).getStringCellValue().toString();
	    
	    System.out.println(info_num+"----"+info_name);
              
	    teacher.setInfo_num(info_num);
	    teacher.setInfo_name(info_name);
	    	
	    addteacher();
		  }
		
		fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setResponseJSON("success");
		return "success";
	}
	
	
	/**
	 * 修改教师信息
	 * 1、通过工号查询数据判断该工号是否存在
	 * 2、拿到修改前的工号与修改后的工号比较
	 * 3、如果工号不存在，或者修改前的工号==修改后的工号则添加
	 * @return
	 */

	private int used_info_num;
	public int getUsed_info_num() {
		return used_info_num;
	}
	public void setUsed_info_num(int used_info_num) {
		this.used_info_num = used_info_num;
	}

	public String editteacher() {
		
		System.out.println("used_info_num========="+used_info_num);
		System.out.println("----InfoAction-------editteacher-------------" + teacher);

		Teacher sinfo = teacherService.select(teacher);
		System.out.println("sinfo-------------------"+sinfo);
		
		if(sinfo!=null && used_info_num != teacher.getInfo_num()) {
			System.out.println("-----------sinfo!=null || used_info_num != teacher.getInfo_num()---------------");
			setResponseJSON("repeat");
			return "success";
			
		}
			int count = teacherService.update(teacher);
			if (count != 0) {
				System.out.println("------count != 0-----------");
				setResponseJSON("success");
				return "success";
			}
			
			System.out.println("------count == 0-----------");
			setResponseJSON("fail");
			return "success";
	}
	
	/**
	 * 重置教师密码
	 * 
	 * @return
	 */
public String alertteacher_pwd() {
	System.out.println("--InfoAction-----alertteacher_pwd---重置教师密码"+teacher);
	
	teacher.setInfo_pwd("666666");
	int count = teacherService.updatePwd(teacher);
	
	if (count != 1) {
		setResponseJSON("repeat");
		return "success";
	}
	
	setResponseJSON("success");
	return "success";
}
	
	/**
	 * 删除老师信息
	 * 
	 * @return
	 */
	public String delteacher() {
		System.out.println("----InfoAction-------delteacher-------------"+teacher);
		
		int count = teacherService.delete(teacher);
		
		if (count != 0) {
			setResponseJSON("success");
			return "success";
		}
		setResponseJSON("repeat");
		return "success";
	}

	/**
	 * 批量删除教师信息
	 * 
	 * @return
	 */
	private String info_ids;
	public String getInfo_ids() {
		return info_ids;
	}
	public void setInfo_ids(String info_ids) {
		this.info_ids = info_ids;
	}
	
	public String delteachers() {
		System.out.println("----InfoAction-------editteachers-------------" + info_ids.toString());
		String[] idAll=info_ids.split(",");
		int count = teacherService.deleteList(idAll);
		System.out.println("del----------count" + count);
		setResponseJSON("success");
		return "success";
	}

	/**
	 * 分页查询teacher
	 * 模糊查询说明：
	 * 	定义一个name_num字段
	 * 	将查询的参数,封装在PageBean的params参数中.
	 * 	通过sql语句判断name or num 匹配传入的数据
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
	private String name_num;
	public String getName_num() {
		return name_num;
	}
	public void setName_num(String name_num) {
		this.name_num = name_num;
	}

	public String getteacher() {

		System.out.println("----InfoAction-------addteacher-------------");
		PageBean<Teacher> pageBean = new PageBean<Teacher>();
		Map<String,Object> nmap=new HashMap<String,Object>();
		nmap.put("name_num", name_num);
		pageBean.setParams(nmap);
		pageBean.setPageNow(pageNow);
		PageBean<Teacher> datas = teacherService.selectPage(pageBean);
		System.out.println("pageBean-------------" + pageBean +"--------"+name_num);

		Map<String, Object> map = ActionContext.getContext().getContextMap();
		map.put("tpb", pageBean);
		return "success";
	}

}
