package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.MemberVO;
import spo.tis.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> getJoinInfo(int cno) {
		
		return memberMapper.getJoinInfo(cno);
	}

}
