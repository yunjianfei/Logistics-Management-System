package com.global.dao;

import java.util.List;

public interface ReportDao {
	//查询总部的报表
	public List queryHQ(String fromTime,String toTime);
	
    // 查询总部的总营业额
	public double queryHQTurnover(String fromTime,String toTime);

    //查询配送点的报表
	public List queryDeliverySpot(String fromTime,String toTime,int deliverySpotID);
	
   //查询配送点的总营业额
	public double queryDeliverySpotTurnover(String fromTime,String toTime,int deliverySpotID);

}
