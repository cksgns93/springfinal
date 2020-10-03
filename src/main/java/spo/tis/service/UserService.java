package spo.tis.service;

import org.springframework.stereotype.Service;

import spo.tis.domain.NotUserException;
import spo.tis.domain.UserVO;

@Service
public interface UserService {
	
	int createUser(UserVO user);

	UserVO loginCheck(UserVO user) throws NotUserException;

	UserVO findUser(UserVO user);
	

}
