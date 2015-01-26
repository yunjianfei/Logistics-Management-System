package com.global.dao;

import java.util.List;

import com.global.vo.Car;

public interface CarDao {
	 //添加车辆
	public void addCar(Car car);
	
    //修改车辆
	public void updateCar(Car car);
	
    //删除车辆
	public void deleteCar(Car car);
	
    //列出所有车辆
	public List queryAllCar();
	
	//根据carID查询车辆
	public Car queryCarByCarID(int carID);
	
	//根据车牌号查询车辆
	public List queryCarByCarNO(String carNO);

	//根据车辆运营证号查询车辆
	public List queryCarByWorkNO(String workNO);
	
	//根据司机编号查询车辆
	public Car queryCarByEmpID(int empID);
	
	//根据车辆类型查询车辆
	public List queryCarByCarTypeID(int carTypeID);

	//根据车辆状态查询车辆
	public List queryCarByCarStateID(int carStateID);
	
   //根据车辆状态查询车辆
	public List queryCarByCarStateID2(int carStateID,int intOffset,int munber);
	
    //根据车辆状态查询车辆的记录数
	public int countqueryCarByCarStateID2(int carStateID);
	
	//从carstate表中列出车辆状态
	public List queryCarStateFromCarState();
	
	//列出所有配送点名称
	public List listAllDeliveryspot();
	
	//列出所有司机
	public List listAllDriver();
	
	//更新汽车状态
	public void update(Integer carid,Integer carstateid);
	
	//验证车牌号是否重复
	public boolean checkCarNO(String carNO);
	
	//验证运营证号是否重复
	public boolean checkWorkNO(String workNO);
}