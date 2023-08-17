package com.ha.dao;

import java.util.List;

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

	public List<TB_Review> select(TB_Review review) {
		SqlSession session = factory.openSession(true);
		
		List<TB_Review> list = session.selectList("list", review);
		
		session.close();
		return list;
		
	}
	
	
	
	
	
	
}
