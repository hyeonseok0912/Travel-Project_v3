package com.travel.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.travel.dto.CommentDTO;

public class CommentDAO extends AbstractDAO { 
	
	// 댓글쓰기
	public int commentWrite(CommentDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO tcomment (ccoment, tboard_no, mno) VALUES(?, ?, (SELECT mno FROM tmember mid=?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCcomment());
			pstmt.setInt(2, dto.getTboard_no());
			pstmt.setString(3, dto.getMid());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;


	
}
	// 댓글 삭제하기
	public int commentDelete(CommentDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE comment SET cdel='0' WHERE cno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getCno());
			pstmt.setString(2, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return result;
	}
}
