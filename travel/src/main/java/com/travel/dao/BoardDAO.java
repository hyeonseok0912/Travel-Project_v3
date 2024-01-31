package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travel.dto.BoardDTO;
import com.travel.dto.CommentDTO;

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
	// 상세보기 가져오기
	public BoardDTO detail(int no) {
		BoardDTO dto = new BoardDTO();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT b.tboard_no, b.tboard_title, b.tboard_content, m.mname AS tboard_write, b.tboard_date, (SELECT COUNT(*) FROM tvisit WHERE tboard_no=b.tboard_no) AS tboard_count "
				+ "FROM tboard b JOIN tmember m ON b.mno=m.mno "
				+ "WHERE b.tboard_no=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setNo(rs.getInt("tboard_no"));
				dto.setTitle(rs.getString("tboard_title"));
				dto.setContent(rs.getString("tboard_content"));
				dto.setWrite(rs.getString("tboard_write"));
				dto.setDate(rs.getString("tboard_date"));
				dto.setCount(rs.getInt("tboard_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		return dto;
	}
	// 디테일에 댓글목록 가져오기
	public List<CommentDTO> commentList(int no) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM tcommentview WHERE board_no=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setCno(rs.getInt("cno"));
				dto.setTboard_no(rs.getInt("board_no"));
				dto.setCcomment(rs.getString("ccomment"));
				dto.setCdate(rs.getString("cdate"));
				dto.setClike(rs.getInt("clike"));
				dto.setMno(rs.getInt("mno"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}
}
