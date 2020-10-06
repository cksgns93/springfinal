package spo.tis.service;

import java.util.List;

import spo.tis.domain.MemberVO;

public interface MemberService {

	List<MemberVO> getJoinInfo(int cno);

}
