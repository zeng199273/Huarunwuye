package cn;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import cn.dao.mapper.AttendanceDao;
import cn.dao.mapper.GreenareaDao;
import cn.entity.Attendance;
import cn.service.dao.impl.GreenareaServiceDaoImpl;


@SpringBootApplication  //声明是一个springboot的应用
@MapperScan({"cn.dao"})  //扫描接口映射
public class HuaRun_LuHua {
	public static void main(String[] args) {
		ConfigurableApplicationContext context = 
				SpringApplication.run(HuaRun_LuHua.class, args);
		AttendanceDao impl = 
				context.getBean("attendanceDao", AttendanceDao.class);
		
	}
}
