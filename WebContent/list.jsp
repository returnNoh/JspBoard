<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="NIW.*,java.util.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
		request.setCharacterEncoding("UTF-8");
		BoardDAO dao = new BoardDAO();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
		//1 현재페이지
		String PageNum = request.getParameter("pageNum"); // 문자열 현재페이지
		if(PageNum==null)PageNum="1";
		int currentPage = Integer.parseInt(PageNum); // 숫자 현재페이지
		

		//3 보여줄 단위 개수 (레코드 , 페이지 , 블록 ) 설정
				int pageSize = 10;         // 한페이지당 보여주는 레코드갯수    
			    int blockSize = 10;    //한 블록당 보여주는 페이지의 수
		
		//2 전체 레코드 개수 확인
		int count = dao.getArticleCount(); // 레코드개수
			    
		// DB상의 레코드 시작 번호 limit 수치
		int startRow = (currentPage-1)*pageSize+1;
		// 
		int endRow = currentPage*pageSize;
		
		//4 전체 레코드 수를 참고하여 전체 페이지, 블록 설정
		 int totalPage=(int)Math.ceil((double)count/pageSize) ;			//전체 페이지 개수
		int totalBlock=(int)Math.ceil((double)totalPage/blockSize);		//전체 블록 개수
		
	    
		int beginPerPage =   currentPage * pageSize;
		
		
		
		
		ArrayList<BoardDTO> list = dao.getArticles(currentPage, pageSize);
		BoardDTO dto = null;
			
%>
<body bgcolor="#e0ffff">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
<tr>
    <td align="right" bgcolor="#b0e0e6">
    <a href="writeForm.jsp">글쓰기</a>
    </td>
</table>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="#b0e0e6"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
   <tr height="30">
    <td align="center"  width="50" ></td>
    <td  width="250" >
	
	  <img src="images/level.gif" width="0" height="16">
	  <img src="images/re.gif">
	  <img src="images/level.gif" width="0" height="16">          
      <a href="content.jsp?num=3&pageNum=1">
           게시판연습</a> 
         <img src="images/hot.gif" border="0"  height="16"> </td>
    <td align="center"  width="100"> 
       <a href="mailto:nup49rok1@empal.com">이연수</a></td>
    <td align="center"  width="150">2006/12/26</td>
    <td align="center"  width="50">3</td>
    <td align="center" width="100" >127.0.0.1</td>
  </tr>
  <%for(int i=0;i<list.size();i++){ dto=list.get(i); System.out.println(dto.getRe_level()); %>
  <tr align="center">
  <td><%=dto.getNum()%></td><td align="left"><%for(int k=0;k<dto.getRe_level();k++){%><img src="images/re.gif" width="0" height="16"><%}%><a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a></td><td><%=dto.getWriter()%></td>
  <td><%=dto.getReg_date()%></td><td><%=dto.getReadcount()%></td><td><%=dto.getIp()%></td>
  </tr>
  <%} %>
  
</table>
</center>
</body>
</html>