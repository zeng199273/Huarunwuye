package cn.service.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.dao.mapper.JobsDao;
import cn.entity.Jobs;
import cn.service.dao.JobsServiceDao;
/**
 * 职务类service层接口实现类
 * @author 曾庆华
 * @date 2019年3月9日
 */
@Component
public class JobsServiceDaoImpl implements JobsServiceDao {
	@Autowired
	private JobsDao dao ;
	/**
	 * 实现查询所有数据的功能
	 */
	public List<Jobs> findAllJobs() {
		return dao.findAllJobs();
	}

	/**
	 * 实现添加数据的功能 
	 */
	public int addJobs(Jobs jobs) {
		return dao.addJobs(jobs);
	}

	/**
	 * 实现删除数据的功能
	 */
	public int delJobs(int id) {
		return dao.delJobs(id);
	}

	/**
	 * 实现更新数据的功能
	 */
	public int updateJobs(Jobs jobs) {
		return dao.updateJobs(jobs);
	}
}
