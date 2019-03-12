package cn.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 考勤表实体类
 * @author 曾庆华
 * @date 2019年3月6日
 */
public class Attendance implements Serializable {
	private int id ;
	private String staffId ;  //员工号
	private Date clockIn ;  //打卡时间
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8") // 将Date转换成String 一般后台传值给前台时用
	public Date getClockIn() {
		return clockIn;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd") //将String转换成Date，一般前台给后台传值时用
	public void setClockIn(Date clockIn) {
		this.clockIn = clockIn;
	}
}
