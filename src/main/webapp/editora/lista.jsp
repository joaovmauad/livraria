<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gerenciamento de Editoras</title>
</head>
<body>
<h1>Gerenciamento de Editoras</h1>
<h2>
    <a href="${pageContext.request.contextPath}/editoras/cadastro">Adicionar Nova Editora</a>
</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>CNPJ</th>
        <th>Nome</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="editora" items="${listaEditoras}">
        <tr>
            <td>${editora.id}</td>
            <td>${editora.cnpj}</td>
            <td>${editora.nome}</td>
            <td>
                <a href="${pageContext.request.contextPath}/editoras/edicao?id=${editora.id}">Edição</a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/editoras/remover?id=${editora.id}" onclick="return confirm('Tem certeza?');">Remoção</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="${pageContext.request.contextPath}/">Voltar ao Menu Principal</a>
</body>
</html>