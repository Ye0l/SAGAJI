package sagaji;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDAO extends LoginDAO{
	public ArrayList<ReviewDTO> getReviewList(String bookId) throws SQLException, ClassNotFoundException{
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT R.* ,(SELECT COUNT(*) FROM COMMENTS C WHERE C.REVIEW_REVIEWID = R.REVIEWID) COMMENTS FROM REVIEW R WHERE BOOKS_BOOKID = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bookId);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ReviewDTO> dtos = new ArrayList<ReviewDTO>();
		
		while(rs.next()) {
			ReviewDTO dto = new ReviewDTO();
			dto.setBookid(rs.getString("BOOKS_BOOKID"));
			dto.setReviewid(rs.getString("REVIEWID"));
			dto.setContents(rs.getString("CONTENTS"));
			dto.setRating(rs.getString("RATING"));
			dto.setUserid(rs.getString("USERS_USERID"));
			dto.setComments(rs.getString("COMMENTS"));
			
			dtos.add(dto);
		}
		
		return dtos;
	}
	
	public void sendReview(String contents, String bookid, String userid) throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO REVIEW(REVIEWID, CONTENTS, RATING, BOOKS_BOOKID, USERS_USERID)"
				+ "VALUES(REVIEW_ID_SEQ.NEXTVAL, ?, ?, ?, ?)";
				
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, contents);
		pstmt.setString(2, "5");
		pstmt.setString(3, bookid);
		pstmt.setString(4, userid);
		
		pstmt.executeQuery();
		
	}

}
