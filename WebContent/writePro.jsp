<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="NIW.*,java.sql.Timestamp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="NIW.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
System.out.println("writePro 들어옴");
Timestamp temp = new Timestamp(System.currentTimeMillis());
dto.setReg_date(temp);
dto.setIp(request.getRemoteAddr());
BoardDAO dao = new BoardDAO();

dao.insertArticle(dto);

response.sendRedirect("list.jsp"); 
%>

<body>

</body>
</html>