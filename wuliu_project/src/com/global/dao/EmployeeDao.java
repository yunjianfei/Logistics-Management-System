package com.global.dao;

import java.util.List;

import com.global.vo.Employee;

public interface EmployeeDao {
	//添加员工
	public void addEmployee(Employee emp);
	
    //用Jdbc方式添加数据
	public void saveByJdbc(String sql);

	//修改员工信息，在删除员工时，实际执行的是修改操作，把employee表中的flag改为1，表示该员工已经离职
	public void updateEmployee(Employee emp);

	//查询所有员工
	public List queryAllEmployee();

	//根据empID查询员工
	public Employee queryByEmpID(int empID);
	
	//根据员工编号查询
	public List queryByEmpNO(String empno);
	
	//根据员工职位查询
	public List queryEmployeeByPositionID(int positionID);

	//根据配送点ID查询其下的所有员工
	public List queryEmployeeByDeliverySpotID(int deliverySpotID);
	
   //根据配送点ID查询其下的所有员工
	public List queryEmployeeByDeliverySpotID3(int deliverySpotID);
	
	   //根据配送点ID查询其下的所有员工
	public List queryNotManagerEmployeeByDeliverySpotID(int deliverySpotID);
	
   //根据配送点ID查询其下的所有员工，分页显示
	public List queryEmployeeByDeliverySpotID2(int deliverySpotID,int offset,int number);
	
  //根据配送点ID查询其下的所有员工的记录数
	public int countqueryEmployeeByDeliverySpotID2(int deliverySpotID);
	
	//从数据库取出职位列表
	public List listPosition();
	
	//从数据库取出配送点列表
	public List listDeliverySpot();
	
	//验证员工编号是否重复
	public boolean check(String empNO);
	
   //根据员工编号查询 得到list
	public List queryByEmpNOList(String empNo);
	
	//获取所有员工的数目（包括离职的，即删除掉的员工）
	public int countAllEmp();
}
