package com.ha.dao;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Review;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

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
		
		List<TB_Review>list = session.selectList("review", review);
	
		session.close();
	
		return list;
		
	}

	public int update(TB_Review review) {
		
		SqlSession session = factory.openSession(true);
		
		int cnt = session.update("updateReview" , review);
		
		session.close();
		
		return cnt;

		
	}
	
	public int delete(TB_Review review) {
		
		SqlSession session = factory.openSession(true);
		
		int cnt = session.delete("deleteReview",review);
		
		session.close();
		
		return cnt;
		
	}
	
	//mypage review 불러오는 메서드
	public List<TB_Review> myPageReview(String nick) {
		
		SqlSession session = factory.openSession(true);
		List<TB_Review> list = session.selectList("myPageReviewSelect",nick);
		session.close();
		
		return list;
		
	}
	
	
	
	
}
