package sagaji;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentsDAO extends LoginDAO{
	public ArrayList<CommentsDTO> getComments(String reviewid) throws SQLException, ClassNotFoundException{
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM COMMENTS WHERE REVIEW_REVIEWID = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, reviewid);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CommentsDTO> dtos = new ArrayList<CommentsDTO>();
		
		while(rs.next()) {
			CommentsDTO dto = new CommentsDTO();
			dto.setContents(rs.getString("CONTENTS"));
			dto.setUserid(rs.getString("USERS_USERID"));
			dto.setWritetime(rs.getString("WRITETIME"));
			
			dtos.add(dto);
		}
		
		return dtos;
	}
}
