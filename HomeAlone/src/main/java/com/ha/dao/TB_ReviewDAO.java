package com.ha.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Review;

public class TB_ReviewDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public int insert(TB_Review review) {
		
		SqlSession session = factory.openSession(true);
		int cnt=0;
		try {
			cnt=session.insert("insert", review);
			
		} catch (Exception e) {
			System.out.println("실패!");
		}
		session.close();
		return cnt;
		
	}

}
