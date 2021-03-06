<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/store.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../store/store/include/headerBanner.jsp"/>
<jsp:include page="../order/include/cartList.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>