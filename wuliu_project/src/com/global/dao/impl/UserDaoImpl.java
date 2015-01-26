package com.global.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.global.dao.UserDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Deliveryspot;
import com.global.vo.Employee;
import com.global.vo.Power;
import com.global.vo.User;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {

	public void addUser(User user) {
        super.save(user);
	}

	public void deleteUser(User user) {
      super.delete(user);
	}

	public List queryAllUser() {
		return null;
	}

	public List queryPowerFromPower() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List queryUserByDeliverySpotID(int deliverySpotID) {
		String hql =" from User as u where u.deliveryspot.deliveryspotid = " + deliverySpotID + " order by u.userid desc";
		return super.list(hql);
	}

	public List queryUserByDeliverySpotID2(int deliverySpotID,int offset,int number) {
		String hql =" from User as u where u.deliveryspot.deliveryspotid = " + deliverySpotID + " order by u.userid desc";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(offset).setMaxResults(number).list();
		HibernateSessionFactory.closeSession();
		return list;
	}
	
	public int countqueryUserByDeliverySpotID2(int deliverySpotID) {
		String hql =" from User as u where u.deliveryspot.deliveryspotid = " + deliverySpotID;
		return super.list(hql).size();
	}


	public List queryUserByPowerID(int powerID) {
		// TODO Auto-generated method stub
		return null;
	}

	public User queryUserByUserID(int userID) {
		return (User) super.get(User.class, new Integer(userID));
	}

	public User queryuserByEmpID(int empID) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateUser(User user) {
          super.update(user);
	}
 
	  public User login(String username, String password, int powerID) {
		  String hql = "from User as u where " +
		  		       " u.username='" + username +
		  	           "' and u.passowrd ='" + password +
		  	           "' and u.power.powerid = "+powerID;
			List userList = super.list(hql);
			if(userList.size()>0){
				return (User) userList.get(0);
			}
			return null;
		}


	public List queryUserByDeliveryspotidFromUser(int deliveryspotid) {
		String hql =" from User as u where u.deliveryspot.deliveryspotid = " + deliveryspotid + " order by u.userid desc";
		return super.list(hql);
	}


	public boolean checkUsername(String username) {
		String hql = "from User as u where u.username = '"+username + "'";
		List list = super.list(hql);
		if(list.size()>0){
			return true;
		}
		return false;
	}

	
}
