package cn.service.dao;

import java.util.List;

import cn.entity.Attendance;

/**
 * 考勤类service层接口
 * @author 曾庆华
 * @date 2019年3月7日
 */
public interface AttendanceServiceDao {
	/**
	 * 查询出所有的数据，根据传入的参数进行模糊查询
	 * @param staffId
	 * @return
	 * List<Attendance>
	 */
	public List<Attendance> findAllAttendance(String staffId);
	/**
	 * 添加考勤
	 * @param ad
	 * @return
	 * int
	 */
	public int addAttendance(Attendance ad);
	/**
	 * 删除一条考勤
	 * @param id
	 * @return
	 * int
	 */
	public int delAttendance(int id);
	/**
	 * 修改数据
	 * @param ad
	 * @return
	 * int
	 */
	public int updateAttendance(Attendance ad);
}
