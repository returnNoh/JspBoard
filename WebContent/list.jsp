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
				int pageSize = 7;         // 한페이지당 보여주는 레코드갯수    
			    int blockSize = 10;    //한 블록당 보여주는 페이지의 수
		
		//2 전체 레코드 개수 확인
		int count = dao.getArticleCount(); // 레코드개수
			    System.out.println("개수 체크용 "+count);
		// DB상의 레코드 시작 번호 limit 수치
		int startRow = (currentPage-1)*pageSize;
		// 
		int endRow = currentPage*pageSize;
		
		//4 전체 레코드 수를 참고하여 전체 페이지, 블록 설정
	
		
		
	    // beginPerPage  계산  (페이지별게시물 번호 제일 높은것)
		int beginPerPage = count-(currentPage-1)*pageSize;
		
		//number=count-(currentPage-1)*pageSize;
		
		
		ArrayList<BoardDTO> list = null;
		if(count>0){
		list = dao.getArticles(startRow, pageSize);
		}
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
<%
//count에 따라서 데이터를 보여줄 수 있는 코드 작성
if(count==0){

%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
<tr>
<td align="center">게시판에 저장된 글이 없습니다.</td>
</tr>
</table>
<%}else{ %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="#b0e0e6"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
    <%for(int i=0;i<list.size();i++){ dto=list.get(i); %>
   <tr height="30">
    <td align="center"  width="50" ><%=beginPerPage--%></td>
    <td  width="250" >
	<%
	int width_level = 0;
	if(dto.getRe_level()>0){
	width_level = dto.getRe_level()*7;
	%>
	  <img src="images/level.gif" width="<%=width_level%>" height="16">
	  <img src="images/re.gif">
	  <%}else{ %>  
	  <img src="images/level.gif" width="0" height="16">        
	  <%} %>
	  
      <a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
           <%=dto.getSubject()%></a> 
         <%if(dto.getReadcount()>=20){ %>  
         <img src="images/hot.gif" border="0"  height="16"> 
         <%} %>
         </td>
    <td align="center"  width="100"> 
       <a href="mailto:<%=dto.getEmail()%>"><%=dto.getWriter()%></a></td>
    <td align="center"  width="150"><%=sdf.format(dto.getReg_date())%></td>
    <td align="center"  width="50"><%=dto.getReadcount()%></td>
    <td align="center" width="100" ><%=dto.getIp()%></td>
  </tr>
  <%} %>
 
  
  
</table>
 
 
<%
	//전체 페이지수 구하기
// int totalPage=(int)Math.ceil((double)count/pageSize) ;			//전체 페이지 개수1
int pageCount = count/pageSize+(count%pageSize==0?0:1); // 전체 페이지 개수2 둘다 똑같음  
//int totalBlock=(int)Math.ceil((double)totalPage/blockSize);		//전체 블록 개수
int blockCount = 0;
//시작페이지 , 끝페이지
int startPage = 0;
//10의 배수인지
if(currentPage%blockSize!=0){ // 1~9 , 11~19 , 21~22 
	startPage = currentPage/blockSize*blockSize+1;
}else{ //10,20,30,40
	
	startPage=((currentPage/blockSize)-1)*blockSize+1;
	
}
int endPage = startPage+blockSize-1;
%>
<tr align="center">
  <% if(endPage>pageCount){ endPage=pageCount; }// 마지막페이지 = 총페이지수 %>
  
  <%if(startPage>blockSize){ %>
  <a href="list.jsp?pageNum=<%=startPage-blockSize%>">[이전]</a>
  <% }%>
 <td><%for(int i=startPage;i<=endPage;i++){ %>
 <%if(i==currentPage){ %>
 <a href="list.jsp?pageNum=<%=i%>"><b><%=i%></b></a>
 <%}else{ %>
 <a href="list.jsp?pageNum=<%=i%>"><%=i%></a>
 <%}}//for%>
 
 <%if(endPage<pageCount){ %>
 <a href="list.jsp?pageNum=<%=endPage+1%>">[다음]</a>
 <%} %>
 
 <%
 }//if%>
 
 </td>
  </tr>
</center>
</body>
</html>