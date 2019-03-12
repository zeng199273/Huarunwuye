package cn.service.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.dao.mapper.EmployeesDao;
import cn.entity.Employees;
import cn.service.dao.EmployeesServiceDao;
/**
 * 员工基本资料service层接口实现类
 * @author 曾庆华
 * @date 2019年3月10日
 */
@Component
public class EmployeesServiceDaoImpl implements EmployeesServiceDao {
	@Autowired
	private EmployeesDao dao ;

	/**
	 * 查询员工职务
	 */
	public List<Map<String, Object>> findEmployeesJobs(String name) {
		return dao.findEmployeesJobs(name);
	}
	
	/**
	 * 查询员工的所有数据
	 */
	public List<Employees> findAllEmployees() {
		return dao.findAllEmployees();
	}

	/**
	 * 添加一条数据
	 */
	public int addEmployees(Employees el) {
		return dao.addEmployees(el);
	}

	/**
	 * 删除一条数据
	 */
	public int delEmployees(int id) {
		return dao.delEmployees(id);
	}

	/**
	 * 更新一条数据
	 */
	public int upEmployees(Employees el) {
		return dao.upEmployees(el);
	}

	/**
	 * 查询员工考勤
	 */
	public List<Map<String, Object>> findEmployeesAttendance(String name) {
		return dao.findEmployeesAttendance(name);
	}

}
