package com.global.dao.impl;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BasicDynaClass;
import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.beanutils.DynaClass;
import org.apache.commons.beanutils.DynaProperty;
import org.apache.commons.beanutils.PropertyUtils;
import org.hibernate.Session;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.global.dao.BaseDao;
import com.global.db.HibernateSessionFactory;


public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao {
	
	private JdbcTemplate jt;

	public JdbcTemplate getJt() {
		return jt;
	}

	public void setJt(JdbcTemplate jt) {
		this.jt = jt;
	}

	public void delete(Object o) {
		super.getHibernateTemplate().delete(o);

	}

	public Object get(Class cls, Serializable id) {
		return  super.getHibernateTemplate().get(cls, id);
	}

	public List list(String hql) {
		return super.getHibernateTemplate().find(hql);
	}


	public void save(Object o) {
		super.getHibernateTemplate().save(o);

	}

	public void update(Object o) {
		super.getHibernateTemplate().update(o);

	}
	
	
	
   //JdbcTemplate
	public List listArraryByJdbc(String sql, Object[] objs) {
		List list = jt.queryForList(sql, objs);
		return list;
	}

	public List listByJdbc(String sql) {
		List list = jt.queryForList(sql);
		return list;
	}

	public int getInt(String sql) {
		int count =jt.queryForInt(sql);
		return count;
	}

	public int getInt(String sql, Object[] objs) {
		int count =jt.queryForInt(sql,objs);
		return count;
	}
	
	public List listForJdbcCustom(String sql){
		
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		List list = new ArrayList();

		int columns = 0;
		try {
			con = jt.getDataSource().getConnection();

			if (con == null)
				return null;
			stm = con.createStatement();
			if (stm == null)
				return null;
			rs = stm.executeQuery(sql);
			if (rs == null)
				return null;

			rsmd = rs.getMetaData();
			columns = rsmd.getColumnCount();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		DynaProperty[] px = new DynaProperty[columns];
		String prop[] = new String[columns];

		for (int i = 0; i < columns; i++) {
			try {
				prop[i] = rsmd.getColumnLabel(i + 1);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				px[i] = new DynaProperty(prop[i], Class
						.forName("java.lang.String"));

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return null;
			}
		}

		DynaClass dynaClass = null;

		DynaBean dynaBean;

		try {
			while (rs.next()) {

				dynaClass = new BasicDynaClass("dynaBean", null, px);

				try {
					dynaBean = dynaClass.newInstance();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
					return null;
				} catch (InstantiationException e) {
					e.printStackTrace();
					return null;
				}

				for (int i = 1; i <= columns; i++) {
					Object temp = rs.getObject(i);

					if (temp == null)
						temp = "";
					else
						temp = rs.getObject(i).toString();
					try {
						PropertyUtils.setProperty(dynaBean, prop[i - 1], temp);
						// test
						//System.out.println("prop = " + prop[i - 1]);
						// test
						//System.out.println("value = " + temp);
					} catch (IllegalAccessException e) {
						e.printStackTrace();
						return null;
					} catch (InvocationTargetException e) {
						e.printStackTrace();
						return null;
					} catch (NoSuchMethodException e) {
						e.printStackTrace();
						return null;
					}
				}
				list.add(dynaBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (stm != null)
					stm.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return list;
		
	}
	
	public String getCurrentTimeFromDB() {
		
		//eg:2008-11-30 08:25:57
		Session session = super.getSession();
		String sql = "select sysdate from dual";
		Connection conn = null;
		try {
			conn = session.connection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			rs.next();
			String s = rs.getTimestamp(1).toString();
			s = s.substring(0, s.indexOf("."));
			return s;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				session.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public void saveByJdbc(String sql) {
		Session session = HibernateSessionFactory.getSession();
		Connection conn = null;
		
		try {
			conn = session.connection();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	}
	
	public String getCurrentDateFromDB() {
		//eg:2008-11-30
		String sql = "  select sysdate  from dual";
		Session session = HibernateSessionFactory.getSession();
		Connection conn = null;
		
		try {
			conn = session.connection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			return (String)rs.getDate(1).toString();
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

	
	public String getCurrentDateFromDB2() {
		//eg:20081130
		String sql = "  select sysdate  from dual  ";
		Session session = this.getSession();
		Connection conn = null;
		try {
			conn = session.connection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			rs.next();
			
			SimpleDateFormat s = new SimpleDateFormat("yyyyMMdd");
			String date = s.format(rs.getDate(1));
			return date;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
