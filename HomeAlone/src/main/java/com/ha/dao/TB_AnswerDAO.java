package com.ha.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Answer;
import com.ha.entity.TB_QNA;

public class TB_AnswerDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	
	public int insertAnswer(TB_Answer answer) {
		
		SqlSession session = factory.openSession(true);
		int cnt=0;
		try {
			cnt=session.insert("insertanswer", answer);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("답변 등록 실패: " + e.getMessage());
		}
		session.close();
		
		return cnt;

	}
	
	
	
	
	
	
	
	
	
	
	
	
}
