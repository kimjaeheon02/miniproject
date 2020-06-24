package donWorry;

import java.io.Serializable;

public class CategoryDTO implements Serializable{
	private int no ;
	private String cate_name;
	private String id;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "CategoryDTO [no=" + no + ", cate_name=" + cate_name + ", id=" + id + "]";
	}
	
	
}
