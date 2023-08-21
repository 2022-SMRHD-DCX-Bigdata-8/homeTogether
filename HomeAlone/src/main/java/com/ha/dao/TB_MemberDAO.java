package com.ha.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ha.database.SqlSessionManager;
import com.ha.entity.TB_Member;

public class TB_MemberDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public int join(TB_Member tb_member) {

		SqlSession session = factory.openSession(true);

		// 프로젝트 진행 할 때 일일이 예외처리 진행해야 함
		// 예외 상황이 발생해도 멈추지 않고 쭉 실행할 수 있도록
		// select 문만 빼고 다 써줘야 함
		int cnt = 0;

		try {
			cnt = session.insert("join", tb_member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();

		return cnt;

	}

	public TB_Member login(TB_Member member) {

		SqlSession session = factory.openSession(true);

		TB_Member result = null;

		try {
			result = session.selectOne("login", member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return result;

	}

	public int update(TB_Member member) {

		SqlSession session = factory.openSession(true);

		int cnt = 0;

		try {
			cnt = session.update("update", member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return cnt;

	}

	public int delete(TB_Member member) {
		SqlSession session = factory.openSession(true);

		int cnt = 0;

		try {
			cnt = session.delete("delete", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;

	}

	public TB_Member getMemberInfo(String id) {
		SqlSession session = factory.openSession(true);
		TB_Member memberInfo = null;
		
		try {
            memberInfo = session.selectOne("getMemberInfo", id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return memberInfo;
	}

}
