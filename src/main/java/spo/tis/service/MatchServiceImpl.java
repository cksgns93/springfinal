package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.MtVO;
import spo.tis.domain.TeamVO;
import spo.tis.domain.matchaddVO;
import spo.tis.mapper.MatchMapper;
@Service("matchServiceImpl")
public class MatchServiceImpl implements MatchService {
   
   @Inject
   private MatchMapper matchMapper;
   
   @Override
   public List<matchaddVO> getAllMatch(matchaddVO mvo) {
   		return this.matchMapper.getAllMatch(mvo);
   }
   
   @Override
   public matchaddVO getMatchinfo(String mno) {
      return this.matchMapper.getMatchinfo(mno);
   }
   
   @Override
   public int insertMatching(matchaddVO vo) {
      return this.matchMapper.insertMatching(vo);
   }
   @Override
   public TeamVO selectByKname(String kname) {
      return this.matchMapper.selectByKname(kname);
   }
   
	@Override
	public int getTotalCount() {
		
		return this.matchMapper.getTotalCount();
	}

	@Override
	public int getFindCount(matchaddVO mtvo) {
		return this.matchMapper.getFindCount(mtvo);
	}

	@Override
	public List<matchaddVO> getFindMatch(matchaddVO mtvo) {
		return this.matchMapper.getFindMatch(mtvo);
	}

	@Override
	public int getFindCateCount(matchaddVO mtvo) {
		return this.matchMapper.getFindCateCount(mtvo);
	}

	@Override
	public List<matchaddVO> getFindMatchCate(matchaddVO mtvo) {
		return this.matchMapper.getFindMatchCate(mtvo);
	}

	@Override
	public int applymatch(MtVO mtvo) {
		return this.matchMapper.applymatch(mtvo);
	}

	@Override
	public List<MtVO> selectidx(int hmno) {
		return this.matchMapper.selectidx(hmno);
	}

	@Override
	public List<MtVO> selectRecord(int hmno) {
		return this.matchMapper.selectRecord(hmno);
	}

	@Override
	public int updateMtstate(int mtno) {
		return this.matchMapper.updateMtstate(mtno);
	}

	@Override
	public int deleteMtno(MtVO mtvo) {
		return this.matchMapper.deleteMtno(mtvo);
	}

}