<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<h2>Lista de Editoras</h2>
<a href="cadastro">Nova Editora</a><br/><br/>
<table border="1">
    <tr><th>ID</th><th>CNPJ</th><th>Nome</th><th>Ações</th></tr>
    <c:forEach var="editora" items="${listaEditoras}">
        <tr><td>${editora.id}</td><td>${editora.cnpj}</td><td>${editora.nome}</td>
            <td><a href="edicao?id=${editora.id}">Editar</a> | <a href="remover?id=${editora.id}">Remover</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="${pageContext.request.contextPath}/">Voltar</a>
</body>
</html>