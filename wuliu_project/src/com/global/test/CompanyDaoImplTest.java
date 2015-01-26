package com.global.test;

import java.util.List;

import com.global.dao.CompanyDao;
import com.global.vo.Deliveryspot;

public class CompanyDaoImplTest extends BaseCase {
    CompanyDao dao;
	protected void setUp() throws Exception {
		dao = (CompanyDao) super.getBean("CompanyDao");
		super.setUp();
	}

	protected void tearDown() throws Exception {
		super.tearDown();
	}

	public void testQueryAllProvinceFromDeliverySpot() {
		List list = dao.queryAllDeliverySpotByProvinceIDFromDeliverySpot(1);
		for (int i = 0; i < list.size(); i++) {
			Deliveryspot ds = (Deliveryspot) list.get(i);
			System.out.println(ds.getProvince().getProvinceid());
		}
	}

}
