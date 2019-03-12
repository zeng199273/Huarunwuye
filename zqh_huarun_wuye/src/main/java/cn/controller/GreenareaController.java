package cn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.entity.Greenarea;
import cn.service.dao.impl.GreenareaServiceDaoImpl;
/**
 * 绿化web层
 * @author 曾庆华
 * @date 2019年2月25日
 */
@Controller
public class GreenareaController {
	@Autowired
	private GreenareaServiceDaoImpl service ;
	
	/**
	 * 查询出绿化和绿化负责人的所有数据
	 * @param page
	 * @param limit
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping(value="/findGreenateaAndFuzeren",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findGreenareaAndFuzeren(int page,int limit,String name){
		//分页
		Page<Object> pageh = PageHelper.startPage(page, limit);
		//得到所有数据
		List<Map<String, Object>> list = service.findGreenareaAndFuzeren(name);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageh.getTotal());   //分页总条数
		map.put("data", list);   //得到所有数据
		return map ;	
	}
	/**
	 * 查询出所有的数据拼接到页面
	 * @param page
	 * @param limit
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(int page,int limit){
		//分页
		Page<Object> pageh = PageHelper.startPage(page, limit);
		
		//得到所有数据
		List<Greenarea> list = service.findAll();
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageh.getTotal());   //分页总条数
		map.put("data", list);   //得到所有数据
		return map ;	
	}
	/**
	 * 删除一条数据
	 * @param id
	 * @return
	 * String
	 */
	@RequestMapping("/delGreenarea")
	@ResponseBody
	public String delGreenarea(int id){
		service.delGreenarea(id);
		return "删除成功" ;
	}
	/**
	 * 添加一条数据
	 * @param g
	 * @return
	 * String
	 */
	@RequestMapping("/addGreenarea")
	@ResponseBody
	public String addGreenarea(Greenarea g){
		if(g!=null){
			service.addGreenarea(g);
			return "添加成功" ;
		}
		return null ;
	}
	/**
	 * 根据id得到单个对象并转发到修改的页面
	 * @param id
	 * @param map
	 * @return
	 * String
	 */
	@RequestMapping("/findByIdGreenarea")
	public String findByIdGreenarea(int id,ModelMap map){
		Greenarea greenarea = service.findByIdGreenarea(id);
		map.addAttribute("g", greenarea);
		return "/luhua/updateLuhua" ;
	}
	/**
	 * 修改数据
	 * @param g
	 * @return
	 * String
	 */
	@RequestMapping("/upGreenarea")
	@ResponseBody
	public String updateGreenarea(Greenarea g){
		service.updateGreenarea(g);
		return "修改成功" ;
	}
}
