package cn.service.dao;

import java.util.List;
import java.util.Map;

import cn.entity.Greenarea;

/**
 * 绿化service层接口
 * @author 曾庆华
 * @date 2019年2月25日
 */
public interface GreenareaServiceDao {
	/**
	 * 查询出绿化和绿化负责人的所有数据
	 * @return
	 * List<Map<String,Object>>
	 */
	public List<Map<String, Object>> findGreenareaAndFuzeren(String name);
	/**
	 * 查询出所有的数据
	 * @return
	 * Map<String,Object>
	 */
	public List<Greenarea> findAll();
	/**
	 * 添加一条绿化数据
	 * @param g
	 * void
	 */
	public void addGreenarea(Greenarea g);
	/**
	 * 修改一条绿化数据
	 * @param g
	 * void
	 */
	public void updateGreenarea(Greenarea g);
	/**
	 * 根据id删除一条绿化数据
	 * @param id
	 * void
	 */
	public void delGreenarea(int id);
	/**
	 * 根据id查询出一条绿化数据
	 * @param id
	 * @return
	 * Greenarea
	 */
	public Greenarea findByIdGreenarea(int id);
}
