package com.global.dao;

import java.util.List;
import java.util.Set;

import com.global.vo.Deliveryspot;

public interface DeliverySpotDao {
	//添加配送点
	public void addDeliverySpot(Deliveryspot deliverySpot);

	//修改配送点
	public void updateDeliverySpot(Deliveryspot deliverySpot);

	//删除配送点
	public void deleteDeliverySpot(Deliveryspot deliverySpot);

	//列出所有配送点，用户分页查询
	public List queryAllDeliverySpot(int intOffset,int munber);

	//根据配送点ID查询配送点
	public Deliveryspot queryDeliverySpotByDeliverySpotID(int deliverySpotID);

	//根据省ID查询其下所有的配送点
	public List queryDeliverySpotByProvinceID(int provinceID);
	
	//从province表中列出所有的省名称
	public List queryProvinceFromProvince();
	
	//从city表中列出相应省下的市
	public List queryCityByProvinceIDFromCity(int provinceID);
	
	//查询所有配送点的记录数
	public int countOfAllDeliveryspot();
	
	//查询配有配送点，用于下拉列表的显示
	public List queryAllDeliverySpotOfAddLine();
	
   //检验配送点是否有重名
	public boolean checkDSName(String name);
	
	public List queryAllDeliverySpotOfAddUser();

}