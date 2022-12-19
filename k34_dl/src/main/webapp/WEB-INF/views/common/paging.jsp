<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav aria-label="...">
    <ul class="pagination">
        <li class="page-item <c:if test="${list.page == 1}">disabled</c:if> ">
            <a class="page-link" href="/backend/${list.path}/list?page=${list.page - 1}&perpage=${list.perpage}&key=${list.key}" tabindex="-1" aria-disabled="true">Trước</a>
        </li>
        <c:forEach begin="1" end="${list.numberPage}" step="1" var="p">
            <li class="page-item <c:if test="${p==list.page}">active</c:if> ">
                <a class="page-link" href="/backend/${list.path}/list?page=${p}&perpage=${list.perpage}&key=${list.key}">${p}</a>
            </li>
        </c:forEach>
        <li class="page-item <c:if test="${list.page == list.numberPage}">disabled</c:if>">
            <a class="page-link" href="/backend/${list.path}/list?page=${list.page + 1}&perpage=${list.perpage}&key=${list.key}">Sau</a>
        </li>
    </ul>
</nav>