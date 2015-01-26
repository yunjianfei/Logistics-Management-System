package com.global.dao;

import java.util.List;

import com.global.vo.User;

public interface UserDao {
	//添加用户
	public void addUser(User user);
	
	//修改用户
	public void updateUser(User user);

	//删除用户
	public void deleteUser(User user);
	
	//登陆
	public User login(String username,String password,int powerID);

	//查询所有用户
	public List queryAllUser();
	
	//根据用户ID查询用户
	public User queryUserByUserID(int userID);

	//根据员工ID查询用户
	public User queryuserByEmpID(int empID);

	//根据权限ID查询用户
	public List queryUserByPowerID(int powerID);
	
	//根据配送点ID查询用户
	public List queryUserByDeliverySpotID(int deliverySpotID);

	//根据配送点ID查询用户，分页显示
	public List queryUserByDeliverySpotID2(int deliverySpotID,int offset,int number);
	
   //根据配送点ID查询用户的记录数
	public int countqueryUserByDeliverySpotID2(int deliverySpotID);
	
	//从Power表中查询所有权限
	public List queryPowerFromPower();
	
	public List queryUserByDeliveryspotidFromUser(int deliveryspotid);
	
	public boolean checkUsername(String username);

}
