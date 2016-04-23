<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/13
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header" dis="common-header">
    <script src="OtherJs/header.js"></script>
    <div class="w" style="
    width: 850px;
">
        <form action="product_getItemBySearchName" method="post">
            <ul class="block-ul" style="
    margin: 50px 50px;
">
                <li><input id="search-input" name="item.name" type="text" autocomplete="off"
                           oninput="console.log('input');get_search_keywords();"
                           onblur="console.log('blur');hideKeyword();"
                           onfocus="showKeyword();">
                    <ul id="select-keyword" hide="yes">

                    </ul>


                </li>

                <li id="search-icon"><input type="submit" value=" " id="search-submit" style="    background-color: rgba(0,0,0,0);
    box-shadow: none;opacity: 0;"></li>
                <li id="cart-icon" onclick="$(this).find('a')[0].click();">
                    <a href="orders_makeOrder?purchase=-1&orders.itemid="></a>
                </li>

                <li id="user-icon" onclick="$(this).find('a')[0].click();">
                    <a href="editUserInfo.jsp"></a>
                </li>
            </ul>
        </form>

    </div>
</div>
