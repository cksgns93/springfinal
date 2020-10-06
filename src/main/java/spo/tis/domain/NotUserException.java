package spo.tis.domain;

//@Data
//@NoArgsConstructor
public class NotUserException extends Exception {

	public NotUserException() {
		super("NotUserException");
	}
	
	public NotUserException(String message) {
		super(message);
	}

	
}
