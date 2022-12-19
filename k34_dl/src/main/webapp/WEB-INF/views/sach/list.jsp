<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<div class="container-fluid">
    <div >
        <h1>Danh sách sách</h1>
    </div>
    <br>
</div>
<div class="container">
    <span style="color: red">${message}</span>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Tên sách</th>
            <th scope="col">Tác giả</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="sach">
            <tr>
                <th scope="row">${sach.id}</th>
                <td>${sach.name}</td>
                <td>${sach.author}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="/WEB-INF/views/common/foot.jsp"%>