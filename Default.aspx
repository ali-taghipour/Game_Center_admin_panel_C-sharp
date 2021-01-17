<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head>
    <script src="script/jquery.js"></script>
    <script src="script/grid.js"></script>
    <link href="style/grid.css" rel="stylesheet" />
    <script src="script/big_jquery.js"></script>
    <style>
        body{
            position:relative;
        }
        #overlay{
            display:none;
            position:fixed;
            background:transparent;
            height:1200px;
            width:100%;
            left:0;
            top:0;
        }

        #overlay > img{
            display:block;
            margin:350px auto;
        }

        #scrolling{
            display: none;
            position:fixed;
            bottom:5px;
            right:0;
            cursor:pointer;
            border:2px solid orange;
            padding:40px;
            background:gold;
        }
    </style>
</head>
<body>
    <div id="overlay">
        <img src="load.gif" />
    </div>
    <span id="scrolling"> </span>
    <div id="grid">
        <%--   <div class="items">
            <h2>call of duty </h2>
            <img src="10.jpg" />
            <div class="mask">
                <span class="star"></span>
                <span class="price">1500 تومان </span>
            </div>
        </div>--%>
    </div>
    <div id="holder">
        <div id="pop_up" class="pop_up">
<%--        <span id="close_pop" class="close" onclick="close_pop()"></span>--%>
       <%-- <div class="items">
            <h2 id="title">call of duty </h2>
            <img id="big_img" src="10.jpg" />
            <div id="mask" class="mask">
                <span class="star"></span>
                <span class="price">1500 تومان </span>
            </div>
            <span id="flash" class="flash" onclick="flash()"></span>
        </div>--%>
    </div>
    </div>
</body>
</html>
