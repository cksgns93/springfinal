package spo.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spo.tis.domain.TeamVO;
import spo.tis.domain.matchaddVO;
@Service
public interface MatchService {
   List<matchaddVO>  getAllMatch();

   matchaddVO getMatchinfo(String mno);

   int insertMatching(matchaddVO match);

   TeamVO selectByKname(String name);
}