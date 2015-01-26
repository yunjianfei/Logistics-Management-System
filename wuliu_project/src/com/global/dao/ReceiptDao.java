package com.global.dao;

import java.util.List;
import java.util.Set;

import com.global.vo.Receipt;

public interface ReceiptDao {
	//添加交接单
	public void addReceipt(Receipt receipt);

	//删除交接单
	public void deleteReceipt(Receipt receipt);

	//查询所有交接单
	public List queryAllReceipt();
	
	//根据ID查询交接单
	public Receipt queryReceiptByReceiptID(int receiptID);
	
	//根据配送点ID查询其下的所有交接单
	public Set queryReceiptByDeliverySpotID(int deliverySpotID);
	
	//根据配送点ID查询其下的所有交接单（分页）
	public List queryReceiptByDeliverySpotID2(int deliverySpotID,int intOffset,int munber);
	
	//获取配送点下所有交接单数目(分页)
	public int countAllReceiptByDeliverySpotID(int deliverySpotID);
	
	//	根据配送点ID查询其下的所有投递单（分页）
	public List queryTouDiDanByDeliverySpotID(int deliverySpotID,int intOffset,int munber);
	
	//获取配送点下所有投递单数目(分页)
	public int countAllTouDiDanByDeliverySpotID(int deliverySpotID);
	
	//根据车牌号查询交接单
	public List queryReceiptByCarNO(String carNO);
	
	//通过交接单号查询交接单
	public Receipt queryReceiptByReceiptNo(String receiptNo);
	
	//	通过投递单号查询交接单
	public Receipt queryReceiptByReceiptNo2(String receiptNo);
	
	//获取投递员列表或者接收员列表
	public List queryEmployeeByDIDandPosition(int dsID,int positionID);
	
	//通过carNo查询该车是否存在
	public boolean checkCarNo(String carNo);
	
//	通过orderNo查询该订单是否存在
	public boolean checkOrderNo(String orderNo);
	
	//进行交接时，更改车辆的状态为途中
	public void updateCarState(String carNo);
 	
}