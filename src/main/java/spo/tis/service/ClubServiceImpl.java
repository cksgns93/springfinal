package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.ClubVO;
import spo.tis.mapper.ClubMapper;

@Service
public class ClubServiceImpl implements ClubService {

	@Inject
	private ClubMapper clubMapper;
	
	@Override
	public List<ClubVO> listClub2(ClubVO cvo) {
		
		return clubMapper.listClub2(cvo);
	}

	@Override
	public int getTotalCount() {
		
		return clubMapper.getTotalCount();
	}

	@Override
	public ClubVO viewClub(int cno) {
		
		return clubMapper.viewClub(cno);
	}

	@Override
	public int getClubKingInfo(int cno) {
		
		return clubMapper.getClubKingInfo(cno);
	}

	@Override
	public int insertMC(ClubVO cvo) {
		
		return clubMapper.insertMC(cvo);
	}

	@Override
	public int incCNumber(int cno) {
		
		return clubMapper.incCNumber(cno);
	}

	@Override
	public int updateMC(int idx) {
		
		return clubMapper.updateMC(idx);
	}

	@Override
	public int updateOutdate(int idx) {
		
		return clubMapper.updateOutdate(idx);
	}

	@Override
	public int decCNumber(int cno) {

		return clubMapper.decCNumber(cno);
	}

	@Override
	public int getFindNameCount(ClubVO cvo) {
		
		return clubMapper.getFindNameCount(cvo);
	}

	@Override
	public int getFindSportsCount(ClubVO cvo) {
		
		return clubMapper.getFindSportsCount(cvo);
	}

	@Override
	public List<ClubVO> findClubByName(ClubVO cvo) {
	
		return clubMapper.findClubByName(cvo);
	}

	@Override
	public List<ClubVO> findClubBySports(ClubVO cvo) {
		
		return clubMapper.findClubBySports(cvo);	
	}

	@Override
	public int insertClub(ClubVO clubVo) {
		
		return clubMapper.insertClub(clubVo);	
	}

	@Override
	public int insertMCKing(ClubVO clubVo) {
		
		return clubMapper.insertMCKing(clubVo);	
	}

}
