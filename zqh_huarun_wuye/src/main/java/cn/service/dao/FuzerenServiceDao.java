package cn.service.dao;

import java.util.List;

import cn.entity.Fuzeren;
/**
 * 绿化负责人service层接口类
 * @author 曾庆华
 * @date 2019年3月5日
 */
public interface FuzerenServiceDao {
	/**
	 * 查询出所有的数据
	 * @return
	 * List<Fuzeren>
	 */
	public List<Fuzeren> findFuzeren();
	/**
	 * 添加一条数据
	 * @param f
	 * void
	 */
	public void addFuzeren(Fuzeren f);
	/**
	 * 删除一条数据
	 * @param id
	 * void
	 */
	public void delFuzeren(int id);
	/**
	 * 根据id查询出单个对象
	 * @param id
	 * @return
	 * Fuzeren
	 */
	public Fuzeren findByIdFuzeren(int id);
	/**
	 * 修改一条数据
	 * @param f
	 * void
	 */
	public void updateFuzeren(Fuzeren f);
}
