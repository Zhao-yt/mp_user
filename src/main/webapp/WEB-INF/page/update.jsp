<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <script type="text/javascript" src = "<%=request.getContextPath() %>\res\js\jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function update () {
            $.post("<%=request.getContextPath() %>/user/update",
                $("#fm").serialize(),
                function (data) {
                    if (data.code == "200") {
                        alert ("修改成功");
                        window.location.href = "<%=request.getContextPath() %>/user/toShow"
                    }
                })
        }

    </script>
</head>
<body>
    <form id="fm">
        <input type = "hidden" name = "id" value = "${user.id}"/>
        用户名:<input type = "text" name = "userName" value = "${user.userName}"/><p>
        密码:<input type = "text" name = "userPwd" value = "${user.userPwd}"/><p>
        年龄:<input type = "text" name = "age" value = "${user.age}"/><p>
        性别:
        男<input type = "radio" name = "sex" <c:if test="${user.sex == 1}">checked = "checked"</c:if> value = "1"/>
        女<input type = "radio" name = "sex" <c:if test="${user.sex == 2}">checked = "checked"</c:if> value = "2"/><p>
        手机号:<input type = "text" name = "phoneNumber" value = "${user.phoneNumber}"/><p>
        <select name = "classes">
            <optgroup label="班级">
                <option value = "请选择">请选择</option>
                <option value = "1904"  <c:if test="${user.classes == 1904}">selected="selected"</c:if> >1904</option>
                <option value = "1905" <c:if test="${user.classes == 1905}">selected="selected"</c:if> >1905</option>
                <option value = "1906" <c:if test="${user.classes == 1906}">selected="selected"</c:if> >1906</option>
            </optgroup>
        </select><p>
        职位:
        老师<input type = "radio" name = "type" <c:if test="${user.type == 1}">checked = "checked"</c:if> value = "1"/>
        学生<input type = "radio" name = "type" <c:if test="${user.type == 2}">checked = "checked"</c:if> value = "2"/>
        主任<input type = "radio" name = "type" <c:if test="${user.type == 3}">checked = "checked"</c:if> value = "3"/>
        <input type = "button" value = "修改" onclick = "update ()"/>
    </form>
</body>
</html>