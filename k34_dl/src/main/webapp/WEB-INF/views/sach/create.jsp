<%@page pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<div class="container-fluid">
    <div >
        <h1>Tạo mới sách</h1>
    </div>
    <br>
</div>
<div class="container">
    <span style="color: red">${message}</span>
    <form method="post" action="/sach/save">
        <div class="form-outline mb-4">
            <input type="text" id="form4Example1" name="name" class="form-control" />
            <label class="form-label" for="form4Example1">Name</label>
        </div>
        <!-- Email input -->
        <div class="form-outline mb-4">
            <input type="text" name="author" id="form4Example2" class="form-control" />
            <label class="form-label" for="form4Example2">Tác giả</label>
        </div>
        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Tạo mới</button>
    </form>
</div>
<%@include file="/WEB-INF/views/common/foot.jsp"%>