package com.webproject.population.service;

import java.util.List;

import com.webproject.population.mapper.AdminMapper;
import com.webproject.population.vo.MemberVO;

import lombok.Setter;

public class AdminServiceImpl implements AdminService {

	@Setter
	private AdminMapper adminMapper;

	@Override
	public List<MemberVO> findAllMembers() {
		
		return adminMapper.selectAllMembers();
		
	}

	@Override
	public void updateMember(MemberVO member) {
	
		adminMapper.updateMember(member);
		
	}

	@Override
	public MemberVO findMemberByMemberId(String memberId) {
		
		return adminMapper.selectMemberByMemberId(memberId);
		
	}


	
	@Override
	public void deleteMember(String memberId) {
		
		adminMapper.updateMemberDeleted(memberId);
	}

	
}