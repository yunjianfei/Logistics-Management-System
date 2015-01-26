package com.global.dao;

import java.util.List;

import com.global.vo.Carstate;
import com.global.vo.Line;

public interface LineDao {
	//添加线路
	public void addLine(Line line);

	//删除线路
	public void deleteLine(Line line);

	//查询所有线路，用于分页查询
	public List queryAllLine(int intOffset,int munber);
	
	//根据lineID查询线路
	public Line querylineByLineID(int lineID);

	//根据车辆状态ID查询
	public Carstate querylineByCarStateID(int carStateID);
	
	//根据lineID查询该线路所有车辆
	public List queryCarByLineID(int lineID);
	
	//从car表中查出已经配车的线路id
	public List queryLineIDFromCar();
	
	//查询所有线路记录数
	public int countOfAllLine();
	
	//查询所有已经配备了车辆的线路
	public List queryAllLineMatchingLine();
	
   public List queryCarMatchingLine(int offset,int number);
   
   public int countqueryCarMatchingLine();
   
   public List queryCarNotMatchingLine();
}