package com.ha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;

public class TB_ProductDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	private List<TB_ProductDAO> list() {

		SqlSession session = factory.openSession(true);

		List<TB_ProductDAO> list = session.selectList("list");

		return list;

	}

}
