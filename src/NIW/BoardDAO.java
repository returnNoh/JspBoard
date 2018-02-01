package NIW;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BoardDAO {
		
	private DBConnectionMgr pool;
	
	public BoardDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.println("pool");
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	//3. 페이징 처리(페이지별로 화면에 보여주는 레코드수를 조절)
	//1) 전체 레코드수를 구해와야 한다. => select count(*) from board;
	
	public int getArticleCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "select count(*) from board";
		
		try {
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
			count = rs.getInt(1);
			}
			System.out.println("총 레코드 수 :"+count);
			
		}catch(Exception e) {
			System.out.println("getArticleCount 실패"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return count;
	}
	
	//2) 글목록보기에 대한 메소드 구현(범위)
	//select * from board order by ref desc,re_step asc limit ?,?
	//start -> 레코드의 시작번호 end -> 웹상에 보여줄 레코드 번호 // 1-10 11-10 21-10
	public ArrayList<BoardDTO> getArticles(int start,int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		ArrayList<BoardDTO> zipcode = new ArrayList();
		BoardDTO code ;
		
		String sql = "select  * from board order by ref desc,re_step asc limit "+start+","+end;
		try {
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			
			System.out.println(sql);
			System.out.println(rs=pstmt.executeQuery());
			
			
			
			while(rs.next()) {
				
				code = new BoardDTO();
				code.setNum(rs.getInt("num"));
				code.setWriter(rs.getString("writer"));
				code.setEmail(rs.getString("email"));
				code.setSubject(rs.getString("subject"));
				code.setContent(rs.getString("content"));
				code.setPasswd(rs.getString("passwd"));
				code.setReg_date(rs.getTimestamp("reg_date"));
				code.setReadcount(rs.getInt("readcount"));
				code.setIp(rs.getString("ip"));
				code.setRef(rs.getInt("ref"));
				code.setRe_step(rs.getInt("re_step"));
				code.setRe_level(rs.getInt("re_level"));
				zipcode.add(code);
				
			}
			
			
			
			
		}catch(Exception e) {
			System.out.println("게시글 정보불러오기 실패"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return zipcode;
	}
	
		public BoardDTO getContent(int num) {
		
			System.out.println("getContent메소드 시작");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardDTO dto = null;
			
			String sql = "select  * from board where num="+num;
			try {
			
				con=pool.getConnection();
				pstmt=con.prepareStatement(sql);
				
				System.out.println(sql);
				System.out.println(rs=pstmt.executeQuery());
				
				if(rs.next()) {
					dto= new BoardDTO();
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setEmail(rs.getString("email"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setIp(rs.getString("ip"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
				}
			
	}catch(Exception e) {
		System.out.println("게시글 정보불러오기 실패"+e);
	}finally {
		pool.freeConnection(con,pstmt,rs);
	}
			return dto;
	
}	
		public boolean boardWrite() {
			return true;
		}
		public boolean boardDelete(String passwd,int num) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Boolean check=false;
			BoardDTO dto = null;
			
			String sql = "select num from board where passwd='"+passwd+"'";
			try {
			
				con=pool.getConnection();
				pstmt=con.prepareStatement(sql);
				
				System.out.println(sql);
				System.out.println(rs=pstmt.executeQuery());
				if(rs.next()) {
					sql="delete from board where num="+num;
					pstmt=con.prepareStatement(sql);
					if(pstmt.executeUpdate()>0) {
						System.out.println("삭제 성공");
						check=true;
					}
					System.out.println("삭제 실패");
				}System.out.println("비밀번호가 틀립니다.");
			}catch(Exception e) {
				System.out.println("게시글 삭제 실패"+e);
			}finally {
				pool.freeConnection(con,pstmt,rs);
			}

			
			return check;
		}
		
			
}

	
