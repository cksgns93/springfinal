package spo.tis.domain;

//@Data
//@NoArgsConstructor
@SuppressWarnings("serial")
public class NotUserException extends Exception {

	public NotUserException() {
		super("NotUserException");
	}
	
	public NotUserException(String message) {
		super(message);
	}

	
}
