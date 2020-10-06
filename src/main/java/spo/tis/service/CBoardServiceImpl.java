package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.CBoardVO;
import spo.tis.domain.ClubVO;
import spo.tis.mapper.CBoardMapper;

@Service
public class CBoardServiceImpl implements CBoardService {
	
	@Inject
	private CBoardMapper cboardmapper;

	@Override
	public List<CBoardVO> getCbdList(CBoardVO cbvo) {
		
		return cboardmapper.getCbdList(cbvo);
	}

	@Override
	public ClubVO viewClub(int cno) {
		
		return cboardmapper.viewClub(cno);
	}

	@Override
	public int getCbdTotalCount(int cno) {
		
		return cboardmapper.getCbdTotalCount(cno);
	}

	@Override
	public List<CBoardVO> getMyBoard(CBoardVO cbvo) {
		
		return cboardmapper.getMyBoard(cbvo);
	}

	@Override
	public int deleteBoard(int cbno) {
		
		return cboardmapper.deleteBoard(cbno);
	}

	@Override
	public CBoardVO getBoardDetail(int cbno) {
		
		return cboardmapper.getBoardDetail(cbno);
	}

	@Override
	public int udpateCbReadnum(int cbno) {
		
		return cboardmapper.udpateCbReadnum(cbno);
	}

	@Override
	public int insertBoard(CBoardVO cbvo) {

		return cboardmapper.insertBoard(cbvo);
	}

	@Override
	public int updateBoard(CBoardVO cbvo) {

		return cboardmapper.updateBoard(cbvo);
	}
	
	
}
