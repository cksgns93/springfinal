package spo.tis.mapper;

import java.util.List;

import spo.tis.domain.MtVO;
import spo.tis.domain.TeamVO;
import spo.tis.domain.matchaddVO;

public interface MatchMapper {
	
	matchaddVO getMatchinfo(String mno);

	int insertMatching(matchaddVO vo);

	TeamVO selectByKname(String kname);

	int applymatch(MtVO mtvo);
	
	List<MtVO> selectidx(int hmno);

	List<matchaddVO> getAllMatch(matchaddVO mvo);

	int getTotalCount();

	int getFindCount(matchaddVO mtvo);

	List<matchaddVO> getFindMatch(matchaddVO mtvo);

	int getFindCateCount(matchaddVO mtvo);

	List<matchaddVO> getFindMatchCate(matchaddVO mtvo);

	List<MtVO> selectRecord(int hmno);

	int updateMtstate(int mtno);

	int deleteMtno(MtVO mtvo);		
}
