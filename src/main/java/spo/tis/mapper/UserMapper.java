package spo.tis.mapper;

import spo.tis.domain.UserVO;

public interface UserMapper {
	int createUser(UserVO user);

	Integer idCheck(String userid);

	UserVO findUser(UserVO user);
}
