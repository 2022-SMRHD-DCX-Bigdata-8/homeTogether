package com.ha.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Member;

public class TB_MemberDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	
	// 회원가입
	public int join(TB_Member tb_member) {
		SqlSession session = factory.openSession(true);

		int cnt = session.insert("join", tb_member);

		session.close();

		return cnt;

	}

}
