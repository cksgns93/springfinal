package spo.tis.mapper;

import java.util.List;

import spo.tis.domain.MemberVO;

public interface MemberMapper {

	List<MemberVO> getJoinInfo(int cno);

}
