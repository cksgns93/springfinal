package spo.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spo.tis.domain.ClubVO;

@Service
public interface ClubService {

	int getTotalCount();
	List<ClubVO> listClub2(ClubVO cvo);
	
	ClubVO viewClub(int cno);
	int getClubKingInfo(int cno);
	int insertMC(ClubVO cvo);
	int incCNumber(int cno);
	int updateMC(int idx);
	int updateOutdate(int idx);
	int decCNumber(int cno);
	int getFindNameCount(ClubVO cvo);
	int getFindSportsCount(ClubVO cvo);
	List<ClubVO> findClubByName(ClubVO cvo);
	List<ClubVO> findClubBySports(ClubVO cvo);
	int insertClub(ClubVO clubVo);
	int insertMCKing(ClubVO clubVo);
}
