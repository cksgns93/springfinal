package spo.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spo.tis.domain.MtVO;
import spo.tis.domain.TeamVO;
import spo.tis.domain.matchaddVO;
@Service
public interface MatchService {
   List<matchaddVO>  getAllMatch(matchaddVO mvo);

   matchaddVO getMatchinfo(String mno);

   int insertMatching(matchaddVO match);

   TeamVO selectByKname(String name);

   int applymatch(MtVO mtvo);
   
   List<MtVO> selectidx(int hmno);

   int getTotalCount();
  
   int getFindCount(matchaddVO mtvo);
  
   List<matchaddVO> getFindMatch(matchaddVO mtvo);
    
   int getFindCateCount(matchaddVO mtvo);
 
   List<matchaddVO> getFindMatchCate(matchaddVO mtvo);
 
   List<MtVO> selectRecord(int hmno);
  
   int updateMtstate(int mtno);
 
   int deleteMtno(MtVO mtvo);
}