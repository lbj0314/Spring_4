package com.iu.s4.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.s4.dao.MemberDAOImpl;
import com.iu.s4.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAOImpl memberDAOImpl;
	
	@Override
	public int memberJoin(MemberVO memberVO) throws Exception {
		return memberDAOImpl.memberJoin(memberVO);
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return memberDAOImpl.memberLogin(memberVO);
	}

	@Override
	public int memberUpdate(MemberVO memberVO) throws Exception {
		return memberDAOImpl.memberUpdate(memberVO);
	}

	@Override
	public int memberDelete(MemberVO memberVO) throws Exception {
		return memberDAOImpl.memberUpdate(memberVO);
	}

	@Override
	public int memberPointUpdate(MemberVO memberVO) throws Exception {
		return 0;
	}

	@Override
	public MemberVO memberCheckId(MemberVO memberVO) throws Exception {
		return memberDAOImpl.memberCheckId(memberVO);
	}

	@Override
	public MemberVO memberSearchId(MemberVO memberVO) throws Exception {
		return memberDAOImpl.memberSearchId(memberVO);
	}

	@Override
	public MemberVO memberSearchPw(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAOImpl.memberSearchPw(memberVO);
	}

}