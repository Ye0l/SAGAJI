package sagaji;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BookDAO extends LoginDAO{
	
	public ArrayList<BookDTO> searchBook(String target, int searchType, int p) throws SQLException, ClassNotFoundException{
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		switch (searchType) {
			case 0: { // 모두 검색
				String sql = "SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%'||?||'%' OR AUTHOR LIKE '%'||?||'%') \"RS\") WHERE NUM BETWEEN ? AND ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, target);
				pstmt.setString(2, target);
				pstmt.setInt(3, (p-1)*5+1);
				pstmt.setInt(4, p*5);
				break;
			}
			case 1: { // 제목 검색
				String sql = "SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%'||?||'%') \"RS\") WHERE NUM BETWEEN ? AND ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, target);
				pstmt.setInt(2, (p-1)*5+1);
				pstmt.setInt(3, p*5);
				break;
			}
			case 2: { // 저자 검색
				String sql = "SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE AUTHOR LIKE '%'||?||'%') \"RS\") WHERE NUM BETWEEN ? AND ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, target);
				pstmt.setInt(2, (p-1)*5+1);
				pstmt.setInt(3, p*5);
				break;
			}
		}
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<BookDTO> dtos = new ArrayList<BookDTO>();
		while(rs.next()) {
			BookDTO result = new BookDTO(rs.getString("BOOKNAME"), rs.getString("STORY"), rs.getString("BOOKID"));
			result.setAuthor(rs.getString("AUTHOR"));
			result.setCompany(rs.getString("COMPANY"));
			dtos.add(result);
		}
		
		return dtos;
	}
	
	public int searchCount(String target, int searchType) throws SQLException, ClassNotFoundException{
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		switch (searchType) {
			case 0: { // 모두 검색
				String sql = "SELECT COUNT(*) \"COUNT\" FROM BOOKS WHERE BOOKNAME LIKE '%'||?||'%' OR AUTHOR LIKE '%'||?||'%'";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, target);
				pstmt.setString(2, target);
				break;
			}
			case 1: { // 제목 검색
				String sql = "SELECT COUNT(*) \"COUNT\" FROM BOOKS WHERE BOOKNAME LIKE '%'||?||'%'";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, target);
				break;
			}
			case 2: { // 저자 검색
				String sql = "SELECT COUNT(*) \"COUNT\" FROM BOOKS WHERE AUTHOR LIKE '%'||?||'%'";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, target);
				break;
			}
		}
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		return rs.getInt("COUNT");
	}
	
	public BookDTO getTodayRecommend() throws SQLException, ClassNotFoundException{
		Connection con = getConnection();
		Statement stmt = null;
		
		String sql = "select * from books order by dbms_random.value";
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		BookDTO dto = new BookDTO(rs.getString("BOOKNAME"), rs.getString("STORY"), rs.getString("BOOKID"));
		dto.setAuthor(rs.getString("AUTHOR"));
		
		return dto;
	}
	
	public BookDTO getBook(String bookid) throws SQLException, ClassNotFoundException{
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "select * from books where bookid = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bookid);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		BookDTO dto = new BookDTO(rs.getString("BOOKNAME"), rs.getString("STORY"), rs.getString("BOOKID"));
		dto.setAuthor(rs.getString("AUTHOR"));
		dto.setCompany(rs.getString("COMPANY"));
		
		return dto;
	}
}
