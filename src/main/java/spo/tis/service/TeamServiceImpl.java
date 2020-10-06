package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.TeamVO;
import spo.tis.mapper.TeamMapper;
@Service
public class TeamServiceImpl implements TeamService {

   @Inject
   private TeamMapper TeamMapper;
   
   @Override
   public int insertTeam(TeamVO tvo) {
      return this.TeamMapper.insertTeam(tvo);
   }
   
   @Override
   public List<TeamVO> getAllTeam(){
      return this.TeamMapper.getAllTeam();
   }
   
   @Override
   public TeamVO selectByKname(String kname){
      return this.TeamMapper.selectByKname(kname);
   }
   
   @Override
   public TeamVO Teaminfo(String user) {
      return this.TeamMapper.Teaminfo(user);
   }

	@Override
	public int getTotalCount() {
		 return this.TeamMapper.getTotalCount();
	}
	
	@Override
	public List<TeamVO> listTeam2(TeamVO tvo) {
		 return this.TeamMapper.listTeam2(tvo);
	}

	@Override
	public TeamVO Teaminfo2(int amno) {

		return this.TeamMapper.Teaminfo2(amno);
	}
}