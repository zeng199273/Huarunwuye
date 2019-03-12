package cn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.entity.Employees;
import cn.service.dao.impl.EmployeesServiceDaoImpl;
/**
 * 员工基本信息web层
 * @author 曾庆华
 * @date 2019年3月10日
 */
@Controller
public class EmployeesController {
	@Autowired
	private EmployeesServiceDaoImpl service ;
	/**
	 * 多表查询
	 * 根据员工名查询出员工职务
	 * @param page
	 * @param limit
	 * @param name
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping(value="/findEmployeesJobs",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findEmployeesJobs(int page,int limit,String name){
		//分页
		Page<Object> pageInfo = PageHelper.startPage(page, limit);
		//得到数据
		List<Map<String, Object>> list = service.findEmployeesJobs(name);	
		//创建map集合
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageInfo.getTotal());
		map.put("data", list);
		return map ;
	}
	/**
	 * 多表查询
	 * 根据员工名查询出考勤
	 * @param page
	 * @param limit
	 * @param name
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping(value="/findEmployeesAttendance",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findEmployeesAttendance(int page,int limit,String name){
		//分页
		Page<Object> pageInfo = PageHelper.startPage(page, limit);
		//得到数据
		List<Map<String, Object>> list = service.findEmployeesAttendance(name);	
		//创建map集合
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageInfo.getTotal());
		map.put("data", list);
		return map ;
	}
	/**
	 * 查询出所有的员工数据
	 * @param page
	 * @param limit
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping("/findAllEmployees")
	@ResponseBody
	public Map<String, Object> findAllEmployees(int page,int limit){
		//分页
		Page<Object> pageInfo = PageHelper.startPage(page, limit);
		//得到数据
		List<Employees> list = service.findAllEmployees();
		//创建map集合
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageInfo.getTotal());
		map.put("data", list);
		return map ;
	}
	/**
	 * 添加一条数据
	 * @param el
	 * @return
	 * String
	 */
	@RequestMapping("/addEmployees")
	@ResponseBody
	public String addEmployees(Employees el){
		if(el!=null){
			int index = service.addEmployees(el);
			if(index < 0){
				return "error" ;
			}
		}
		return "success" ;
	}
	/**
	 * 删除一条数据
	 * @param id
	 * @return
	 * String
	 */
	@RequestMapping("/delEmployees")
	@ResponseBody
	public String delEmployees(int id){
		int index = service.delEmployees(id);
		if(index > 0){
			return "success" ;
		}
		return "error" ;
	}
	/**
	 * 更新一条数据
	 * @param el
	 * @return
	 * String
	 */
	@RequestMapping("/upEmployees")
	@ResponseBody
	public String upEmployees(Employees el){
		if(el!=null){
			int index = service.upEmployees(el);
			if(index > 0){
				return "success" ;
			}
		}
		return "error" ;
	}
}
