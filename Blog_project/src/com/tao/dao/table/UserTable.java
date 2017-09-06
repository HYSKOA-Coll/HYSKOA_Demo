package com.tao.dao.table;
/**
 * 
 *	User   sql类
 */
public interface UserTable {

	public static final String FTABLE = "User";
	
	public static final String FUSER = "user";
	public static final String FPWD = "pwd";
	
		//添加数据
		public static final String insert = new StringBuilder()
				.append("insert into ").append(FTABLE)
				.append(" values (?,?)")
				.toString();
		
		//查询数据
//		public static final String select = new StringBuilder()
//				.append("select * from ").append(FTABLE)
//				.toString();
		
		//条件查询数据
		public static final String onselect = new StringBuilder()
				.append("select * from ").append(FTABLE)
				.append(" where user=?")
				.toString();
		
		//删除数据
		public static final String delete = new StringBuilder()
				.append("delete from ").append(FTABLE)
				.toString();
		
		//条件删除数据
		public static final String ondelete = new StringBuilder()
				.append("delete from ").append(FTABLE)
				.append(" where ").append(FUSER).append("=?")
				.toString();
}
