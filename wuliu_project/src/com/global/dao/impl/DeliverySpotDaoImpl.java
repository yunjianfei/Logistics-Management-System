package com.global.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.global.dao.DeliverySpotDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Deliveryspot;
import com.global.vo.Province;



public class DeliverySpotDaoImpl extends BaseDaoImpl implements DeliverySpotDao{

	public void addDeliverySpot(Deliveryspot deliverySpot) {
		super.save(deliverySpot);
		
	}

	public void deleteDeliverySpot(Deliveryspot deliverySpot) {
		super.delete(deliverySpot);
		
	}

	public List queryAllDeliverySpotOfAddLine() {
		String hql = " from Deliveryspot where flag=0 order by deliveryspotid asc ";
		return super.list(hql);
	}
	
	public List queryAllDeliverySpotOfAddUser() {
		String hql = "select distinct ds from Deliveryspot as ds,Employee as e  where ds.flag=0 and  e.deliveryspot.deliveryspotid = ds.deliveryspotid order by ds.deliveryspotid asc";
		return super.list(hql);
	}
	
	
	public List queryAllDeliverySpot(int intOffset,int munber) {
		String hql = " from Deliveryspot where flag=0 order by deliveryspotid desc";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(intOffset).setMaxResults(munber).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public List queryCityByProvinceIDFromCity(int provinceID) {
		/*Province p = (Province) super.get(Province.class, new Integer(provinceID));
		
		Set cities = p.getCities();*/
		String hql = "from City as c where c.province.provinceid = "+ provinceID;
		return super.list(hql);
	}

	public Deliveryspot queryDeliverySpotByDeliverySpotID(int deliverySpotID) {
		
		return (Deliveryspot) super.get(Deliveryspot.class, new Integer(deliverySpotID));
	}

	public List queryDeliverySpotByProvinceID(int provinceID) {
		
		Session session = super.getSession();
		String hql = "from Deliveryspot as ds where ds.province.provinceid = ?  and ds.flag=0 order by deliveryspotid asc";
		
		try {
			Query q = session.createQuery(hql);
			q.setInteger(0, new Integer(provinceID));
			
			return q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}

	public List queryProvinceFromProvince() {
		
		//System.out.println("---------queryProvinceFromProvince");
		String hql = "from Province order by provinceid asc";
		return super.list(hql);
	}

	public void updateDeliverySpot(Deliveryspot deliverySpot) {
		super.update(deliverySpot);
		
	}

	public int countOfAllDeliveryspot() {
		String hql =" from Deliveryspot as ds  where ds.flag=0 ";
		List list = super.list(hql);
		return list.size();
	}

	public boolean checkDSName(String name) {
		String hql = "from Deliveryspot as ds  where ds.name ='" + name +"'";
		List list = super.list(hql);
		if(list.size()>0){
			return true;
		}
		else{
			return false;
		}
		
	}

}
