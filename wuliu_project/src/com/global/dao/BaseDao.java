package com.global.dao;

import java.util.List;

public interface BaseDao {

	public void save(Object o);

	public void saveByJdbc(String sql);

	public Object get(Class cls, java.io.Serializable id);

	public void update(Object o);

	public void delete(Object o);

	public List list(String hql);

	public List listByJdbc(String sql);

	public List listArraryByJdbc(String sql, Object[] objs);

	public int getInt(String sql);

	public int getInt(String sql, Object[] objs);

	public String getCurrentDateFromDB();

	public String getCurrentTimeFromDB();

	public String getCurrentDateFromDB2();

	public List listForJdbcCustom(String sql);
	

}
