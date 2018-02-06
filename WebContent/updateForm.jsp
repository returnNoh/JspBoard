<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="NIW.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#e0ffff" onload="set_value()">  

<%
request.setCharacterEncoding("UTF-8");
int num =1;
if(request.getParameter("num")!=null)
num = Integer.parseInt(request.getParameter("num"));
int pageNum=1;
if(request.getParameter("pageNum")!=null)
pageNum =Integer.parseInt(request.getParameter("pageNum"));



BoardDAO dao = new BoardDAO();
//System.out.println(request.getParameter("num"));
BoardDTO dto = dao.getUpdateContent(num);
//원래 있던 게시글 확인 메소드를 사용하면 조회수가 증가하므로 조회수 증가를 막고싶다면 따로 메소드를 만들거나 조건을 주어야한다.
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh mm");




%>

<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="<%=dto.getWriter()%>">
	   <input type="hidden" name="num" value="<%=num%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="<%=dto.getSubject()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="email" value="<%=dto.getEmail()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40"><%=dto.getContent()%></textarea></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="passwd">
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2 bgcolor="#b0e0e6" align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>     
</body>
</html>      