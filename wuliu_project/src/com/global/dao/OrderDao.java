package com.global.dao;

import java.util.List;

import com.global.vo.Order;


public interface OrderDao {
	//填写订单
	public void addOrder(Order order);
	
    //用Jdbc方式添加数据
	public void saveByJdbc(String sql);
	
	//修改订单信息
	public void updateOrder(Order order);
	
	//删除订单
	public void deleteOrder(Order order);

	//查询所有订单
	public List queryAllOrder();

	//根据orderID查询订单
	public Order queryOrderByOrderID(int orderID);

	//根据订单号查询订单
	public Order queryOrderByOrderNO(String orderNO);

	//查询某段时间的订单
	public List queryOrderByCreateTime(String fromCreateTime,
			String ToCreateTime,int offset,int number);
	
    //查询某段时间的订单总的记录数量*/
	public int countqueryOrderByCreateTime(String fromCreateTime,
			String ToCreateTime);

	//根基订单状态查询订单
	public List queryOrderByOrderStateID(int orderStateID,int offset,int number);
	
	/*计算订单状态查询总的记录数量*/
	public int countqueryOrderByOrderStateID(int orderStateID);
	
	//根据配送点ID查询其下的所有订单
	public List queryOrderByDeliverySpotID(int deliverySpotID,int offset,int number);
	
	//从orderstate表中列出所有订单状态
	public List queryOrderStateFromOrderState();
	
//	根据配送点ID查询其下的所有订单
	public List queryOrderByDeliverySpotID(int deliverySpotID);
	
	
	public int countqueryOrderByDeliverySpotID(int deliverySpotID);
	
}
