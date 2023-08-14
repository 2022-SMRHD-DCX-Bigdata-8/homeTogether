package com.ha.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Member;

public class TB_MemberDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();


	
	
public TB_Member login(TB_Member member) {
	
	SqlSession session = factory.openSession(true);
	TB_Member result=session.selectOne("login", member);
	session.close();
	return result;
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

