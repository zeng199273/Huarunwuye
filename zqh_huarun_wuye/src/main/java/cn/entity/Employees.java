package cn.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 员工基本资料实体类
 * @author 曾庆华
 * @date 2019年3月9日
 */
public class Employees {
	private int id ;  
	private String name ; //姓名
	private String sex ;  //性别
	private int age ;   //年龄
	private Date entryDate ;  //入职时间
	private String phone ;  //联系电话
	private String staffId ;  //员工号
	private int jobsId ;  //职务id
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")  //将Date转换成String,一般后台传值给前台时用
	public Date getEntryDate() {
		return entryDate;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")   //将String转换成Date，一般前台传值给后台时用
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public int getJobsId() {
		return jobsId;
	}
	public void setJobsId(int jobsId) {
		this.jobsId = jobsId;
	}
}
