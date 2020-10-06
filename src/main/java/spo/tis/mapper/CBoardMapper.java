package spo.tis.mapper;

import java.util.List;

import spo.tis.domain.CBoardVO;
import spo.tis.domain.ClubVO;

public interface CBoardMapper {

	List<CBoardVO> getCbdList(CBoardVO cbvo);

	ClubVO viewClub(int cno);

	int getCbdTotalCount(int cno);

	List<CBoardVO> getMyBoard(CBoardVO cbvo);

	int deleteBoard(int cbno);

	CBoardVO getBoardDetail(int cbno);

	int udpateCbReadnum(int cbno);

	int insertBoard(CBoardVO cbvo);

	int updateBoard(CBoardVO cbvo);

}
