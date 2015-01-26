package com.global.test;

import java.util.List;

import junit.framework.TestCase;

import com.global.dao.EmployeeDao;

public class EmployeeDaoImplTest extends BaseCase {
    EmployeeDao dao;
	protected void setUp() throws Exception {
		dao = (EmployeeDao) super.getBean("EmployeeDao");
		super.setUp();
	}

	protected void tearDown() throws Exception {
		super.tearDown();
	}

	public void testQueryEmployeeByDeliverySpotID3() {
		List l = dao.queryNotManagerEmployeeByDeliverySpotID(201);
		System.out.println(l.size());
	}

	/*public void testQueryNotManagerEmployeeByDeliverySpotID() {
		fail("Not yet implemented");
	}
*/
}
