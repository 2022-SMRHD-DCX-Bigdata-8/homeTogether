package com.ha.dao;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_QNA;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class TB_QNADAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	
	public int insertQNA(TB_QNA qna) {
		
		SqlSession session = factory.openSession(true);
		int cnt=0;
		try {
			cnt=session.insert("insertqna", qna);
			
		} catch (Exception e) {
			System.out.println("실패!");
		}
		session.close();
		
		return cnt;

	}
	
	public List<TB_QNA> selectQNA(TB_QNA qna) {
		SqlSession session = factory.openSession(true);
		List<TB_QNA>list = session.selectList("qna", qna);
	
		session.close();
		
		return list;

	}
public List<TB_QNA> myPageQna(String nick) {
		
		SqlSession session = factory.openSession(true);
		List<TB_QNA> list = session.selectList("myPageQnaSelect",nick);
		session.close();
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
