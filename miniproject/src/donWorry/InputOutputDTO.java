package donWorry;

import java.io.Serializable;

public class InputOutputDTO implements Serializable{
	private int no;
	private String id;
	private String regdate; 
	private int category;
	private int io;
	private int money;
	private String memo;
	
	private String cate_name;

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

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	@Override
	public String toString() {
		return "InputOutputDTO [no=" + no + ", id=" + id + ", regdate=" + regdate + ", category=" + category + ", io="
				+ io + ", money=" + money + ", memo=" + memo + ", cate_name=" + cate_name + "]";
	}

	

}
