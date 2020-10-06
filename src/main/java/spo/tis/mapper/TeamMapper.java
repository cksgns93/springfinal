package spo.tis.mapper;

import java.util.List;

import spo.tis.domain.TeamVO;

public interface TeamMapper {
   int insertTeam(TeamVO tvo);
   List<TeamVO> getAllTeam();
   TeamVO selectByKname(String kname);
   TeamVO Teaminfo(String user);
   int getTotalCount(); 
   List<TeamVO> listTeam2(TeamVO tvo);
   TeamVO Teaminfo2(int amno); 
}