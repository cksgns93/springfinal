package spo.tis.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.McVO;
import spo.tis.domain.MtVO;
import spo.tis.domain.Paging2VO;
import spo.tis.domain.Paging3VO;
import spo.tis.domain.PagingVO;
import spo.tis.domain.TeamVO;
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
   public int clubHCount(Paging2VO paging) {
      return this.mydataMapper.clubHCount(paging);
   }

   @Override
   public List<McVO> clubHList(Paging2VO paging) {
      return this.mydataMapper.clubHList(paging);
   }
   
   @Override
   public int teamCount(Paging3VO paging) {
      return this.mydataMapper.teamCount(paging);
   }

   @Override
   public List<MtVO> teamList(Paging3VO paging) {
      return this.mydataMapper.teamList(paging);
   }
	@Override
	public MtVO teamData() {
		return this.mydataMapper.teamData();
	}
	
	@Override
	public List<MtVO> tPersonnel() {
		return this.mydataMapper.tPersonnel();
	}
	
	@Override
	public boolean teamDelete(Map<String,Integer> map) {
		return this.mydataMapper.teamDelete(map);
	}
	
	@Override
	public boolean teamsecession(Map<String,Integer> map) {
		return this.mydataMapper.teamsecession(map);
	}
	
	@Override
	public MtVO teamEdit(int tno) {
		return this.mydataMapper.teamEdit(tno);
	}
	
	@Override
	public TeamVO teamEdit2(TeamVO vo) {
		return this.mydataMapper.teamEdit2(vo);
	}
}