package com.global.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import com.global.dao.ReceiptDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Deliveryspot;
import com.global.vo.Receipt;

public class ReceiptDaoImpl extends BaseDaoImpl implements ReceiptDao {

	public void addReceipt(Receipt receipt) {
		// TODO Auto-generated method stub

	}

	public void deleteReceipt(Receipt receipt) {
		// TODO Auto-generated method stub

	}

	public List queryAllReceipt() {
		// TODO Auto-generated method stub
		return null;
	}
	public List queryReceiptByCarNO(String carNO) {
		// TODO Auto-generated method stub
		return null;
	}

	public Set queryReceiptByDeliverySpotID(int deliverySpotID) {
		Deliveryspot ds = (Deliveryspot) super.get(Deliveryspot.class, new Integer(deliverySpotID));
		Set s = ds.getReceipts();
		
		return s;
	}

	public Receipt queryReceiptByReceiptID(int receiptID) {
		// TODO Auto-generated method stub
		return null;
	}

	public Receipt queryReceiptByReceiptNo(String receiptNo) {
		String hql = "from Receipt where receiptno='" + receiptNo + "' and flag=0 ";

		List list = super.list(hql);
		if (list.size() > 0) {
			return (Receipt) list.get(0);
		} else {
			return null;
		}
	}

	public int countAllReceiptByDeliverySpotID(int deliverySpotID) {
		/*Deliveryspot ds = (Deliveryspot) super.get(Deliveryspot.class, new Integer(deliverySpotID));
		Set s = ds.getReceipts();
		return s.size();*/
		String hql = " from Receipt r where r.deliveryspot.deliveryspotid= " + deliverySpotID +" and r.flag=0 order by r.receiptid desc";
		return super.list(hql).size();
	}

	public List queryReceiptByDeliverySpotID2(int deliverySpotID, int intOffset, int munber) {
		int end = intOffset + munber;
		String hql = " from Receipt r where r.deliveryspot.deliveryspotid= " + deliverySpotID +" and r.flag=0 order by r.receiptid desc";
		Session session = HibernateSessionFactory.getSession(); 
		List list = session.createQuery(hql).setFirstResult(intOffset).setMaxResults(munber).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public List queryEmployeeByDIDandPosition(int dsID, int positionID) {
		String hql = "from Employee e where e.position.positionid=" + positionID + " and e.deliveryspot.deliveryspotid=" + dsID;
		
		return super.list(hql);
	}

	public int countAllTouDiDanByDeliverySpotID(int deliverySpotID) {
		String hql = " from Receipt r where r.deliveryspot.deliveryspotid= " + deliverySpotID +" and r.flag=1 order by r.receiptid desc";
		return super.list(hql).size();
	}

	public List queryTouDiDanByDeliverySpotID(int deliverySpotID, int intOffset, int munber) {
		int end = intOffset + munber;
		String hql = " from Receipt r where r.deliveryspot.deliveryspotid= " + deliverySpotID +" and r.flag=1 order by r.receiptid desc";
		Session session = HibernateSessionFactory.getSession(); 
		List list = session.createQuery(hql).setFirstResult(intOffset).setMaxResults(munber).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public boolean checkCarNo(String carNo) {
		String hql = "from Car where carno='" + carNo +"'";
		List l = super.list(hql);
		if(l.size() > 0){
			return true;
		} else{
			return false;
		}
	}

	public boolean checkOrderNo(String orderNo) {
		String hql = "from Order where orderno='" + orderNo +"'";
		List l = super.list(hql);
		if(l.size() > 0){
			return true;
		} else{
			return false;
		}
	}

	public Receipt queryReceiptByReceiptNo2(String receiptNo) {
		String hql = "from Receipt where receiptno='" + receiptNo + "' and flag=1 ";

		List list = super.list(hql);
		if (list.size() > 0) {
			return (Receipt) list.get(0);
		} else {
			return null;
		}
	}

	public void updateCarState(String carNo) {
		String sql = "update car set carStateID=2 where carno = '" + carNo + "'";
		Session session = this.getSession();
		Connection conn = null;
		try {
			conn = session.connection();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}



	

}
