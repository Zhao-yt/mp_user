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
        function add () {
            $.post("<%=request.getContextPath() %>/user/insert",
                $("#fm").serialize(),
                function (data) {
                    if (data.code == "200") {
                        alert ("添加成功");
                        window.location.href = "<%=request.getContextPath() %>/user/toShow"
                    }
                })
        }

    </script>
</head>
<body>
    <form id="fm">
        用户名:<input type = "text" name = "userName"/><p>
        密码:<input type = "text" name = "userPwd"/><p>
        年龄:<input type = "text" name = "age"/><p>
        性别:
        男<input type = "radio" name = "sex" value = "1"/>
        女<input type = "radio" name = "sex" value = "2"/><p>
        手机号:<input type = "text" name = "phoneNumber"/><p>
        班级:
        <select name = "classes">
            <optgroup label="请选择">
                <option value = "班级">班级</option>
                <option value = "1904">1904</option>
                <option value = "1905">1905</option>
                <option value = "1906">1906</option>
            </optgroup>
        </select><p>
        职位:
        老师<input type = "radio" name = "type" value = "1"/>
        学生<input type = "radio" name = "type" value = "2"/>
        主任<input type = "radio" name = "type" value = "3"/>
        <input type = "button" value = "添加" onclick = "add ()"/>
    </form>
</body>
</html>