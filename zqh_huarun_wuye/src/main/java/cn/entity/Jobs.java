package cn.entity;
/**
 * 员工职务表
 * @author 曾庆华
 * @date 2019年3月9日
 */
public class Jobs {
	private int id ;
	private String jobs ;  //职务名称
	private int basePay ;   //基本工资
	private int subsidy ;   //补贴
	private int grossPay ;  //工资总额
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJobs() {
		return jobs;
	}
	public void setJobs(String jobs) {
		this.jobs = jobs;
	}
	public int getBasePay() {
		return basePay;
	}
	public void setBasePay(int basePay) {
		this.basePay = basePay;
	}
	public int getSubsidy() {
		return subsidy;
	}
	public void setSubsidy(int subsidy) {
		this.subsidy = subsidy;
	}
	public int getGrossPay() {
		return grossPay;
	}
	public void setGrossPay(int grossPay) {
		this.grossPay = grossPay;
	}
}
