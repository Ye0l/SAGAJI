package sagaji;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class classifyDAO extends LoginDAO{
	public ArrayList<String> getAuthClassify() throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		Statement st = null;
		
		String sql = "SELECT DISTINCT AUTHOR FROM BOOKS";
		st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()) {
			result.add(rs.getString("AUTHOR"));
		}
		
		return result;
	}
	
	public ArrayList<String> getCompClassify() throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		Statement st = null;
		
		String sql = "SELECT DISTINCT COMPANY FROM BOOKS";
		st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()) {
			result.add(rs.getString("COMPANY"));
		}
		
		return result;
	}
	
	public ArrayList<String> getGenreClassify() throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		Statement st = null;
		
		String sql = "SELECT DISTINCT GENRE FROM BOOKS";
		st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()) {
			result.add(rs.getString("GENRE"));
		}
		
		return result;
	}

	public ArrayList<BookDTO> getClassifyBook(int p, String auth, String comp, String genre) throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM(SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%%'"
				+ (auth.equals("") ? "" : " AND AUTHOR = ?")
				+ (comp.equals("") ? "" : " AND COMPANY = ?")
				+ (genre.equals("") ? "" : " AND GENRE = ?")
				+ ") RS) WHERE NUM BETWEEN ? AND ?";
		
		pstmt = con.prepareStatement(sql);
		int i = 1;
		if(!auth.equals("")) {pstmt.setString(i, auth); i++;}
		if(!comp.equals("")) {pstmt.setString(i, comp); i++;}
		if(!genre.equals("")) {pstmt.setString(i, genre); i++;}
		pstmt.setInt(i++, (p-1)*5+1);
		pstmt.setInt(i++, p*5);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<BookDTO> dtos = new ArrayList<BookDTO>();
		
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setBookid(rs.getString("BOOKID"));
			dto.setAuthor(rs.getString("AUTHOR"));
			dto.setBookname(rs.getString("BOOKNAME"));
			dto.setCompany(rs.getString("COMPANY"));
			dto.setGenre(rs.getString("GENRE"));
			dto.setStory(rs.getString("STORY"));
			
			dtos.add(dto);
		}
			
		return dtos;
	}
	
	public int getClassifyCount(String auth, String comp, String genre) throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%%'"
				+ (auth.equals("") ? "" : " AND AUTHOR = ?")
				+ (comp.equals("") ? "" : " AND COMPANY = ?")
				+ (genre.equals("") ? "" : " AND GENRE = ?");
		
		pstmt = con.prepareStatement(sql);
		int i = 1;
		if(!auth.equals("")) {pstmt.setString(i, auth); i++;}
		if(!comp.equals("")) {pstmt.setString(i, comp); i++;}
		if(!genre.equals("")) {pstmt.setString(i, genre); i++;}
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<BookDTO> dtos = new ArrayList<BookDTO>();
		
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setBookid(rs.getString("BOOKID"));
			dto.setAuthor(rs.getString("AUTHOR"));
			dto.setBookname(rs.getString("BOOKNAME"));
			dto.setCompany(rs.getString("COMPANY"));
			dto.setGenre(rs.getString("GENRE"));
			dto.setStory(rs.getString("STORY"));
			
			dtos.add(dto);
		}
		
		return dtos.size();
	}

}
