package cn.service.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.dao.mapper.GreenareaDao;
import cn.entity.Greenarea;
import cn.service.dao.GreenareaServiceDao;
/**
 * 绿化service层接口的实现类
 * @author 曾庆华
 * @date 2019年2月25日
 */
@Component
public class GreenareaServiceDaoImpl implements GreenareaServiceDao {
	@Autowired
	private GreenareaDao dao ;

	/**
	 * 查询出所有的数据
	 */
	public List<Greenarea> findAll() {
		return dao.findAll();
	}
	/**
	 * 添加一条数据
	 */
	public void addGreenarea(Greenarea g) {
		dao.addGreenarea(g);	
	}
	/**
	 * 修改一条数据
	 */
	public void updateGreenarea(Greenarea g) {
		dao.updateGreenarea(g);
	}
	/**
	 * 删除一条数据
	 */
	public void delGreenarea(int id) {
		dao.delGreenarea(id);	
	}
	/**
	 * 根据id查询出一个对象
	 */
	public Greenarea findByIdGreenarea(int id) {
		return dao.findByIdGreenarea(id);
	}
	/**
	 * 查询出绿化和绿化负责人的所有数据
	 */
	public List<Map<String, Object>> findGreenareaAndFuzeren(String name){
		return dao.findGreenareaAndFuzeren(name);
	}
}
