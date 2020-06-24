package donWorry;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class donWorryDAO {
	//singleton pattern (connect sql)
	public static donWorryDAO donworryDAO = null;
	
	public static donWorryDAO getInstance(){
		if(donworryDAO==null) {
			donworryDAO = new donWorryDAO();
		}
		return donworryDAO;
	}
	
	private donWorryDAO() {
		try {
			Class.forName("net.sf.log4jdbc.DriverSpy");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private Connection getConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@localhost:1521:xe","don","don123");
	}
	
	public boolean insertdonWorry(MembersDTO membersDTO) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into members(no, id, password, name, email) ");
		sql.append(" values (members_no_seq.nextval, ?, ?, ?, ?) ");
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, membersDTO.getId());
			pstmt.setString(2, membersDTO.getPassword());
			pstmt.setString(3, membersDTO.getName());
			pstmt.setString(4, membersDTO.getEmail());
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

	public String checkdonWorry(MembersDTO membersDTO) throws SQLException {
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
