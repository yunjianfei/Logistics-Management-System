package com.global.dao;

import java.util.List;

import com.global.vo.Linedetaile;

public interface LineDetaileDao {
	//添加线路详细信息
	public void addLineDetaile(Linedetaile lineDetaile);

	//删除线路详细信息
	public void deleteLineDetaile(Linedetaile lineDetaile);
	
	//根据LineID查询该条线路上的详细信息
	public List queryLineDetaileByLineID(int lineID);
}