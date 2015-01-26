package com.global.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.global.dao.CompanyDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Deliveryspot;
import com.global.vo.Order;
import com.global.vo.Receipt;

public class CompanyDaoImpl extends BaseDaoImpl implements CompanyDao {

	public List queryOrderSatateByOrderNO(int orderID) {
		
		Session session = super.getSession();
		String hql = "from Receiptdetaile where oder.orderid= ? order by rdid asc";
		
		try {
			Query q = session.createQuery(hql);
			q.setInteger(0, new Integer(orderID));
			return q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	public Order queryOrderByOrderNO(String orderNO) {
		String hql = "from Order as o where o.orderno = '" + orderNO + "'";
		List l = super.list(hql);
		if(l.size() > 0){
			return (Order)l.get(0);
		}
		return null;
	}

	public List queryAllPriceFromDeliverySpot(int offset,int number) {
		String hql = " from Deliveryspot where flag=0 ";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(offset).setMaxResults(number).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public List queryAllProvinceFromDeliverySpot() {
		Session session = super.getSession();
		String hql = "from Deliveryspot as ds where ds.flag=0 and ds.province.provinceid is not null";
		
		try {
			Query q = session.createQuery(hql);
			return q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}

	public List queryAllDeliverySpotByProvinceIDFromDeliverySpot(int provinceID) {
		String hql = "from Deliveryspot as ds where ds.flag=0 and ds.province.provinceid = " + provinceID;
		return super.list(hql);
	}

	public Deliveryspot queryDeliverySpotByDeliverySpotID(int deliverySpotID) {
		return (Deliveryspot) super.get(Deliveryspot.class, new Integer(deliverySpotID));
	}

	public List queryDeliverySpotByProvinceIDAndCityID(int provinceID, int cityID) {
		String hql = "from Deliveryspot as ds where ds.flag=0 and ds.province.provinceid = " + provinceID + " and ds.city.cityid =" + cityID;
		return super.list(hql);
	}

	public int queryAllPriceFromDeliverySpot() {
		String hql = " from Deliveryspot where flag=0 ";
		return super.list(hql).size();
	}
}
