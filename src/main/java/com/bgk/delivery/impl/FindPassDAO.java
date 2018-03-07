package com.bgk.delivery.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import com.bgk.delivery.service.FindPassDTO;


public class FindPassDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public FindPassDAO() {
		//커넥션 풀 미 사용-커넥션 객체 메모리에 직접 생성 코드
		
		try {
			//드라이버 로딩]
			Class.forName("oracle.jdbc.OracleDriver");
			//데이타베이스 연결]
			conn = DriverManager.getConnection("jdbc:oracle:thin:@220.127.242.43:1521:XE","burger","burger");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {}
	}
	
	public List<FindPassDTO> selectList(){
		
		List<FindPassDTO> list = new Vector<FindPassDTO>();
		String sql="SELECT * FROM member_findpass";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				FindPassDTO dto = new FindPassDTO();
				dto.setFindpass_no(rs.getString(1));
				dto.setFindpass_ask(rs.getString(2));
				
				list.add(dto);
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return list;
	}
}