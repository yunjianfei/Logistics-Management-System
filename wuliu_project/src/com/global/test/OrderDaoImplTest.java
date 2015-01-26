package com.global.test;


import com.global.dao.OrderDao;
import com.global.vo.Order;

public class OrderDaoImplTest extends BaseCase {
	OrderDao dao;
	protected void setUp() throws Exception {
		dao = (OrderDao) super.getBean("OrderDao");
	}

	protected void tearDown() throws Exception {
		super.tearDown();
	}

	/*public void testAddOrder() {
	}

	public void testDeleteOrder() {
	}

	public void testQueryAllOrder() {
	}

	public void testQueryOrderByCreateTime() {
	}

	public void testQueryOrderByDeliverySpotID() {
	}*/

	public void testQueryOrderByOrderID() {
		
            System.out.println("123");
            
		Order order = dao.queryOrderByOrderID(new Integer(10));
		System.out.println(order.getOrderid());
		
		
	}
	/*
	public void testQueryOrderByOrderNO() {
	}

	public void testQueryOrderByOrderStateID() {
	}

	public void testQueryOrderStateFromOrderState() {
	}

	public void testUpdateOrder() {
	}*/

}
