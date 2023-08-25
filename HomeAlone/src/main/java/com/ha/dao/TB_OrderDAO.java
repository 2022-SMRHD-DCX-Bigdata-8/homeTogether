package com.ha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_ORDER;

public class TB_OrderDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public int insert(TB_ORDER order) {
		SqlSession session = factory.openSession(true);
		
		int cnt=0;
		try {
			cnt=session.insert("insertorder", order);
			
		} catch (Exception e) {
			System.out.println("실패!");
		}
		session.close();
		
		return cnt;
		
		
	}
	
	public List<TB_ORDER> select(TB_ORDER order) {
		SqlSession session = factory.openSession(true);
		List<TB_ORDER>list = session.selectList("orderlist",order);
		session.close();
		return list;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
