package donWorry;

public class donWorryDTO {
	private String id;
	private String name;
	private String password;
	private Long private_no;
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
	public Long getPrivate_no() {
		return private_no;
	}
	public void setPrivate_no(Long private_no) {
		this.private_no = private_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "donWorryDTO [id=" + id + ", name=" + name + ", password=" + password + ", private_no="
				+ private_no + "]";
	}
	
	
}
