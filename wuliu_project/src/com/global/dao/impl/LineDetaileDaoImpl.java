package com.global.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.global.dao.LineDetaileDao;
import com.global.vo.Linedetaile;

public class LineDetaileDaoImpl extends BaseDaoImpl implements LineDetaileDao {

	public void addLineDetaile(Linedetaile lineDetaile) {
		super.save(lineDetaile);

	}

	public void deleteLineDetaile(Linedetaile lineDetaile) {
		super.delete(lineDetaile);

	}

	public List queryLineDetaileByLineID(int lineID) {
		String hql = "from Linedetaile as ld where ld.line.lineid = "+lineID+" order by ld.lineindex ";

		return super.list(hql);
	}

}
