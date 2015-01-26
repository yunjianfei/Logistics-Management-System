package com.global.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.global.dao.OrderDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Deliveryspot;
import com.global.vo.Order;
import com.global.vo.Orderstate;

public class OrderDaoImpl extends BaseDaoImpl implements OrderDao {

	public void addOrder(Order order) {
		super.save(order);

	}

	public void deleteOrder(Order order) {
		super.delete(order);

	}

	public List queryAllOrder() {
		String hql = "from Order";
		return super.list(hql);

	}

	public List queryOrderByCreateTime(String fromCreateTime,
			String ToCreateTime,int offset,int number) {
		 Date minDate= java.sql.Date.valueOf(fromCreateTime);//由String型转化成java.sql.Date
         Date maxDate=java.sql.Date.valueOf(ToCreateTime);
         String hql="from Order o where o.createtime >= ? and o.createtime<= ? order by orderid desc";
        
         Session session = HibernateSessionFactory.getSession();
         Query query=session.createQuery(hql);
        //向HQL注入参数
         query.setParameter(0, minDate);
         query.setParameter(1, maxDate);

        List list = query.setFirstResult(offset).setMaxResults(number).list();
 		HibernateSessionFactory.closeSession();
         
 		return list;
         
	}
	
	/*public List queryOrderByCreateTime(String fromCreateTime,
			String ToCreateTime,int offset,int number) {
		int end = offset + number;
		String sql =" select * from " +
				"(select a.* ,rownum rc from" +
				"(select * from oder order by orderid desc) " +
				"a where rownum < "+ end +") b where rc >="+offset+" and"+
				" createtime>= to_date('" + fromCreateTime
				+ "','YYYY-MM-DD') " + " and createtime<=to_date('"
				+ ToCreateTime + "','YYYY-MM-DD') ";

				
		Session session = HibernateSessionFactory.getSession();
		Connection conn = null;
		List list = new ArrayList();
		try {
			conn = session.connection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Order order = new Order();
				order.setOrderid(rs.getInt("orderid"));
				order.setOrderno(rs.getString("orderno"));
				order.setReceiveaddress(rs.getString("receiveaddress"));
				order.setSendaddress(rs.getString("sendaddress"));
				order.setReceivename(rs.getString("receivename"));
				order.setSendname(rs.getString("sendname"));
				Deliveryspot deliveryspot = (Deliveryspot) super.get(
						Deliveryspot.class, new Integer(rs
								.getInt("deliveryspotid")));
				order.setDeliveryspot(deliveryspot);
				Orderstate orderstate = (Orderstate) super.get(
						Orderstate.class,
						new Integer(rs.getInt("Orderstateid")));
				order.setOrderstate(orderstate);
				order.setCreatetime(rs.getDate("createtime"));
				list.add(order);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}*/

	public List queryOrderByDeliverySpotID(int deliverySpotID,int offset,int number) {
		String hql="from Order as o where o.deliveryspot.deliveryspotid=" +  deliverySpotID + " order by o.orderid desc";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(offset).setMaxResults(number).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public Order queryOrderByOrderID(int orderID) {

		return (Order) super.get(Order.class, orderID);
	}

	public Order queryOrderByOrderNO(String orderNO) {
		String hql = "from Order where orderno='" + orderNO + "'";

		List list = super.list(hql);
		if (list.size() > 0) {
			return (Order) list.get(0);
		} else {
			return null;
		}
	}

	public List queryOrderByOrderStateID(int orderStateID,int offset,int number) {
		
		String hql = "from Order as o where o.orderstate.orderstateid = "+ orderStateID + " order by o.orderid desc";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(offset).setMaxResults(number).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public List queryOrderStateFromOrderState() {
		String hql = "from Orderstate";
		List list = super.list(hql);
		return list;
	}

	public void updateOrder(Order order) {
		// TODO Auto-generated method stub

	}

	public List queryDeliveryspotFromDeliveryspot() {
		String hql = "from DeliverySpot where flag=0";
		List list = super.list(hql);
		return list;
	}

	public int countqueryOrderByOrderStateID(int orderStateID) {
		String hql = "from Order as o where o.orderstate.orderstateid = "+ orderStateID;
		return super.list(hql).size();
	}
	
	public int countqueryOrderByDeliverySpotID(int deliverySpotID) {
		String hql="from Order as o where o.deliveryspot.deliveryspotid=" +  deliverySpotID;
		return super.list(hql).size();
	}

	public int countqueryOrderByCreateTime(String fromCreateTime, String ToCreateTime) {
		
		 Date minDate= java.sql.Date.valueOf(fromCreateTime);//由String型转化成java.sql.Date
         Date maxDate=java.sql.Date.valueOf(ToCreateTime);
         String hql="from Order o where o.createtime >= ?  and o.createtime<=  ?  order by orderid desc";
         
         Session session = HibernateSessionFactory.getSession();
         Query query=session.createQuery(hql);
        //向HQL注入参数
         query.setParameter(0, minDate);
         query.setParameter(1, maxDate);
         List list = query.list();
         HibernateSessionFactory.closeSession();
         return list.size();
	}
	
	public List queryOrderByDeliverySpotID(int deliverySpotID) {
		String hql="from Order as o where o.deliveryspot.deliveryspotid=" +  deliverySpotID;
       return super.list(hql);
	}

}
