<%--
  Created by IntelliJ IDEA.
  User: cordier
  Date: 31/08/2019
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erreur interne</title>
</head>
<body>

   Oups Erreur Interne : ${requestScope.messageErreur}
   <br>
   Veuillez cliquer sur ce lien pour continuer <a href="<%=request.getContextPath()%>/index.jsp">Cliquez ici</a>

</body>
</html>
