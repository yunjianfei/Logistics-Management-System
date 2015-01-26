package com.global.test;

import java.util.List;

import com.global.dao.LineDao;

public class LineDaoImplTest extends BaseCase {
   LineDao dao ;
	protected void setUp() throws Exception {
		dao = (LineDao) super.getBean("LineDao");
		super.setUp();
	}

	protected void tearDown() throws Exception {
		super.tearDown();
	}

	public void testQueryCarMatchingLine() {
		List l = dao.queryCarMatchingLine(0, 10);
		System.out.println(l.size());
	}

}
