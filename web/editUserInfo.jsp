<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/4/12 0012
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Information</title>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <script src="jQuery/jquery.sha1.js"></script>
    <script scr="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
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

        #excute-functions div {
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

        #excute-functions {
            color: #B68444;
        }

        #excute-functions input[type='text'], #excute-functions input[type='password'] {
            color: #8c8c8c;
            width: 600px;
        }

        #excute-functions input {
            width: 600px;
        }

        #excute-functions input[disabled] {
            cursor: default;
            color: inherit;
            background-color: transparent;
            box-shadow: none;
        }

        #wrongPassword {
            color: red;
        }

        .important-child {
            color: red;
            text-shadow: 0 0 9px;
            visibility: hidden;
        }

    </style>
    <script>
        function focusThisA(me) {
            ap = me.parentNode;
            $(ap).find("a").not(me).removeAttr('focus');
            <%--$('#product-name a').not(me).removeAttr('focus');--%>
            $(me).attr('focus', 'on');
            console.log("focus on!" + $(me));
            index = $(me).index();
            $("#excute-functions div[index=" + index + "]").css("display", "block");
            $("#excute-functions div").not("[index=" + index + "]").css("display", "none");
        }
        function checkPwdEmpty(me) {
            console.log("1111");
            if ($(me)[0].value == "") {

                $("i[name='new-pass-msg']").css("visibility","visible");
            }
            else {
                $("i[name='new-pass-msg']").css("visibility","");
            }
        }
        function checkPwdMatch(){
            inputs = $("input[type='password']");

            sh1 = $.sha1(inputs[1].value);//第二个密码框
            sh2 = $.sha1(inputs[2].value);//第3个密码框
            console.log(sh1+"\n"+sh2);
            if(sh1!=sh2){
                $("i[name='pass-re-msg']").css("visibility","visible");

            }
            else{
                $("i[name='pass-re-msg']").css("visibility","");
            }

        }
    </script>
</head>

<body>
<jsp:include page="common-header.jsp"></jsp:include>
<div class="w" style="margin-top: 120px;">
    <div class="flex-row">
        <div id="functions">
            <a id="password" name="password" onclick="focusThisA(this);">
                <p style="background-color: transparent">
                    修改密码
                </p>
            </a>

            <a onclick="focusThisA(this);">
                <p style="background-color: transparent">
                    修改其他信息
                </p>
            </a>
            <div id="shadow">

            </div>


        </div>
        <div id="excute-functions">
            <form action="editInfo" method="post">
                <div index="0">
                    <p>
                        <s:text name="Username"></s:text>
                    </p>
                    <input type="text" name="user.userid" value="<s:property value="#session.userinfo.userid"/>"
                           disabled="disabled"><br>
                    <p>
                        <s:text name="CurrentPassword"></s:text><s:fielderror name="wrongPassword"
                                                                              fieldName="wrongPassword"></s:fielderror>
                    </p>
                    <input type="password" name="user.password"/><br/>

                    <p>
                        <s:text name="NewPassword"></s:text><i class="important-child" name="new-pass-msg"><strong
                            comment="empty">You must enter a password..</strong></i>
                    </p>
                    <input type="password" name="newPassword" onblur="checkPwdEmpty(this);" ><br>
                    <p>
                        <s:text name="Repeat Password"></s:text><i name="pass-re-msg" class="important-child"><strong
                            coment="same">The passwords do not match. </strong></i>
                    </p>
                    <input type="password" name="repeatNewPassword" oninput="checkPwdMatch();" onclick="checkPwdMatch();"><br>
                    <input type="submit" value="<s:text name="Save"></s:text>">
                </div>
                <div index="1">
                    <!-- 预留给将来的其他功能-->
                    <%--日見た花の名前を僕達はまだ知らない--%>
                    <p>
                        <s:text name="Phone Number"></s:text>
                    </p>
                    <input type="text" name="user.phone" value="<s:property value="#session.userinfo.phone"/>"/><br/>
                    <p>
                        <s:text name="E-mail"></s:text>
                    </p>
                    <input type="text" name="user.email" value="<s:property value="#session.userinfo.email"/>"><br/>

                    <p>
                        <s:text name="Lastname"></s:text>
                    </p>
                    <input type="text" name="user.firstname" value="<s:property value="#session.userinfo.firstname"/>">


                    <p>
                        <s:text name="Firstname"></s:text>
                    </p>
                    <input type="text" name="user.lastname"
                           value="<s:property value="#session.userinfo.lastname"/>"><br/>
                    <p>
                        <s:text name="Address"></s:text>
                    </p>
                    <input type="text" name="user.address" value="<s:property value="#session.userinfo.address"/>"><br/>
                    <p>
                        <s:text name="Zipcode"></s:text>
                    </p>
                    <input type="text" name="user.zip" value="<s:property value="#session.userinfo.zip"/>"><br/>
                    <input type="submit" value="<s:text name="Save"></s:text>">


                </div>


            </form>


        </div>
    </div>


</div>


<script>
    $().ready(
            function () {
                console.log("文档加载完毕");
                $('#functions').find('a:nth-of-type(1)').click();

            }
    )
</script>
<jsp:include page="common-copyright.jsp"></jsp:include>
</body>
</html>
