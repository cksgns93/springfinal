package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.TeamVO;
import spo.tis.domain.matchaddVO;
import spo.tis.mapper.MatchMapper;
@Service("matchServiceImpl")
public class MatchServiceImpl implements MatchService {
   
   @Inject
   private MatchMapper matchMapper;
   
   @Override
   public List<matchaddVO> getAllMatch() {
      return matchMapper.getAllMatch();
   }
   
   @Override
   public matchaddVO getMatchinfo(String mno) {
      return this.matchMapper.getMatchinfo(mno);
   }
   
   @Override
   public int insertMatching(matchaddVO vo) {
      return this.matchMapper.insertMatching(vo);
   }
   
   public TeamVO selectByKname(String kname) {
      return this.matchMapper.selectByKname(kname);
   }

}