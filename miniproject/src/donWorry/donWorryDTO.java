package donWorry;

import java.io.Serializable;

public class donWorryDTO implements Serializable{
	private String id;
	private String name;
	private String password;
	private String email;
	
	private String date;
	private Long income;
	private Long expense;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Long getIncome() {
		return income;
	}
	public void setIncome(Long income) {
		this.income = income;
	}
	public Long getExpense() {
		return expense;
	}
	public void setExpense(Long expense) {
		this.expense = expense;
	}
	@Override
	public String toString() {
		return "donWorryDTO [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", date="
				+ date + ", income=" + income + ", expense=" + expense + "]";
	}
	
	
	
	
}
