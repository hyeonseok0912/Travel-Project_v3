package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travel.dto.BoardDTO;

public class BoardDAO extends AbstractDAO {

	public List<BoardDTO> boardList() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT tboard_no, tboard_title, tboard_write, tboard_count, tboard_date, tboard_like"
				+ " FROM tboard";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setNo(rs.getInt("tboard_no"));
				e.setTitle(rs.getString("tboard_title"));
				e.setWrite(rs.getString("tboard_write"));
				e.setCount(rs.getInt("tboard_count"));
				e.setDate(rs.getString("tboard_date"));
				e.setLike(rs.getInt("tboard_like"));

				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
	}

	public List<BoardDTO> outboardList() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT tboard_no, tboard_title, tboard_write, tboard_count, tboard_date, tboard_like, tboard_inout"
				+ " FROM tboard WHERE tboard_inout=1";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setNo(rs.getInt("tboard_no"));
				e.setTitle(rs.getString("tboard_title"));
				e.setWrite(rs.getString("tboard_write"));
				e.setCount(rs.getInt("tboard_count"));
				e.setDate(rs.getString("tboard_date"));
				e.setLike(rs.getInt("tboard_like"));
				e.setInout(rs.getInt("tboard_inout"));
				list.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return list;
	}

}
