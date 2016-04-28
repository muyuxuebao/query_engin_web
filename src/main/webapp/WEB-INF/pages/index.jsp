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
<hr>
<p class="active-tab"><strong>Activated TAB</strong>：<span></span></p>

<p class="previous-tab"><strong>Previous Activated TAB</strong>：<span></span></p>


<hr>
<ul id="myTab" class="nav nav-tabs">
    <li class="active"><a href="#home" data-toggle="tab">
        Query Engin</a>
    </li>
    <li><a href="#adduser" data-toggle="tab">Add User</a></li>

    <li><a href="#addword" data-toggle="tab">Add key words</a></li>
    <li><a href="#userbuyword" data-toggle="tab">User buy key word</a></li>
    <li><a href="#userquery" data-toggle="tab">User Search</a></li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
        <p>京公网安备 11000002000088号 | 京ICP证070359号 | 互联网药品信息服务资格证编号(京)-经营性-2014-0008 | 新出发京零 字第大120007号
            音像制品经营许可证苏宿批005号 | 出版物经营许可证编号新出发(苏)批字第N-012号 | 互联网出版许可证编号新出网证(京)字150号
            网络文化经营许可证京网文[2014]2148-348号 违法和不良信息举报电话：4006561155 Copyright © 2004-2016 京东JD.com 版权所有
            京东旗下网站：京东钱包</p>
    </div>
    <div class="tab-pane fade" id="adduser">
        <table>
            <tr>
                <td>Please input the name of user:</td>
                <td><input type="text" name="a_user_name" id="a_user_name"/></td>
                <td><input type="button" value="submit" id="add_user_submit"></td>
            </tr>
        </table>
    </div>
    <div class="tab-pane fade" id="addword">
        <table>
            <tr>
                <td>Please input keyword:</td>
                <td><input type="text" name="a_word_name" id="a_word_name"/></td>
                <td><input type="button" value="submit" id="add_word_submit"></td>
            </tr>
        </table>
    </div>


    <div class="tab-pane fade" id="userbuyword">
        <table>
            <tr>
                <td>Please chose user:</td>
                <td>
                    <select class="form-control" id="userselect" name="userselect">
                    </select>
                </td>
            </tr>
            <tr>
                <td>Please chose key word:</td>
                <td>
                    <select class="form-control" id="wordselect" name="wordselect">
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="button" value="submit" id="userbuyword_submit"></td>
            </tr>
        </table>
    </div>
    <div class="tab-pane fade" id="userquery">
        <form>
            <table>
                <tr>
                    <td>请输入要搜索的词汇：</td>
                    <td><input type="text" name="searchstr" id="searchstr"/></td>
                    <td><input type="button" value="submit" id="querybtn"></td>
                </tr>
            </table>
        </form>

        <table class="table table-bordered">
            <caption>Users to be charged</caption>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
            </thead>
            <tbody id="charge_user_table">
            </tbody>
        </table>
    </div>
</div>
<script>
    $(function () {
        $('#myTab li:eq(0) a').tab('show');
    });


    $(function () {
        $("#userbuyword_submit").click(function () {
//            var a_user_name = $("#a_user_name")[0].value;
//            alert(a_user_name);

            var userId = $("#userselect").val();
            var wordId = $("#wordselect").val();
//            alert("userId = " + userId + " wordId = " + wordId);


            $.ajax({
                url: "userbuyword",
                type: "post",
                async: false,
                data: {
                    userId: userId,
                    wordId: wordId
                },
                dataType: "json",
                success: function (data) {
                    alert("User buy word successfully");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("User buy word failed");
                }
            });
        });

        $("#add_user_submit").click(function () {
            var a_user_name = $("#a_user_name")[0].value;
//            alert(a_user_name);


            $.ajax({
                url: "addUser",
                type: "post",
                async: false,
                data: {
                    a_user_name: a_user_name
                },
                dataType: "json",
                success: function (data) {
                    if (data.result == true) {
                        alert("Add user successfully");
                    } else {
                        alert("Add user failed" + data.error_msg);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Add user failed");
                }
            });
        });


        $("#add_word_submit").click(function () {
            var a_word_name = $("#a_word_name")[0].value;
//            alert(a_user_name);


            $.ajax({
                url: "addWord",
                type: "post",
                async: false,
                data: {
                    a_word_name: a_word_name
                },
                dataType: "json",
                success: function (data) {
                    alert("Add word successfully");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Add word failed");
                }
            });
        });


        $("#querybtn").click(function () {
            var str = $("#searchstr")[0].value;
//            alert(str);
            $.ajax({
                url: "userquery",
                type: "post",
                async: false,
                data: {
                    searchstr: str
                },
                dataType: "json",
                success: function (data) {
                    $("#charge_user_table").html("");

                    var chargeusers = data.chargeusers;
                    for (var i in chargeusers) {
                        var table_line = "<tr><td>" + chargeusers[i].id + "</td><td>" + chargeusers[i].name + "</td></tr>";
                        $("#charge_user_table").append(table_line);


                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("bbb");
                }
            });
        });

        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    // 获取已激活的标签页的名称
                    var activeTab = $(e.target).text();
                    // 获取前一个激活的标签页的名称
                    var previousTab = $(e.relatedTarget).text();
                    $(".active-tab span").html(activeTab);
                    $(".previous-tab span").html(previousTab);


                    if (activeTab == "User buy key word") {
                        $.ajax({
                            url: "initpage",
                            type: "post",
                            async: false,
                            data: {
                                pin: "aafsd",
                                money: 12.3
                            },
                            dataType: "json",
                            success: function (data) {
                                $("#userselect").html("");
                                var userList = data.userList;
                                for (var i in userList) {
                                    $("#userselect").append("<option value='" + userList[i].id + "'>" + userList[i].name + "</option>");
                                }


                                $("#wordselect").html("");
                                var wordList = data.wordList;
                                for (var i in wordList) {
                                    $("#wordselect").append("<option value='" + wordList[i].id + "'>" + wordList[i].name + "</option>");
                                }

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert("bbb");
                            }
                        });
                    }
                }
        )
        ;
    });
</script>

</body>
</html>