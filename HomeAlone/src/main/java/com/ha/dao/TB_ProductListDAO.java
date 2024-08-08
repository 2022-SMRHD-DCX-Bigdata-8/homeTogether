package com.ha.dao;

import com.ha.database.SqlSessionManager;
import com.ha.entity.Paging;
import com.ha.entity.TB_Product;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

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
		session.close();
		
		return list;
	}
	
	public List<TB_Product> searchSelect(String search) {
		
		SqlSession session = factory.openSession(true);
		List<TB_Product> list =  session.selectList("searched", search);
		
		session.close();
		return list;
		
	}
	public List<TB_Product> propertySelect(String property) {
		SqlSession session = factory.openSession(true);
		List<TB_Product> list = session.selectList("property" , property);
		session.close();
		return list;
		
	}
	
	// 전체 수 가져오기
	public int count(String property) {
		SqlSession session = factory.openSession(true);
		int cnt = session.selectOne("count" , property);
		session.close();
		return cnt;
		
	}
	
	// 페이징
	public List<TB_Product> paging(Paging paging) {
		SqlSession session = factory.openSession(true);
		List<TB_Product> list = session.selectList("paging" , paging);
		session.close();
		return list;
	}
	
	
}
