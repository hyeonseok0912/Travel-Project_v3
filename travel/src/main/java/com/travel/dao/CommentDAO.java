package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.travel.db.DBConnection;
import com.travel.dto.CommentDTO;

public class CommentDAO {

	public void commentWrite(CommentDTO dto) {
		DBConnection db = DBConnection.getInstance();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ";
	}

}
