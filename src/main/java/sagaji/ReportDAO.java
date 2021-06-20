package sagaji;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ReportDAO extends LoginDAO{
	public ArrayList<ReportDTO> getReportList(int p) throws SQLException, ClassNotFoundException{
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(select r.*, (select bookname from books b where b.bookid = r.books_bookid) bookname from reports r order by r.writedate desc) RS) WHERE NUM BETWEEN ? AND ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, (p-1)*7+1);
		pstmt.setInt(2, p*7);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ReportDTO> dtos = new ArrayList<ReportDTO>();
		while(rs.next()) {
			ReportDTO dto = new ReportDTO();
			dto.setReportid(rs.getString("REPORTID"));
			dto.setContents(rs.getString("CONTENTS"));
			dto.setDate(rs.getString("WRITEDATE"));
			dto.setBookname(rs.getString("BOOKNAME"));
			dto.setUserid(rs.getString("USERS_USERID"));
			dto.setBookid(rs.getString("BOOKS_BOOKID"));
			
			dtos.add(dto);
		}
		
		return dtos;
	}
	
	public int getReportCount() throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		Statement st = null;
		
		String sql = "select r.*, (select bookname from books b where b.bookid = r.books_bookid) bookname from reports r order by r.writedate desc";
		
		st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		ArrayList<ReportDTO> dtos = new ArrayList<ReportDTO>();
		while(rs.next()) {
			ReportDTO dto = new ReportDTO();
			dto.setReportid(rs.getString("REPORTID"));
			dto.setContents(rs.getString("CONTENTS"));
			dto.setDate(rs.getString("WRITEDATE"));
			dto.setBookname(rs.getString("BOOKNAME"));
			dto.setUserid(rs.getString("USERS_USERID"));
			dto.setBookid(rs.getString("BOOKS_BOOKID"));
			
			dtos.add(dto);
		}
		
		return dtos.size();
		
	}
	
	public ReportDTO getReport(String reportid) throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "select r.*, (select bookname from books b where b.bookid = r.books_bookid) bookname from reports r where reportid = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, reportid);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		ReportDTO dto = new ReportDTO();
		dto.setReportid(rs.getString("REPORTID"));
		dto.setContents(rs.getString("CONTENTS"));
		dto.setDate(rs.getString("WRITEDATE"));
		dto.setBookname(rs.getString("BOOKNAME"));
		dto.setUserid(rs.getString("USERS_USERID"));
		dto.setBookid(rs.getString("BOOKS_BOOKID"));
		
		return dto;
	}
	
	public void sendReport(String bookid, String userid, String contents) throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO REPORTS(REPORTID, CONTENTS, BOOKS_BOOKID, USERS_USERID)"
				+ "VALUES(REPORTS_ID_SEQ.NEXTVAL, ?, ?, ?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, contents);
		pstmt.setString(2, bookid);
		pstmt.setString(3, userid);
		ResultSet rs = pstmt.executeQuery();
		
	}
}
