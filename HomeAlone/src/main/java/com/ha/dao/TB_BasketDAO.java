package com.ha.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Basket;

public class TB_BasketDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	
	public int insert(TB_Basket basket) {
		
		
		SqlSession session = factory.openSession(true);
		int cnt=session.insert("insert", basket);
		session.close();
		
		return cnt;		
		
	}

}
