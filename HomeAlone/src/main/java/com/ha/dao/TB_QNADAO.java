package com.ha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_QNA;
import com.ha.entity.TB_Review;

public class TB_QNADAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	
	public int insertQNA(TB_QNA qna) {
		
		SqlSession session = factory.openSession(true);
		int cnt=0;
		try {
			cnt=session.insert("insert", qna);
			
		} catch (Exception e) {
			System.out.println("실패!");
		}
		session.close();
		
		return cnt;

	}
	
	public List<TB_QNA> selectQNA(TB_QNA qna) {
		SqlSession session = factory.openSession();
		List<TB_QNA>list = session.selectList("qna", qna);
	
		session.close();
		
		return list;
		
		
		
		
	}
	
	
	
	
	
	
}
