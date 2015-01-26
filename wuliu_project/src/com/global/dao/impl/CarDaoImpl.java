package com.global.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.springframework.jdbc.core.JdbcTemplate;
import java.sql.*;

import com.global.dao.CarDao;
import com.global.db.HibernateSessionFactory;
import com.global.util.ConnectionUtil;
import com.global.vo.Car;

public class CarDaoImpl extends BaseDaoImpl implements CarDao{

	
	public void addCar(Car car) {
        super.save(car);		
	}

	public void deleteCar(Car car) {
		super.delete(car);
	}

	public List queryAllCar() {
		String hql = "from Car";
		return super.list(hql);
	}

	public Car queryCarByCarID(int carID) {
		return (Car) super.get(Car.class, new Integer(carID));
	}

	public List queryCarByCarNO(String carNO) {
		String hql = "from Car where carNo='"+carNO+"'";
	    return  super.list(hql);
	}

	public List queryCarByCarStateID(int carStateID) {
		String hql = " from Car where carstateid =" + carStateID +"order by carid desc";
		return super.list(hql);
	}

	public List queryCarByCarTypeID(int carTypeID) {
		// TODO Auto-generated method stub
		return null;
	}

	public Car queryCarByEmpID(int empID) {
		// TODO Auto-generated method stub
		return null;
	}

	public List queryCarByWorkNO(String workNO) {
		String hql = "from Car where workNO='"+workNO+"'";
		return  super.list(hql);
	}

	public List queryCarStateFromCarState() {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateCar(Car car) {
		super.update(car);
		
	}

	public List listAllDeliveryspot() {
		String hql = "from Deliveryspot";
		return super.list(hql);
	}

	public List listAllDriver() {
		String hql = "select distinct e from Employee as e,Car as c where e.position.positionid=4 and e.flag=0 and e.empid != c.employee.empid ";
		return super.list(hql);
	}

	public void update(Integer carid,Integer carstateid) {
        String sql = "update car set carstateid="+carstateid+" where carid="+carid;
        ConnectionUtil util = new ConnectionUtil();
		Connection conn = util.getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean checkCarNO(String carNO) {
		String hql = "from Car where carNO='"+carNO+"'";
		List list = super.list(hql);
		if(list.size()>0){
			return false;
		}else{
			return true;
		}
	}

	public boolean checkWorkNO(String workNO) {
		String hql = "from Car where workNO='"+workNO+"'";
		List list = super.list(hql);
		if(list.size()>0){
			return false;
		}else{
			return true;
		}
	}

	public List queryCarByCarStateID2(int carStateID, int intOffset, int munber) {
		String hql = " from Car where carstateid =" + carStateID +" order by carid desc";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(intOffset).setMaxResults(munber).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public int countqueryCarByCarStateID2(int carStateID) {
		String hql = " from Car where carstateid =" + carStateID +" order by carid desc";
		return super.list(hql).size();
	}

}