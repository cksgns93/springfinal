package spo.tis.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import spo.tis.domain.NotUserException;
/* 모든예외를 처리하는 역할을한다.
 * @ControllerAdvice어노테이션을 붙이면 이 클래스의 객체가 
 * 컨트롤러에서 발생하는 예외를 전문적으로 처리하는 클래스임을 명시하는 것이다.
 * */
@ControllerAdvice
public class CommonExceptionAdvice {//Advice는 공통관심사
	
	@ExceptionHandler(NotUserException.class)
	public String commonLoginError(NotUserException ex) {
		System.out.println("로그인 처리중 예외"+ex.getMessage());
		return "member/errorAlert";
	}
	
	@ExceptionHandler(Exception.class)
	public String commonError(NotUserException ex) {
		System.out.println("예외"+ex.getMessage());
		//ex.printStackTrace();
		return "member/errorAlert";
	}
	
	
}
