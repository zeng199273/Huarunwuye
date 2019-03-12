package cn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.entity.Fuzeren;
import cn.service.dao.impl.FuzerenServiceDaoImpl;
/**
 * 绿化负责人web层
 * @author 曾庆华
 * @date 2019年3月5日
 */

@Controller
public class FuzerenController {
	@Autowired
	private FuzerenServiceDaoImpl service ;
	/**
	 * 查询出所有的数据
	 * @param page
	 * @param limit
	 * @return
	 * Map<String,Object>
	 */
	@RequestMapping("/findFuzeren")
	@ResponseBody
	public Map<String, Object> findFuzeren(int page,int limit){
		//分页
		Page<Object> pages = PageHelper.startPage(page, limit);
		//得到数据
		List<Fuzeren> list = service.findFuzeren();
		//创建map集合
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pages.getTotal());  //分页总条数
		map.put("data", list);   //数据
		return map ;
	}
	/**
	 * 添加一条数据
	 * @param f
	 * @return
	 * String
	 */
	@RequestMapping("/addFuzeren")
	@ResponseBody
	public String addFuzeren(Fuzeren f){
		if(f!=null){
			service.addFuzeren(f);
			return "添加成功" ;
		}
		return null ;
	}
	/**
	 * 删除一条数据
	 * @param id
	 * @return
	 * String
	 */
	@RequestMapping("/delFuzeren")
	@ResponseBody
	public String delFuzeren(int id){
		service.delFuzeren(id);
		return "success" ;
	}
	/**
	 * 根据id查询出单个对象
	 * @param id
	 * @param map
	 * @return
	 * String
	 */
	@RequestMapping("/findByIdFuzeren")
	public String findByIdFuzeren(int id,ModelMap map){
		//得到数据
		Fuzeren fuzeren = service.findByIdFuzeren(id);
		//存入请求域中
		map.addAttribute("fuzeren", fuzeren);
		return "/luhua/updateFuzeren" ;
	}
	/**
	 * 修改一条数据
	 * @param f
	 * @return
	 * String
	 */
	@RequestMapping("/upFuzeren")
	@ResponseBody
	public String upFuzeren(Fuzeren f){
		if(f !=null){
			service.updateFuzeren(f);
			return "修改成功";
		}
		return null ;
	}
}
