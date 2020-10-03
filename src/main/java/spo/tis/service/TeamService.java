package spo.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spo.tis.domain.TeamVO;

@Service
public interface TeamService {
	
	int insertTeam(TeamVO tvo);
	
	List<TeamVO> getAllTeam();

	TeamVO Teaminfo(String user);

	TeamVO selectByKname(String name);

}
