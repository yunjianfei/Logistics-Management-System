package com.global.dao;

import java.util.List;

import com.global.vo.Deliveryspot;
import com.global.vo.Order;


public interface CompanyDao {
	public List queryOrderSatateByOrderNO(int orderID);
	
	public Order queryOrderByOrderNO(String orderNO);
	
	public List queryAllPriceFromDeliverySpot(int offset,int number);
	
	public int queryAllPriceFromDeliverySpot();
	
	public List queryAllProvinceFromDeliverySpot();
	
	public List queryAllDeliverySpotByProvinceIDFromDeliverySpot(int provinceID);
	
	public Deliveryspot queryDeliverySpotByDeliverySpotID(int deliverySpotID);
	
	public List queryDeliverySpotByProvinceIDAndCityID(int provinceID,int cityID);
}
