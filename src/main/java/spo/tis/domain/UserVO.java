package spo.tis.domain;


public class UserVO {
	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String question;
	private String answer;
	private String gender;
	private String birth;
	private int hp1;
	private int hp2;
	private int hp3;
	private String loc;
	private int state;
	private String mark;
	private boolean saveId;
	
	public UserVO() {
		
	}//기본생성자

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getHp1() {
		return hp1;
	}

	public void setHp1(int hp1) {
		this.hp1 = hp1;
	}

	public int getHp2() {
		return hp2;
	}

	public void setHp2(int hp2) {
		this.hp2 = hp2;
	}

	public int getHp3() {
		return hp3;
	}

	public void setHp3(int hp3) {
		this.hp3 = hp3;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public UserVO(int idx, String id, String pwd, String name, String question, String answer, String gender,
			String birth, int hp1, int hp2, int hp3, String loc, int state, String mark) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.question = question;
		this.answer = answer;
		this.gender = gender;
		this.birth = birth;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.loc = loc;
		this.state = state;
		this.mark = mark;
	}

	public boolean isSaveId() {
		return saveId;
	}

	public void setSaveId(boolean saveId) {
		this.saveId = saveId;
	}
	
	
	
}
