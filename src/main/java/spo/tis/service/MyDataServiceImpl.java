package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.McVO;
import spo.tis.domain.PagingVO;
import spo.tis.mapper.MyDataMapper;

@Service("MyDataServiceImpl")
public class MyDataServiceImpl implements MyDataService {

   @Inject
   private MyDataMapper mydataMapper;
   
   @Override
   public int clubCount(PagingVO paging) {
      return this.mydataMapper.clubCount(paging);
   }

   @Override
   public List<McVO> clubList(PagingVO paging) {
      return this.mydataMapper.clubList(paging);
   }

   @Override
   public int clubHCount(PagingVO paging) {
      return this.mydataMapper.clubHCount(paging);
   }

   @Override
   public List<McVO> clubHList(PagingVO paging) {
      return this.mydataMapper.clubHList(paging);
   }
}