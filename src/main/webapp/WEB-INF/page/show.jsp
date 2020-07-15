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

        var pages = 0;

        var userIds = null;

        function selectedValue(){
            userIds = $('input[name = "userIds"]:checked');
            var chk_value = [];
            $.each(userIds,function(){
                chk_value.push($(this).val());
            })
            $("#findByIds").val(chk_value);
            return chk_value;
        }

        $(function () {
            show();
        })

        function search() {
            $("#tbd").empty();
            $("#pageNo").val(1);
            show();
        }

        function show(){
            $.post("<%=request.getContextPath() %>/user/getList",
                $("#fm").serialize(),
                function(data){
                    if(data.code != 200){
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    var pageHtml = "";
                    for(var i = 0; i <data.data.list.length; i++){
                        var user = data.data.list[i]
                        html += "<tr>"
                        html += "<td><input type = 'checkbox' name = 'userIds' value = '"+user.id+"'/></td>"
                        html += "<td>"+user.userName+"</td>"
                        html += "<td>"+user.userPwd+"</td>"
                        html += "<td>"+user.age+"</td>"
                        if(user.sex == 1) {
                            html += "<td>男</td>"
                        }else {
                            html += "<td>女</td>"
                        }
                        html += "<td>"+user.phoneNumber+"</td>"
                        html += "<td>"+user.classes+"</td>"
                        if(user.sex == 1) {
                            html += "<td>男</td>"
                        }else {
                            html += "<td>女</td>"
                        }
                        if(user.type == 1) {
                            html += "<td>老师</td>"
                        }else if (user.type == 2) {
                            html += "<td>学生</td>"
                        }else {
                            html += "<td>主任</td>"
                        }
                        html += "<td><input type = 'button' value = '修改' onclick = 'findUserById("+user.id+")'/><input type = 'button' value = '删除' onclick = 'del("+user.id+")'/></td>"
                        html += "</tr>";
                    }
                    // pages = data.data.pages;
                    $("#tbd").append(html)
                    // var page = $("#pageNo").val();
                    // if (page < pages){
                    //     $("#pageDiv").html("<a href = 'javascript:page("+(page*1 +1)+")'>加载更多</a>")
                    // }else {
                    //     $("#pageDiv").html("底线");
                    // }
                    pageHtml += "<input type = 'button' value = '加载更多' onclick = 'page("+data.data.pages+")'/>";
                    $("#pageDiv").html(pageHtml);
                })
        }

        //删除
        function del (id) {
            $.post("<%=request.getContextPath() %>/user/delete",
                {"id":id},
                function (data) {
                    if(data.code == "200") {
                        alert("删除成功");
                        window.location.href = "<%=request.getContextPath() %>/user/toShow"
                    }
                })
        }
        //去修改
        function findUserById(id) {
            window.location.href = "<%=request.getContextPath() %>/user/get?id="+id
        }

        function add() {
            window.location.href = "<%=request.getContextPath() %>/user/toAdd"
        }

        function page(pages){
            var page = $("#pageNo").val();
            if(parseInt(page) +1 > pages){
                $("#pageDiv").html("--我是有底线的--");
                return;
            }
            $("#pageNo").val(parseInt(page) +1);
            show();
        }

        // function page(pages){
        //     $("#pageNo").val(pages);
        //     show();
        // }

        function adds() {
            window.location.href = "<%=request.getContextPath() %>/user/toAdds"
        }

        function dels(){
            if(selectedValue() < 1){
                alert("至少选择一位用户进行操作");
                return;
            }
            if(confirm("确认删除吗") == true){
                var selectedCheckBox = selectedValue();
                $.post("<%=request.getContextPath() %>/user/delUser",
                    {"ids":selectedCheckBox},
                    function(data){
                        if(data.code == "200"){
                            alert("删除成功");
                        }
                        location.href = "<%=request.getContextPath() %>/user/toShow"
                    })
            }
        }
    </script>
</head>
<body>
    <form id = "fm">
        <input type = "hidden" id = "findByIds" name = "ids"/>
        根据手机号:<input type = "text" name = "phoneNumber"/>
        老师<input type = "checkbox" name = "type" value = "1"/>
        学生<input type = "checkbox" name = "type" value = "2"/>
        主任<input type = "checkbox" name = "type" value = "3"/>
        <input type = "button" value = "查询" onclick = "search()"/>
        <input type = "hidden" id = "pageNo" value = "1" name="pageNo"/>
    </form>
    <input type = "button" value = "添加" onclick="add()"/>
    <input type = "button" value = "批量添加" onclick="adds()"/>
    <input type = "button" value = "批量删除" onclick="dels()"/>
    <table>
        <tr>
            <th></th>
            <th>用户名</th>
            <th>用户密码</th>
            <th>年龄</th>
            <th>性别</th>
            <th>手机号</th>
            <th>班级</th>
            <th>职位</th>
            <th>操作</th>
        </tr>
        <tbody id = "tbd">

        </tbody>
    </table>
    <div id = "pageDiv"></div>
</body>
</html>