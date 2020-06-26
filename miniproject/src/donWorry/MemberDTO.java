package donWorry;

import java.io.Serializable;

public class MemberDTO implements Serializable{
	private String regist_date;
	private int no;
	private String id;
	private String name;
	private String password;
	private String email;
	
	
	
	public String getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "MemberDTO [regist_date=" + regist_date + ", no=" + no + ", id=" + id + ", name=" + name + ", password="
				+ password + ", email=" + email + "]";
	}

	
}
