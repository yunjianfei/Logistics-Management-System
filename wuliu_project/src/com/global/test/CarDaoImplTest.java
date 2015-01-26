package com.global.test;

import java.util.List;

import com.global.dao.CarDao;
import com.global.vo.Employee;

public class CarDaoImplTest extends BaseCase {
	   CarDao cardao ;
	protected void setUp() throws Exception {
	    cardao = (CarDao) super.getBean("CarDao");
		super.setUp();
	}

	public void testQueryCarByCarID() {
		List list = cardao.listAllDriver();
		for (int i = 0; i < list.size(); i++) {
			Employee e = (Employee) list.get(i);
			System.out.println("=============="+e.getName());
		}
		
	}

}
