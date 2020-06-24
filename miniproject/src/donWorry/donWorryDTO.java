package donWorry;

import java.io.Serializable;

public class donWorryDTO implements Serializable{
	private Long no;
	private String id;
	private String name;
	private String password;
	private String email;
	
	private String regdate; 
	private int category;
	private int io;
	private int money;
	private String memo;
	
	private String cate_name;
	
	
	
	public String getCate_name() {
		return cate_name;
	}



	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}



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



	public String getRegdate() {
		return regdate;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public int getCategory() {
		return category;
	}



	public void setCategory(int category) {
		this.category = category;
	}



	public int getIo() {
		return io;
	}



	public void setIo(int io) {
		this.io = io;
	}



	public int getMoney() {
		return money;
	}



	public void setMoney(int money) {
		this.money = money;
	}



	public String getMemo() {
		return memo;
	}



	public void setMemo(String memo) {
		this.memo = memo;
	}



	@Override
	public String toString() {
		return "donWorryDTO [no=" + no + ", id=" + id + ", name=" + name + ", password=" + password + ", email=" + email
				+ ", regdate=" + regdate + ", category=" + category + ", io=" + io + ", money=" + money + ", memo="
				+ memo + ", cate_name=" + cate_name + "]";
	}

	
	
}
