<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="NIW.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%

BoardDAO dao = new BoardDAO();
//System.out.println(request.getParameter("num"));

int num = 0;
num = Integer.parseInt(request.getParameter("num"));
BoardDTO dto = dao.getContent(num);

%>

<body bgcolor="#e0ffff" onload="setting()">  
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">글번호</td>
    <td align="center" width="125" align="center">
	     <%=dto.getNum()%></td>
    <td align="center" width="125" bgcolor="#b0e0e6">조회수</td>
    <td align="center" width="125" align="center">
	     <%=dto.getReadcount() %></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">작성자</td>
    <td align="center" width="125" align="center">
	     <%=dto.getWriter() %></td>
    <td align="center" width="125" bgcolor="#b0e0e6" >작성일</td>
    <td align="center" width="125" align="center">
	     <%=dto.getReg_date() %></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=dto.getSubject() %></td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="#b0e0e6">글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=dto.getContent() %></pre></td>
  </tr>
  
  <tr height="30">      
    <td colspan="4" bgcolor="#b0e0e6" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.jsp?num=<%=dto.getNum()%>&pageNum=1'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='deleteForm.jsp?num=<%=dto.getNum()%>&pageNum=2'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="답글쓰기" 
       onclick="document.location.href='writeForm.jsp?num=4&ref=0&re_step=0&re_level=0'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='list.jsp?pageNum=1'">
    </td>
  </tr>
</table>    
</form>      
</body>
</html>      
