<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.maxiaolong.jpetstore.domain.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="com.maxiaolong.jpetstore.dao.ItemDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/3/8
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart - JpetStore</title>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <script scr="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
    <%
        List<Orders> cart = (List<Orders>) request.getAttribute("cart");
        Map<String,String> itemNameMap=(HashMap<String,String>)request.getAttribute("itemNameList");
        double listprice = 0;
        double totalValue = 0;
    %>

    <%--<script src="jquery-1.7.2.js"></script>--%>
    <script type="text/javascript">

        function change(itemid, quatity, totalprice, listprice) {
            var quatityEl = document.getElementById(quatity);
            var totalPriceEl = document.getElementById(totalprice);
            totalPriceEl.value = parseFloat(quatityEl.value) * listprice;
            $.get("reviseOrder?orders.itemid=" + itemid + "&orders.quatity=" + quatityEl.value +
                    "&orders.totalprice=" + totalPriceEl.value, null, function (data, status, xObj) {
                $("#totalValue>i").html(/*"￥:"+*/data.totalValue);
            });
        }

        function pay() {
            var totalValue=$("#totalValue").text();
            $.post('purchase?',null, function (data) {
                alert(data.flag);
                //window.huji = data;
                //location.reload();
                location.href="index.jsp";
            },"json");

        }

    </script>
    <style type="text/css">
        table#cart-table {
            margin: 0 auto;
            width: 100%;
        }

        table#cart-table tr > * {
            border-style: dashed;
            padding: 2px 2px 5px 15px;
            border-bottom-width: 1px;
            border-top-width: 1px;
            border-left-color: transparent;
            border-right-color: transparent;
        }

        p#cart-title {
            border-bottom: 5px solid #B68444;
        }

        p#cart-title span {
        / / margin-left: 45 px;
            font-size: 30px;
        }

        .cart-center-pad {
            padding: 0 45px;
        }
        div#pay{
            display: flex;
            flex-direction: row;
            border-top: 5px solid #B68444;
        }
        span#totalValue{
            font-size: 28px;
            color: #B6446D;
            text-shadow: 1px 1px 2px #B64460;
            float: right;


        }
        button[value='pay']{
            min-width: 100px;
            font-size: 20px;
            text-shadow: 1px 1px 2px;
            float: right;

        }
        #cart-table input[disabled]{
            background-color: transparent;
            color: black;
            box-shadow: none;
        }


    </style>

</head>
<body>
<jsp:include page="common-header.jsp"></jsp:include>
<div class="w" style="margin-top: 120px;">
    <p id="cart-title" class="cart-center-pad">
        <span>
            <s:text name="Cart"></s:text>
        </span>
    </p>
    <div class="cart-center-pad">
        <table id="cart-table">
            <theadN>
            <tr>
                <th><s:text name="Item Name"></s:text></th>
                <%--<th>Item name</th>--%>
                <th><s:text name="Quantity"></s:text></th>
                <th><s:text name="Total Price"></s:text></th>
                <th><s:text name="Remove"></s:text></th>
            </tr>
            </theadN>
            <tbody>
            <% for (Orders orders
                    : cart
                    ) {
            %>
            <tr id="<%=orders.getItemid()%>">
                <td><%=itemNameMap.get(orders.getItemid())%>
                </td>
                <%listprice = orders.getTotalprice() / orders.getQuatity();%>
                <td><input id="<%=orders.getItemid()%>quatity" type="number" value="<%=orders.getQuatity()%>" min="1"
                           oninput="change('<%=orders.getItemid()%>','<%=orders.getItemid()%>quatity','<%=orders.getItemid()%>totalPrice',<%=listprice%>)">
                </td>
                <td><input id="<%=orders.getItemid()%>totalPrice" type="number" value="<%=orders.getTotalprice()%>"
                           disabled="disabled"></td>
                <td><span><a href="orders_deleteOrder?orders.itemid=<%=orders.getItemid()%>"><s:text name="Remove"></s:text></a></span></td>
            </tr>
            <%}%>
            </tbody>


        </table>
    </div>

    <br>
    <div id="pay" class="cart-center-pad" >
        <div style="    flex-grow: 1;" style="visibility: hidden;">

        </div>
        <div style="">
            <span id="totalValue">￥<i><%=(Double) request.getAttribute("totalValue")==null?0:(Double) request.getAttribute("totalValue")%></i></span><br>
            <%--<input type="button" />--%>
            <button value="pay" onclick="pay()"><s:text name="Check Out"></s:text></button>
            <a id="index" href="index.jsp"></a>
        </div>
    </div>






</div>

<jsp:include page="common-copyright.jsp"></jsp:include>
</body>
</html>
