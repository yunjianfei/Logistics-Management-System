package com.global.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import com.global.dao.ReceiptDetaileDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Receipt;
import com.global.vo.Receiptdetaile;

public class ReceiptDetaileDaoImpl extends BaseDaoImpl implements ReceiptDetaileDao {

	public void addReceiptDetaile(Receiptdetaile receiptDetaile) {
		// TODO Auto-generated method stub

	}

	public void deleteReceiptDetaile(Receiptdetaile receiptDetaile) {
		// TODO Auto-generated method stub

	}

	public Set queryReceiptDetaileByReceiptID(int receiptID) {
		Receipt r = (Receipt) super.get(Receipt.class, new Integer(receiptID));
		
		return r.getReceiptdetailes();
	}

	public int countReceiptDetaileByReceiptID(int receiptID) {
		Receipt r = (Receipt) super.get(Receipt.class, new Integer(receiptID));
		Set s = r.getReceiptdetailes();
		return s.size();
	}

	public List queryReceiptDetaileByReceiptID2(int receiptID, int intOffset, int munber) {
		//int end = intOffset + munber;
		String hql = " from Receiptdetaile r where r.receipt.receiptid= " + receiptID +" order by r.rdid desc";
		Session session = HibernateSessionFactory.getSession(); 
		List list = session.createQuery(hql).setFirstResult(intOffset).setMaxResults(munber).list();
		HibernateSessionFactory.closeSession();
		return list;
	}



}
