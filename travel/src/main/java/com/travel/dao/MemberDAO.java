package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) as count WHERE mid=?";
		int result = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return result;
	}

}
