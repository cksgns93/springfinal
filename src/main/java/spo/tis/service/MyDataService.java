package spo.tis.service;

import java.util.List;

import spo.tis.domain.McVO;
import spo.tis.domain.PagingVO;

public interface MyDataService {

   int clubCount(PagingVO paging);
   List<McVO> clubList(PagingVO paging);
   
   int clubHCount(PagingVO paging);
   List<McVO> clubHList(PagingVO paging);

}