<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="NIW.*"%>
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

BoardDAO dao = new BoardDAO();
boolean check = dao.boardWrite(dto);

if(check){
%>
<script>
alert("작성 성공")
location.href="list.jsp"
</script>
<%
}else{
%>
<script>
alert("작성 오류")
location.href="list.jsp"
</script>
<%
}
%>
<body>

</body>
</html>