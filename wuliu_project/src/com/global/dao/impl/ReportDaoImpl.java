package com.global.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.global.dao.ReportDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Car;
import com.global.vo.Line;
import com.global.vo.Order;

public class ReportDaoImpl extends BaseDaoImpl implements ReportDao {

	public List queryDeliverySpot(String fromTime, String toTime, int deliverySpotID) {
		 Date minDate= java.sql.Date.valueOf(fromTime);//由String型转化成java.sql.Date
         Date maxDate=java.sql.Date.valueOf(toTime);
         String hql="from Order o where o.createtime >= ? and o.createtime<= ? and o.orderstate.orderstateid = 4 and o.deliveryspot.deliveryspotid = ? order by orderid desc";
        
         Session session = HibernateSessionFactory.getSession();
         Query query=session.createQuery(hql);
        //向HQL注入参数
         query.setParameter(0, minDate);
         query.setParameter(1, maxDate);
         query.setParameter(2, deliverySpotID); 
         List list = query.list();
         HibernateSessionFactory.closeSession();
		return list;
	}

	public List queryHQ(String fromTime, String toTime) {
		Date minDate= java.sql.Date.valueOf(fromTime);//由String型转化成java.sql.Date
        Date maxDate=java.sql.Date.valueOf(toTime);
        String hql="from Order o where o.createtime >= ? and o.createtime<= ?  and o.orderstate.orderstateid = 4 order by orderid desc";
        
        Session session = HibernateSessionFactory.getSession();
        Query query=session.createQuery(hql);
       //向HQL注入参数
        query.setParameter(0, minDate);
        query.setParameter(1, maxDate);
        List list = query.list();
        HibernateSessionFactory.closeSession();
		return list;
	}

	public double queryDeliverySpotTurnover(String fromTime, String toTime, int deliverySpotID) {
		String sql =" select " +
		            " sum(totalprice) as total " +
					" from oder o  " +
					" where createtime>= to_date('"+fromTime+"','YYYY-MM-DD') " + 
					" and createtime<=to_date('"+toTime+"','YYYY-MM-DD') " +
					" and orderstateid = 4 " +
					" and deliveryspotid = " + deliverySpotID;
		Session session = HibernateSessionFactory.getSession();
		Connection conn = null;
		double total = 0;
		try {
		conn = session.connection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
		total = rs.getDouble("total");
		}
		return total;
		
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		try {
		session.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		}
		return 0;
	}

	public double queryHQTurnover(String fromTime, String toTime) {
		String sql =" select " +
					" sum(totalprice) as total " +
					" from oder o  " +
					" where createtime>= to_date('"+fromTime+"','YYYY-MM-DD') " + 
					" and createtime<=to_date('"+toTime+"','YYYY-MM-DD') " +
					" and orderstateid = 4 ";
		Session session = HibernateSessionFactory.getSession();
		Connection conn = null;
		double total = 0;
		try {
		conn = session.connection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			total = rs.getDouble("total");
		}
		return total;
		
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		try {
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
       }
		return 0;
	}

}
