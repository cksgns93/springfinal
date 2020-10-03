package spo.tis.mapper;

import java.util.List;

import spo.tis.domain.TeamVO;
import spo.tis.domain.matchaddVO;

public interface MatchMapper {
	List<matchaddVO>  getAllMatch();

	matchaddVO getMatchinfo(String mno);

	int insertMatching(matchaddVO vo);

	TeamVO selectByKname(String kname);
	
}
