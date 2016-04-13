<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/4/11 0011
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
    <script>

        function checkLog() {
            $.post("checkLog", null, function (data) {
                console.log("第1项=" + data[0].dowhat);
                window.dataLogs = data;

                lth = dataLogs.length;
                dataLogs.pv = [];//用来记录分页的页码
                var i = 0;
                do {
                    if (10 * i + 9 < lth - 1) {
                        dataLogs.pv[i] = i * 10 + 9;//比如 第一页就是0~9
                        i++;
                    }
                    else {
                        dataLogs.pv[i] = lth - 1;
                        break;
                    }
                } while (true);

                showPageOne();

                dataLogs.getFromTo = function (index1, index2) {
                    if (index1 <= index2) {
                        if (index1 >= 0 && index2 <= dataLogs.length - 1) {
                            return dataLogs.slice(index1, index2 + 1);//这个定义返回的是以index1 index2为端点,并且包含了端点的数据

                        }
                        else {
                            return null;
                        }

                    }
                    else {
                        return null;
                    }
                }
            })
        }

    </script>
    <script>
        function focusThisA(me) {
            ap = me.parentNode;
            $(ap).find("a").not(me).removeAttr('focus');
            <%--$('#product-name a').not(me).removeAttr('focus');--%>
            $(me).attr('focus', 'on');
            console.log("focus on!" + $(me));
            index = $(me).index();
            $("#excute-functions>div[index=" + index + "]").css("display", "block");
            $("#excute-functions>div").not("[index=" + index + "]").css("display", "none");
        }
        function setLogPageMinAndMax() {
            $("#log-page").attr("max", dataLogs.pv.length);
            $("#log-page").attr("min", 1);
        }
        function fillLogTable(index) {
            window.dataToFill = dataLogs.slice(dataLogs.pv[index - 1] - 9, dataLogs.pv[index - 1] + 1);
            $("#logs-table>tbody")[0].innerHTML = "";
            for (var x = 0; x < dataToFill.length; x++) {
                tr = document.createElement("tr");
                td1 = document.createElement("td");
                td2 = document.createElement("td");
                td3 = document.createElement("td");
                td1.innerHTML = dataToFill[x].userid;
                td2.innerHTML = dataToFill[x].timestamp.replace("T", " ");
                td3.innerHTML = dataToFill[x].dowhat;
                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
                $("#logs-table>tbody").append(tr);

            }
        }
        function showPageOne() {
            $("input#log-page").val(1);
            fillLogTable(1);
        }

    </script>
    <style type="text/css">
        .flex-row {
            display: inline-flex;
            flex-direction: row;
            width: 100%;
            background-color: white;
        / / margin-top: 60 px;
        }

        #functions {
            display: inline-flex;
            flex-direction: column;
            width: 200px;
            margin: 8px 0;
            border-top-color: #B68444;
            border-top-style: solid;
            border-top-width: 0px;
            background-image: linear-gradient(210deg, #B68444 0%, transparent 87%, rgba(195, 40, 40, 0) 100%);
        }

        #functions a {
            text-decoration: none;
            display: block;
            transition: background-color 1s;
            -moz-transition: background-color 1s;
            -webkit-transition: background-color 1s;
            -o-transition: background-color 1s;
        }

        #functions a:hover {
            background-color: rgba(255, 255, 255, 0.51);
        }

        #functions a:nth-child(odd) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        #functions a[focus] {
            background-color: white;
            box-shadow: -5px 0px 6px 0.1px #B68444;
        }

        #functions a[focus] p {
            color: maroon;
            background-color: transparent;
        }

        #functions p {
            margin: 0;
            height: 100px;
            font-size: 25px;
            text-align: left;
            padding: 35px 15px;
            color: #ffffff;
            font-weight: 700;
            text-shadow: 1px 1px 2px black;
        }

        #functions div#shadow {
            min-height: calc(50% + 140px);
        }

        #excute-functions {
            display: flex;
            flex-grow: 1;
            flex-direction: column;
            margin: 8px 0;
            padding-left: 10px;
            padding: 10px 10px;
            height: 800px;
        }

        #excute-functions > div {
            display: none;
            width: auto;
            height: 100%;
        / / position: absolute;
            flex-grow: 1;
            background-color: rgba(64, 162, 149, 0.0);
        }

        table#logs-table {
            margin: 0 auto;
            width: 100%;
        }

        table#logs-table tr > * {
            border-style: dashed;
            padding: 2px 2px 5px 15px;
            border-bottom-width: 1px;
            border-top-width: 1px;
            border-left-color: transparent;
            border-right-color: transparent;
        }

        input#log-page {
            display: inline-block;
            width: 100px;
        / / height: 20 px;
            font-size: 20px;
            box-shadow: 1px 1px 2px 1px #ADA59B inset;
            background-color: rgba(243, 229, 211, 0.3);
        }
    </style>
</head>
<body>
<jsp:include page="common-header.jsp"></jsp:include>
<div class="w" style="margin-top: 120px;">
    <div class="flex-row">
        <div id="functions">
            <a id="log" name="log" onclick="focusThisA(this);checkLog();">
                <p style="background-color: transparent">
                    <s:text name="seeLog"></s:text>
                </p>
            </a>
            <!--
            <a onclick="focusThisA(this);">
                <p style="background-color: transparent">
                    Null
                </p>
            </a>
            <a onclick="focusThisA(this);">
                <p style="background-color: transparent">
                    Null2
                </p>
            </a>-->

            <div id="shadow">

            </div>


        </div>
        <div id="excute-functions">
            <div index="0" id="ShowLogs">
                <!-- 查看日志 -->
                <p style="font-size: 20px;"><s:text name="logPage"></s:text><i style="padding: 0 20px;"><input
                        type="number" id="log-page" oninput="fillLogTable($(this).val());//console.log($(this).val());"
                        onmouseover="setLogPageMinAndMax();this.removeAttribute('onmouseover');"></i></p>
                <hr>
                <table id="logs-table">
                    <thead>
                    <tr>
                        <th style="width: 12%;"><s:text name="logUserid"></s:text></th>

                        <th style="width: 30%"><s:text name="logTimestamp"></s:text></th>
                        <th style=""><s:text name="logDowhat"></s:text></th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>

                </table>


            </div>


            <div index="1">
                <!-- 预留给将来的其他功能-->
                <%--日見た花の名前を僕達はまだ知らない--%>

            </div>
            <div index="2">
                <!-- 预留给将来的其他功能-->


            </div>


        </div>
    </div>
    <script>
        $("#functions>a:first-of-type").click();
    </script>
    <script>

    </script>


</div>

<jsp:include page="common-copyright.jsp"></jsp:include>
</body>
</html>
