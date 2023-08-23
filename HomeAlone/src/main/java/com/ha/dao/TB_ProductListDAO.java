package com.ha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Product;

public class TB_ProductListDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	
	public List<TB_Product> LightingSelect() {
		
		SqlSession session = factory.openSession(true);
		
		List<TB_Product> list =  session.selectList("lighting");
		session.close();
		
		return list;
	}
	public List<TB_Product> TableSelect() {
		
		SqlSession session = factory.openSession(true);
		
		List<TB_Product> list =  session.selectList("table");
		session.close();
		
		return list;
	}
	public List<TB_Product> ChairSelect() {
		
		SqlSession session = factory.openSession(true);
		
		List<TB_Product> list =  session.selectList("chair");
		session.close();
		
		return list;
	}
	public List<TB_Product> StorageSelect() {
		
		SqlSession session = factory.openSession(true);
		
		List<TB_Product> list =  session.selectList("storage");
		session.close();
		
		return list;
	}
	public List<TB_Product> BeddingSelect() {
		
		SqlSession session = factory.openSession(true);
		
		List<TB_Product> list =  session.selectList("bedding");
		session.close();
		
		return list;
	}
	
	public List<TB_Product> GajunSelect() {
		
		SqlSession session = factory.openSession(true);
		
		List<TB_Product> list =  session.selectList("gajun");
		
		return list;
	}
	public List<TB_Product> searchSelect(String search) {
		
		SqlSession session = factory.openSession(true);
		List<TB_Product>list =  session.selectList("search", search);
		
		return list;
		
	}
	
	
}
