package spo.tis.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.NotUserException;
import spo.tis.domain.UserVO;
import spo.tis.mapper.UserMapper;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper userMapper;
	
	@Override
	public int createUser(UserVO user) {
		return userMapper.createUser(user);
	}
	
	@Override
	public UserVO findUser(UserVO user) {
		
		return this.userMapper.findUser(user);
	}
	
	@Override
	public UserVO loginCheck(UserVO user) throws NotUserException {
		//회원 아이디로 회원정보를 가져오자
		UserVO tmpUser=this.findUser(user);
		if(tmpUser==null) {
			//아이디가 존재하지 않는 경우
			throw new NotUserException("존재하지 않는아이디입니다.");//이렇게 구체적으로 알려주면안되는 거싱ㅁ
		}
		if(!tmpUser.getPwd().equals(user.getPwd())) {
			throw new NotUserException("비밀번호가 일치하지 않아요");
		}
		return tmpUser;
	}

}
