package cn.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.entity.Jobs;

/**
 * 职务类dao层接口
 * 
 * @author 曾庆华
 * @date 2019年3月9日
 */
@Mapper
public interface JobsDao {
	/**
	 * 查询出所有的数据
	 * 
	 * @param jobs
	 * @return List<Jobs>
	 */
	public List<Jobs> findAllJobs();

	/**
	 * 添加一条数据
	 * 
	 * @param jobs
	 * @return int
	 */
	public int addJobs(Jobs jobs);

	/**
	 * 删除一条数据
	 * 
	 * @param id
	 * @return int
	 */
	public int delJobs(int id);

	/**
	 * 修改一条数据
	 * 
	 * @param jobs
	 * @return int
	 */
	public int updateJobs(Jobs jobs);
}
