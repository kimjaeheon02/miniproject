package donWorry;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CashBookDAO {
	//singleton pattern (connect sql)
	public static CashBookDAO donworryDAO = null;
	
	public static CashBookDAO getInstance(){
		if(donworryDAO==null) {
			donworryDAO = new CashBookDAO();
		}
		return donworryDAO;
	}
	
	private CashBookDAO() {
		try {
			Class.forName("net.sf.log4jdbc.DriverSpy");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private Connection getConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@localhost:1521:xe","don","don123");
	}
	
	public boolean insertdonWorry(MemberDTO membersDTO) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into members(no, id, password, name, email, regist_date) ");
		sql.append(" values (members_no_seq.nextval, ?, ?, ?, ?, ?) ");
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, membersDTO.getId());
			pstmt.setString(2, membersDTO.getPassword());
			pstmt.setString(3, membersDTO.getName());
			pstmt.setString(4, membersDTO.getEmail());
			pstmt.setString(5, membersDTO.getRegist_date());
			if(pstmt.executeUpdate()>0) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(conn!=null)try {pstmt.close();}catch(Exception e) {}
		}
		return result;
	}

	public String checkdonWorry(MemberDTO membersDTO) throws SQLException {
		String result = "";
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select name ");
		sql.append(" from members ");
		sql.append(" where id = ? ");
		sql.append(" and password = ? ");
		
		try(Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setString(1, membersDTO.getId());
			pstmt.setString(2, membersDTO.getPassword());
			
			try (ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					result = rs.getString("name");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean insertMoney(InputOutputDTO inputoutputDTO) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into input_output(no, id, regdate, category, io, money, memo) ");
		sql.append(" values (input_output_no_seq.nextval, ?, ?, ?, ?, ?, ?) ");
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, inputoutputDTO.getId());
			pstmt.setString(2, inputoutputDTO.getRegdate());
			pstmt.setInt(3, inputoutputDTO.getCategory());
			pstmt.setInt(4, inputoutputDTO.getIo());
			pstmt.setInt(5, inputoutputDTO.getMoney());
			pstmt.setString(6, inputoutputDTO.getMemo());
			
			if(pstmt.executeUpdate()>0) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(conn!=null)try {pstmt.close();}catch(Exception e) {}
		}
		return result;
	}
	
	public boolean insertCategory(String id) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into category (no, cate_name, id)");
		sql.append(" select category_no_seq.nextval, cate_name, ? from base_category");
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			int r = pstmt.executeUpdate();
			if(r>0) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(conn!=null)try {pstmt.close();}catch(Exception e) {}
		}
		return result;
	}
	
	public List<CategoryDTO> getCateList(String id) {
		List<CategoryDTO> list = new ArrayList<>();

		StringBuffer sql = new StringBuffer();
		sql.append(" select no, cate_name");
		sql.append(" from category");
		sql.append(" where id = ?");
		sql.append(" order by no");
		
		try (Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
			pstmt.setString(1,  id);
			try (ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					CategoryDTO categoryDTO = new CategoryDTO();
					categoryDTO.setNo(rs.getInt("no"));
					categoryDTO.setCate_name(rs.getString("cate_name"));
					list.add(categoryDTO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List<InputOutputDTO> getInputOutput(String id) throws SQLException{
		List<InputOutputDTO> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select io.no, to_char(io.regdate,'YYYY/MM/DD') as regdate, io.money, c.cate_name, io.memo,");
		sql.append(" io.io");
		sql.append(" from input_output io left join category c");
		sql.append(" on io.category = c.no");
		sql.append(" where io.id = ?");
		try(Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
			pstmt.setString(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					InputOutputDTO inputoutputDTO = new InputOutputDTO();
					inputoutputDTO.setNo(rs.getInt("no"));
					inputoutputDTO.setRegdate(rs.getString("regdate"));
					inputoutputDTO.setIo(rs.getInt("io"));
					inputoutputDTO.setMoney(rs.getInt("money"));
					inputoutputDTO.setCate_name(rs.getString("cate_name"));
					inputoutputDTO.setMemo(rs.getString("memo"));
					list.add(inputoutputDTO);
				}
			}
		}
		return list;
	}
	
	public boolean deleteInputOutput (InputOutputDTO inputoutputDTO) { //
	      boolean result = false;

	      StringBuffer sql= new StringBuffer();
	      sql.append(" delete input_output");
	      sql.append(" where no = ? and id = ?");
	      
	      
	      try (Connection conn = getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
	         
	         pstmt.setInt(1, inputoutputDTO.getNo());
	         pstmt.setString(2, inputoutputDTO.getId());
	         if(pstmt.executeUpdate() > 0) {
	            result = true;
	         }
	      } catch(Exception e) {
	         e.printStackTrace();
	      } 
	      return result;
	   }

	public boolean insertCategory(CategoryDTO categoryDTO) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into category (no, cate_name, id)");
		sql.append(" values(category_no_seq.nextval, ?, ?)");
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, categoryDTO.getCate_name());
			pstmt.setString(2, categoryDTO.getId());
			int r = pstmt.executeUpdate();
			if(r>0) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(conn!=null)try {pstmt.close();}catch(Exception e) {}
		}
		return result;
	}
	
	public int CalDate(MemberDTO memberDTO) throws SQLException {
		int result = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select to_char(regist_date, 'yyyy') as reg_date");
		sql.append(" from members");
		sql.append(" where id = ?");
		
		try(Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
			
			pstmt.setString(1, memberDTO.getId());
			
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					result = Integer.parseInt(rs.getString("reg_date"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String TotalMoney(InputOutputDTO inputoutputDTO) throws SQLException{
		String result = "";
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select sum(money) as money2");
		sql.append(" from input_output");
		sql.append(" where id like ? and to_char(regdate, 'yyyyMM')  like ? and io = 2");
		sql.append(" group by id");
		
		try(Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
			pstmt.setString(1, inputoutputDTO.getId());
			pstmt.setString(2, inputoutputDTO.getRegdate());
			try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						result = rs.getString("money2");
					}
			}
		}
		return result;
	}
	
//	public boolean AdditionalCategory(String cate_name) {
//		boolean result = false;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		StringBuffer sql = new StringBuffer();
//		sql.append(" insert into category (no, cate_name, id)");
//		sql.append(" values(category_no_seq.nextval, cate_name, ?, ?)");
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, cate_name);
//			pstmt.setString(2, memeberDTO.getId());
//			
//			int r = pstmt.executeUpdate();
//			if(r>0) {
//				result = true;
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
//			if(conn!=null)try {pstmt.close();}catch(Exception e) {}
//		}
//		return result;
//	}
 
	
	/*public List<donWorryDTO> checkdonWorry(){
		List<donWorryDTO> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select name ");
		sql.append(" from members ");
		sql.append(" where id = ? ");
		sql.append(" and password = ? ");
		
		try(Connection conn = getConnection();
				PreparedStatement pstmt = 
						conn.prepareStatement(sql.toString())) {
						
			pstmt.setString(1, "id");
			pstmt.setString(2, "password");
			
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					donWorryDTO donworryDTO = new donWorryDTO();
					donworryDTO.setId(rs.getString("id"));
					donworryDTO.setPassword(rs.getString("password"));
					list.add(donworryDTO);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}*/
}
