package com.ha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Product;

public class TB_ProductDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	private List<TB_ProductDAO> list() {

		SqlSession session = factory.openSession(true);

		List<TB_ProductDAO> list = session.selectList("list");
		session.close();
		return list;

	}
	
	public TB_Product productName(int prod_seq) {
		
		SqlSession session = factory.openSession(true);
		TB_Product product=session.selectOne("prodName", prod_seq);
		session.close();
		return product;
		
	}
	public List<TB_Product> productList() {
		SqlSession session = factory.openSession(true);
		List<TB_Product> list = session.selectList("select");
		session.close();
		
		return list;
		
	}

}
