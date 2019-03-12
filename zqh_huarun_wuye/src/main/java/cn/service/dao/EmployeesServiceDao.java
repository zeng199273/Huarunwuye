package cn.service.dao;

import java.util.List;
import java.util.Map;

import cn.entity.Employees;
/**
 * 员工基本资料service层接口
 * @author 曾庆华
 * @date 2019年3月10日
 */
public interface EmployeesServiceDao {
	/**
	 * 多表查询
	 * 根据员工名称和工号查询员工职务
	 * @param name
	 * @param staffId
	 * @return
	 * List<Map<String,Object>>
	 */
	public List<Map<String, Object>> findEmployeesJobs(String name);
	/**
	 * 多表查询
	 * 根据员工名称查询考勤
	 * @param name
	 * @return
	 * List<Map<String,Object>>
	 */
	public List<Map<String, Object>> findEmployeesAttendance(String name);
	/**
	 * 查询出员工的所有数据
	 * @return
	 * List<Employees>
	 */
	public List<Employees> findAllEmployees();
	/**
	 * 添加一条数据
	 * @param el
	 * @return
	 * int
	 */
	public int addEmployees(Employees el);
	/**
	 * 删除一条数据
	 * @param id
	 * @return
	 * int
	 */
	public int delEmployees(int id);
	/**
	 * 更新一条数据
	 * @param el
	 * @return
	 * int
	 */
	public int upEmployees(Employees el);
}
