package com.global.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.global.dao.EmployeeDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Employee;

public class EmployeeDaoImpl extends BaseDaoImpl implements EmployeeDao {
   //添加员工
	public void addEmployee(Employee emp) {
		super.save(emp);

	}

	public List queryAllEmployee() {
		// TODO Auto-generated method stub
		return null;
	}

	public Employee queryByEmpID(int empID) {
		// TODO Auto-generated method stub
		return null;
	}
        //通过员工编号查询员工信息
	public List queryByEmpNO(String empNO) {
		String hql = "from Employee as e where e.empno='"+empNO+"' and e.flag="+0;
		return super.list(hql);
	}
        //通过配送点ID查询员工
	public List queryEmployeeByDeliverySpotID(int deliverySpotID) {
		String hql = "from Employee as e where e.deliveryspot.deliveryspotid="+deliverySpotID +" and e.flag="+0 + " order by e.empid desc";
		return  super.list(hql);
	}

	public List queryEmployeeByPositionID(int positionID) {
		return null;
		
	}
  //修改员工信息，在删除员工时，实际执行的是修改操作，把employee表中的flag改为1，表示该员工已经离职
	public void updateEmployee(Employee emp) {
		super.update(emp);

	}
	//从数据库获取职位列表
	public List listPosition() {
		String hql = " from Position ";
		return super.list(hql);
	}
      //	从数据库获取配送点列表
	public List listDeliverySpot() {
		String hql = " from Deliveryspot where flag=0";
		return super.list(hql);
	}
      //	验证员工编号是否重复
	public boolean check(String empNO) {
		 String hql = "from Employee as e where e.empno='"+empNO +"'";
		List list = super.list(hql);
		 if(list.size()>0)
		 {
			 return true;
		 }
		return false;
	}

	public List queryByEmpNOList(String empNo) {
		String hql = "from Employee as e where e.empno='"+empNo+"' and e.flag=0" + " order by e.empid desc";
		return  super.list(hql);
	}

	public int countAllEmp() {
		String hql = "from Employee";
		List l = super.list(hql);
		return l.size();
	}

	public List queryEmployeeByDeliverySpotID2(int deliverySpotID, int offset, int number) {
		String hql = "from Employee as e where e.deliveryspot.deliveryspotid="+deliverySpotID +" and e.flag="+0 + " order by e.empid desc";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(offset).setMaxResults(number).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public int countqueryEmployeeByDeliverySpotID2(int deliverySpotID) {
		String hql = "from Employee as e where e.deliveryspot.deliveryspotid="+deliverySpotID +" and e.flag="+0 + " order by e.empid desc";
		return  super.list(hql).size();
	}

	public List queryEmployeeByDeliverySpotID3(int deliverySpotID) {
		String hql = "from Employee as e where e.deliveryspot.deliveryspotid="+deliverySpotID +" and e.flag="+0 + " and e.position.positionid=1 order by e.empid desc";
		return  super.list(hql);
	}

	public List queryNotManagerEmployeeByDeliverySpotID(int deliverySpotID) {
		String hql = "from Employee as e where e.deliveryspot.deliveryspotid="+deliverySpotID +" and e.flag="+0 + " and e.position.positionid =3 order by e.empid desc";
		return  super.list(hql);
	}
}
