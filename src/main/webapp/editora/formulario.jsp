<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Editora</title>
</head>
<body>
<h1>Gerenciamento de Editoras</h1>
<h2>
    <c:if test="${editora != null}">
        Edite a Editora
    </c:if>
    <c:if test="${editora == null}">
        Adicione uma Nova Editora
    </c:if>
</h2>
<form action="${pageContext.request.contextPath}/editoras/${editora != null ? 'atualizar' : 'inserir'}" method="post">
    <table border="1">
        <c:if test="${editora != null}">
            <input type="hidden" name="id" value="${editora.id}" />
        </c:if>
        <tr>
            <th>CNPJ:</th>
            <td>
                <input type="text" name="cnpj" size="18" value="${editora.cnpj}" required/>
            </td>
        </tr>
        <tr>
            <th>Nome:</th>
            <td>
                <input type="text" name="nome" size="45" value="${editora.nome}" required/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Salvar" />
            </td>
        </tr>
    </table>
</form>
<br>
<a href="${pageContext.request.contextPath}/editoras/">Voltar</a>
</body>
</html>