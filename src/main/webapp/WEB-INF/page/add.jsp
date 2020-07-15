
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src = "<%=request.getContextPath() %>\res\js\jquery-1.12.4.js"></script>
    <script type="text/javascript">

        function add() {
            $.post("<%=request.getContextPath()%>/user/adds",
                $("#fm").serialize(),
                function(data){
                    if (data.code == 200) {
                        alert("添加成功");
                        location.href = "<%=request.getContextPath()%>/user/toShow";
                        return;
                    }
                })

        }

        var i = 0;
        function adds(){
            i++;
            var html = "<div> <hr/>"
            html += "<input type = 'button' value='-' onclick = 'del(this)' /><p>\n" +
                "       用户名:<input type = \'text\' name = \'list["+i+"].userName\'/><p>\n" +
                "        密码:<input type = \'text\' name = \'list["+i+"].userPwd\'/><p>\n" +
                "        年龄:<input type = \'text\' name = \'list["+i+"].age\'/><p>\n" +
                "        性别:\n" +
                "        男<input type = \'radio\' name = \'list["+i+"].sex\' value = \'1\'/>\n" +
                "        女<input type = \'radio\' name = \'list["+i+"].sex\' value = \'2\'/><p>\n" +
                "        手机号:<input type = \'text\' name = \'list["+i+"].phoneNumber\'/><p>\n" +
                "        班级:\n" +
                "        <select name = \'list["+i+"].classes\'>\n" +
                "            <optgroup label=\'请选择\'>\n" +
                "                <option value = \'班级\'>班级</option>\n" +
                "                <option value = \'1904\'>1904</option>\n" +
                "                <option value = \'1905\'>1905</option>\n" +
                "                <option value = \'1906\'>1906</option>\n" +
                "            </optgroup>\n" +
                "        </select><p>\n" +
                "        职位:\n" +
                "        老师<input type = \'radio\' name = \'list["+i+"].type\' value = \'1\'/>\n" +
                "        学生<input type = \'radio\' name = \'list["+i+"].type\' value = \'2\'/>\n" +
                "        主任<input type = \'radio\' name = \'list["+i+"].type\' value = \'3\'/>"
            $("#adds").append(html);
        }

        function del(obj){
            $(obj).parent().remove();
        }

    </script>
</head>
<body style="text-align: center">
<h2>用户新增</h2>
    <input type='button' value='+' onclick = "adds()"/>

    <form id="fm">
        用户名:<input type = "text" name = "list[0].userName"/><p>
        密码:<input type = "text" name = "list[0].userPwd"/><p>
        年龄:<input type = "text" name = "list[0].age"/><p>
        性别:
        男<input type = "radio" name = "list[0].sex" value = "1"/>
        女<input type = "radio" name = "list[0].sex" value = "2"/><p>
        手机号:<input type = "text" name = "list[0].phoneNumber"/><p>
        班级:
        <select name = "list[0].classes">
            <optgroup label="请选择">
                <option value = "班级">班级</option>
                <option value = "1904">1904</option>
                <option value = "1905">1905</option>
                <option value = "1906">1906</option>
            </optgroup>
        </select><p>
        职位:
        老师<input type = "radio" name = "list[0].type" value = "1"/>
        学生<input type = "radio" name = "list[0].type" value = "2"/>
        主任<input type = "radio" name = "list[0].type" value = "3"/>
        <div id="adds"></div>
        <input type="button" onclick="add()" value="新增"/>
    </form>
</body>
</html>
