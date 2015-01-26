package com.global.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.global.dao.BaseDao;

import junit.framework.TestCase;

public class BaseDaoImplTest extends BaseCase {
	   BaseDao dao ;
		protected void setUp() throws Exception {
			dao = (BaseDao) super.getBean("BaseDao");
			super.setUp();
		}
/*	public void testGetCurrentDateFromDB() {
		System.out.println("DB====="+ dao.getCurrentDateFromDB());
	}

	public void testGetCurrentTimeFromDB() {
		Date d = new Date();
        d.getTime();
		System.out.println("Time====="+ dao.getCurrentTimeFromDB());
	}*/

	public void testGetCurrentTimeFromDB() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date d = null;
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			d = df.parse(dao.getCurrentTimeFromDB());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("DB2====="+ dao.getCurrentTimeFromDB());
	}

}
