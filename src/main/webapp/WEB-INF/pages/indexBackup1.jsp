<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Query Engin</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<body>

<ul id="myTab" class="nav nav-tabs">
    <li class="active"><a href="#home" data-toggle="tab">
        Query Engin</a>
    </li>
    <li><a href="#adduser" data-toggle="tab">Add User</a></li>

    <li><a href="#addword" data-toggle="tab">Add key words</a></li>
    <li><a href="#userbuyword" data-toggle="tab">User buy key words</a></li>
    <li><a href="#ejb" data-toggle="tab">User Search</a></li>
    <%--<li class="dropdown">--%>
    <%--<a href="#" id="myTabDrop1" class="dropdown-toggle"--%>
    <%--data-toggle="dropdown">Java <b class="caret"></b>--%>
    <%--</a>--%>
    <%--<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">--%>
    <%--<li><a href="#jmeter" tabindex="-1" data-toggle="tab">--%>
    <%--jmeter</a>--%>
    <%--</li>--%>
    <%--<li><a href="#ejb" tabindex="-1" data-toggle="tab">--%>
    <%--ejb</a>--%>
    <%--</li>--%>
    <%--</ul>--%>
    <%--</li>--%>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
        <p>京公网安备 11000002000088号 | 京ICP证070359号 | 互联网药品信息服务资格证编号(京)-经营性-2014-0008 | 新出发京零 字第大120007号
            音像制品经营许可证苏宿批005号 | 出版物经营许可证编号新出发(苏)批字第N-012号 | 互联网出版许可证编号新出网证(京)字150号
            网络文化经营许可证京网文[2014]2148-348号 违法和不良信息举报电话：4006561155 Copyright © 2004-2016 京东JD.com 版权所有
            京东旗下网站：京东钱包</p>
    </div>
    <div class="tab-pane fade" id="adduser">
        <form action="addUser">
            <table>
                <tr>
                    <td>请输入用户名：</td>
                    <td><input type="text" name="a_user_name" id="a_user_name"/></td>
                    <td><input type="submit" value="确认"></td>
                </tr>
            </table>
        </form>
    </div>
    <div class="tab-pane fade" id="addword">
        <form action="addWord">
            <table>
                <tr>
                    <td>请输入用户名：</td>
                    <td><input type="text" name="a_word_name" id="a_word_name"/></td>
                    <td><input type="submit" value="确认"></td>
                </tr>
            </table>
        </form>
    </div>


    <div class="tab-pane fade" id="userbuyword">
        <form action="addWord">
            <table>
                <tr>
                    <td>Please chose user:</td>
                    <td>
                        <select class="form-control">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Please chose key word</td>
                </tr>
            </table>
        </form>
    </div>
    <div class="tab-pane fade" id="ejb">
        <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
        </p>
    </div>
</div>
<script>
    $(function () {
        $('#myTab li:eq(3) a').tab('show');
    });


    $(function () {
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            // 获取已激活的标签页的名称
            var activeTab = $(e.target).text();
            // 获取前一个激活的标签页的名称
            var previousTab = $(e.relatedTarget).text();
            $(".active-tab span").html(activeTab);
            $(".previous-tab span").html(previousTab);
        });
    });
</script>

</body>
</html>