package cn.service.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.dao.mapper.AttendanceDao;
import cn.entity.Attendance;
import cn.service.dao.AttendanceServiceDao;
/**
 * 考勤类service层接口实现类
 * @author 曾庆华
 * @date 2019年3月7日
 */
@Component
public class AttendanceServiceDaoImpl implements AttendanceServiceDao {
	@Autowired
	private AttendanceDao dao  ;

	/**
	 * 实现查询出所有的数据，根据传入的参数模糊查询
	 */
	public List<Attendance> findAllAttendance(String staffId) {
		return dao.findAllAttendance(staffId);
	}

	/**
	 * 实现添加数据的功能
	 */
	public int addAttendance(Attendance ad) {
		return dao.addAttendance(ad);
	}

	/**
	 * 实现删除的功能
	 */
	public int delAttendance(int id) {
		return dao.delAttendance(id);
	}

	/**
	 * 实现修改的功能 
	 */
	public int updateAttendance(Attendance ad) {
		return dao.updateAttendance(ad);
	}
}
