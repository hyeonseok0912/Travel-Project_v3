package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travel.dto.BoardDTO;
import com.travel.dto.CommentDTO;
import com.travel.dto.MemberDTO;

public class MemberDAO extends AbstractDAO {

	// 로그인 메소드
	public MemberDTO login(MemberDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) as count, mname FROM tmember WHERE mid=? AND mpw=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setCount(rs.getInt("count"));
				dto.setMname(rs.getString("mname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return dto;
	}

	// myInfo 메서드
	public MemberDTO myInfo(MemberDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM tmember WHERE mid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMno(rs.getInt(1));
				dto.setMid(rs.getString(2));
				dto.setMpw(rs.getString(3));
				dto.setMname(rs.getString(4));
				dto.setMdate(rs.getString(5));
				dto.setMgrade(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return dto;
	}

	public int idCheck(MemberDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM tmember WHERE mid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return result;
	}

	// 비밀번호 수정 메서드
	public int newpw(MemberDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE tmember SET mpw=? WHERE mid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMpw());
			pstmt.setString(2, dto.getMid());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}

	// 내가 쓴 글 뽑아내기 메서드
	public List<BoardDTO> mylist(MemberDTO dto) {

		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT t.tboard_no, t.tboard_title, t.tboard_date, t.tboard_count, t.tboard_like FROM tboard t JOIN tmember m ON t.mno = m.mno WHERE m.mid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setNo(rs.getInt("tboard_no"));
				e.setTitle(rs.getString("tboard_title"));
				e.setDate(rs.getString("tboard_date"));
				e.setCount(rs.getInt("tboard_count"));
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

	// 회원가입
	public int join(MemberDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO tmember (mid, mname, mpw) VALUES(?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getMpw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}

		return result;
	}

	// 내가 쓴 댓글 뽑아내기 메서드
	public List<CommentDTO> myclist(MemberDTO dto) {

		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT t.tboard_no, t.ccomment, t.cdate, t.clike, t.cdel FROM tcomment t JOIN tmember m ON t.mno = m.mno JOIN tboard b on t.tboard_no = b.tboard_no WHERE m.mid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO e = new CommentDTO();
				e.setTboard_no(rs.getInt("tboard_no"));
				e.setCcomment(rs.getString("ccomment"));
				e.setCdate(rs.getString("cdate"));
				e.setClike(rs.getInt("clike"));
				e.setCdel(rs.getInt("cdel"));
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
