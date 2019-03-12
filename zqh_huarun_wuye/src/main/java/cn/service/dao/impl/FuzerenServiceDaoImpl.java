package cn.service.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.dao.mapper.FuzerenDao;
import cn.entity.Fuzeren;
import cn.service.dao.FuzerenServiceDao;
/**
 * 绿化负责人service层接口实现类
 * @author 曾庆华
 * @date 2019年3月5日
 */
@Component
public class FuzerenServiceDaoImpl implements FuzerenServiceDao {
	@Autowired
	private FuzerenDao dao ;

	/**
	 * 实现查询出所有的数据功能
	 */
	public List<Fuzeren> findFuzeren() {
		return dao.findFuzeren();
	}

	/**
	 * 实现添加一条数据的功能
	 */
	public void addFuzeren(Fuzeren f) {
		dao.addFuzeren(f);	
	}

	/**
	 * 实现删除一条数据的功能 
	 */
	public void delFuzeren(int id) {
		dao.delFuzeren(id);
	}

	/**
	 * 实现查询单个对象的功能
	 */
	public Fuzeren findByIdFuzeren(int id) {
		return dao.findByIdFuzeren(id);
	}

	/**
	 * 实现修改一条数据的功能
	 */
	public void updateFuzeren(Fuzeren f) {
		dao.updateFuzeren(f);
	}
}
