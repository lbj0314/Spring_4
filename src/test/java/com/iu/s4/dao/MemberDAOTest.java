package com.iu.s4.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.iu.s4.TestAbstractCase;
import com.iu.s4.model.MemberVO;
import com.iu.s4.dao.MemberDAOImpl;

public class MemberDAOTest extends TestAbstractCase {

	@Inject
	private MemberDAOImpl memberDAOimpl;
	
	@Test
	public void memberJoinTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("momo");
		memberVO.setPw("momo");
		memberVO.setName("momo");
		memberVO.setEmail("momo@momo.momo");
		memberVO.setBirth("1996-11-09");
		memberVO.setGender("F");
		int result = memberDAOimpl.memberJoin(memberVO);
		assertEquals(1, result);
	}

}
