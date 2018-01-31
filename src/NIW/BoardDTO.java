package NIW;

import java.sql.Timestamp;

public class BoardDTO {
		//분류필드 -> 공지,자유,답변 등..
	private int num; // 게시물 구분번호(article)
	private String writer;//작성 
	private String subject; // 글제목 -> 글 상세보기로 연결
	private String email; // 이메일
	private String content; // 내용  오라클 -> varchar2(4000)   // mysql -> text
	private String passwd; // 게시물암호
	
	private Timestamp reg_date; // 작성날짜  오라클 -> sysdate  //  mysql -> now()
	
	private int readcount; // 조회수 -> default 0
	private String ip; // 작성자의 ip 주소출력 -> request.getRemoteAddr()
	//여기까지가 자유게시판  대댓글 , 답게시글 없는 게시판
	//댓글다는필드 추가 3개
}
