<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="NIW.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("UTF-8");

// num , writer , subject , email , content , passwd

%>
<jsp:useBean id="dto" class="NIW.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
BoardDAO dao = new BoardDAO();
String pageNum = request.getParameter("pageNum");
boolean check = dao.boardUpdate(dto);

if(check){
%>
<script>
alert("수정 성공");
location.href = "list.jsp?pageNum=<%=pageNum%>";
<%--  
<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>" 
태그로 이동하는방법.(html로 이동하는법)  오타나면 흰화면만 나옴
--%>
</script>
<%}else{ %>
<script>
alert("수정 실패");
history.back();
</script>
<%}%>
</head>
<body>

</body>
</html>