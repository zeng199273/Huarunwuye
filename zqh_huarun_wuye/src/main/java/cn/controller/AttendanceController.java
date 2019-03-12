package cn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import cn.entity.Attendance;
import cn.service.dao.impl.AttendanceServiceDaoImpl;
/**
 * 考勤类web层
 * @author 曾庆华
 * @date 2019年3月7日
 */
@RestController
public class AttendanceController {
	@Autowired
	private AttendanceServiceDaoImpl service ;
	/**
	 * 得到所有的数据并转为json，根据传入的员工号进行模糊查询
	 * @param page
	 * @param limit
	 * @param staffId
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping(value="/findAllAttendance",method = RequestMethod.GET)
	public Map<String, Object> findAllAttendance(int page,int limit,String staffId){
		//分页
		Page<Object> pageInfo = PageHelper.startPage(page, limit);
		//得到所有数据
		List<Attendance> list = service.findAllAttendance(staffId);
		//创建map集合存储数据
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageInfo.getTotal());
		map.put("data",list);
		return map ;
	}
	/**
	 * 添加数据
	 * @param ad
	 * @return
	 * String
	 */
	@RequestMapping("/addAttendance")
	public String addAttendance(Attendance ad){
		if(ad !=null){
			int index = service.addAttendance(ad);
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
	@RequestMapping("/delAttendance")
	public String delAttendance(int id){
		int index = service.delAttendance(id);
		if(index > 0){
			return "success" ;
		}
		return "error" ;
	}
	/**
	 * 修改一条数据
	 * @param ad
	 * @return
	 * String
	 */
	@RequestMapping("/upAttendance")
	public String upAttendance(Attendance ad){
		if(ad!=null){
			int index = service.updateAttendance(ad);
			if(index > 0){
				return "success" ;
			}
		}
		return "error" ;
	}
}
