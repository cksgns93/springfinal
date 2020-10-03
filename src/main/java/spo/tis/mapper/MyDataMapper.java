package spo.tis.mapper;

import java.util.List;

import spo.tis.domain.McVO;
import spo.tis.domain.PagingVO;

public interface MyDataMapper {
   
   List<McVO> clubList(PagingVO paging);
   int clubCount(PagingVO paging);
   
   List<McVO> clubHList(PagingVO paging);
   int clubHCount(PagingVO paging);
   

}