package cn.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 绿化实体类
 * @author 曾庆华
 * @date 2019年2月25日
 */
public class Greenarea implements Serializable {
	private int id ;
	private String name ; //绿化名称 
	private int price ;   //价格
	private int areas ;    //绿化面积 
	private String vegetation ;  //植被
	private String imgURL ;  //链接图片
	private Date plantingDate ; //种植时间
	private int fuzerenId ;  //负责人ID
	
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAreas() {
		return areas;
	}
	public void setAreas(int areas) {
		this.areas = areas;
	}
	public String getVegetation() {
		return vegetation;
	}
	public void setVegetation(String vegetation) {
		this.vegetation = vegetation;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8") // 将Date转换成String 一般后台传值给前台时
	public Date getPlantingDate() {
		return plantingDate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd") //将String转换成Date，一般前台给后台传值时用
	public void setPlantingDate(Date plantingDate) {
		this.plantingDate = plantingDate;
	}
	public int getFuzerenId() {
		return fuzerenId;
	}
	public void setFuzerenId(int fuzerenId) {
		this.fuzerenId = fuzerenId;
	}
}
