package cn.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 绿化负责人实体类
 * @author 曾庆华
 * @date 2019年2月25日
 */
public class Fuzeren implements Serializable {
	private int id ;
	private String name ;  //名称
	private String phone ; //电话
	private String jobs ;  //职务
	private Date scwxsj ; //上次维护时间
	
	
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJobs() {
		return jobs;
	}
	public void setJobs(String jobs) {
		this.jobs = jobs;
	}
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	public Date getScwxsj() {
		return scwxsj;
	}
	@DateTimeFormat(pattern="yyyy-mm-dd")
	public void setScwxsj(Date scwxsj) {
		this.scwxsj = scwxsj;
	}
}
