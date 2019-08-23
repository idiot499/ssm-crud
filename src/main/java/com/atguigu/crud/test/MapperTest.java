package com.atguigu.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;

/**
 * 测试Dao层的方法
 * @author user
 * 推荐Spring的项目使用Spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest包
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3.@runwith
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	//测试DepartmentMapper
	@Test
	public void testCRUD(){
		//1.根据配置文件创建SpringIOC容器
		//ApplsicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
		//2.从容器中获取mapper
		//DepartmentMapper bean= ioc.getBean(DepartmentMapper.class)
		
		//1.插入几个部门
		departmentMapper.insertSelective(new Department(null,"test"));
		departmentMapper.insertSelective(new Department(null,"develop"));
		//2.插入几个员工
	//	employeeMapper.insertSelective(new Employee(null,"Lily","m","703287@qq.com",1));
	//	employeeMapper.insertSelective(new Employee(6,"monily","w","703287@qq.com",2));
		//3.批量添加多个员工，使用执行批量操作的sqlSession
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<100;i++) {
			String uid=UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Employee(null,uid,"m",uid+"atguigu.com",1));
		}
		System.out.println("批量完成");
	}
}
