package cn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.entity.Jobs;
import cn.service.dao.impl.JobsServiceDaoImpl;
/**
 * 职务类web层
 * @author 曾庆华
 * @date 2019年3月9日
 */
@RestController
public class JobsController {
	@Autowired
	private JobsServiceDaoImpl service ;
	/**
	 * 得到所有的数据
	 * @param page
	 * @param limit
	 * @param jobs
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping("/findAllJobs")
	public Map<String, Object> findAllJobs(int page,int limit){
		//分页
		Page<Object> pageInfo = PageHelper.startPage(page, limit);
		//得到所有数据
		List<Jobs> list = service.findAllJobs();
		//创建map集合
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageInfo.getTotal());  //分页的总条数
		map.put("data", list);
		return map ;
	}
	/**
	 * 添加一条数据
	 * @param jobs
	 * @return
	 * String
	 */
	@RequestMapping("/addJobs")
	public String addJobs(Jobs jobs){
		if(jobs!=null){
			int index = service.addJobs(jobs);
			if(index > 0){
				return "success" ;
			}
		}
		return "error" ;
	}
	/**
	 * 删除一条数据
	 * @param id
	 * @return
	 * String
	 */
	@RequestMapping("/delJobs")
	public String delJobs(int id){
		int index = service.delJobs(id);
		if(index > 0){
			return "success" ;
		}
		return "error" ;
	}
	/**
	 * 更新一条数据
	 * @param jobs
	 * @return
	 * String
	 */
	@RequestMapping("/upJobs")
	public String upJobs(Jobs jobs){
		if(jobs!=null){
			int index = service.updateJobs(jobs);
			if(index > 0){
				return "success" ;
			}		
		}
		return "error" ;
	}
}
