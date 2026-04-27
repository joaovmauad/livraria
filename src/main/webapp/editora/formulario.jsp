<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<h2>${editora != null ? 'Editar' : 'Nova'} Editora</h2>
<form action="${editora != null ? 'atualizar' : 'inserir'}" method="post">
    <c:if test="${editora != null}"><input type="hidden" name="id" value="${editora.id}" /></c:if>
    CNPJ: <input type="text" name="cnpj" value="${editora.cnpj}" required /><br/>
    Nome: <input type="text" name="nome" value="${editora.nome}" required /><br/>
    <input type="submit" value="Salvar" />
</form>
</body>
</html>