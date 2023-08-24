package com.ha.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_ORDER;

public class TB_OrderDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public int insert(TB_ORDER order) {
		SqlSession session = factory.openSession();
		
		int cnt=0;
		try {
			cnt=session.insert("insertorder", order);
			
		} catch (Exception e) {
			System.out.println("실패!");
		}
		session.close();
		
		return cnt;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
