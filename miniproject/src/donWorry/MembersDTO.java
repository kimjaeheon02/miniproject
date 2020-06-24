package donWorry;

import java.io.Serializable;

public class MembersDTO implements Serializable{
	private Long no;
	private String id;
	private String name;
	private String password;
	private String email;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
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
		return "MembersDTO [no=" + no + ", id=" + id + ", name=" + name + ", password=" + password + ", email=" + email
				+ "]";
	}
	
	

	
}
