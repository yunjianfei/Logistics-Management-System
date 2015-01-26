package com.global.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.global.dao.LineDao;
import com.global.db.HibernateSessionFactory;
import com.global.vo.Car;
import com.global.vo.Carstate;
import com.global.vo.Line;

public class LineDaoImpl extends BaseDaoImpl implements LineDao {

	public void addLine(Line line) {
		super.save(line);

	}

	public void deleteLine(Line line) {
		super.delete(line);

	}
	
	public Carstate querylineByCarStateID(int carStateID) {
		return (Carstate)super.get(Carstate.class, new Integer(carStateID));
	}

	public List queryAllLineMatchingLine() {
		String hql = " from Line as l order by l.lineid desc";
		return super.list(hql);
	}
	
	public List queryAllLine(int intOffset,int munber) {
		String hql = " from Line as l order by l.lineid desc";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(intOffset).setMaxResults(munber).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public Line querylineByLineID(int lineID) {
		
		return (Line) super.get(Line.class, new Integer(lineID));
	}

	public List queryCarByLineID(int lineID) {
		String hql = "from Car as c where c.line.lineid="+ lineID + "order by c.carid desc";
		return super.list(hql);
	}

	public List queryLineIDFromCar() {
		String sql = " select lineid from car where lineid is not null group by lineid ";
		Session session = HibernateSessionFactory.getSession();
		Connection conn = null;
		List carList= new ArrayList();
		try {
			conn = session.connection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Car car = new Car();
				String lineid = rs.getString("lineid");
				Line line = querylineByLineID(new Integer(lineid));
				car.setLine(line);
				carList.add(car);
			}
			return carList;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public int countOfAllLine() {
		String hql =" from Line as l ";
		List list = super.list(hql);
		return list.size();
	}

	public List queryCarMatchingLine(int offset, int number) {
		String hql = " from Car as c where c.line.lineid is not null order by c.carid desc ";
		Session session = HibernateSessionFactory.getSession();
		List list = session.createQuery(hql).setFirstResult(offset).setMaxResults(number).list();
		HibernateSessionFactory.closeSession();
		return list;
	}

	public int countqueryCarMatchingLine() {
		String hql = " from Car as c where c.line.lineid is not null order by c.carid desc ";
		return super.list(hql).size();
	}

	public List queryCarNotMatchingLine() {
		String hql = " from Car as c where c.line.lineid is null order by c.carid desc ";
		return super.list(hql);
	}
}
