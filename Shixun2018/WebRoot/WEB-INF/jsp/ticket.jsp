<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=2.0" />
<script src="/Shixun2018/script/jquery-1.11.3.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

ul, li, ol {
	list-style: none;
}

.content {
	margin-right: auto;
	margin-left: auto;
	width: 400px;
	height: 630px;
	margin-top: 50px;
	background: #d3e1f3;
	position: relative;
}

.tt {
	width: 100px;
	height: 300px;
	background-color: #1199ff;
	margin-left: 20px;
	margin-bottom: 20px;
	margin-right: 50px;
	position: relative;
	border: solid 1px #c8cccf;
	border-radius: 1em;
}

.tt2 {
	width: 100px;
	height: 300px;
	background-color: #1199ff;
	margin-left: 280px;
	margin-right: 50px;
	position: relative;
	border: solid 1px #c8cccf;
	border-radius: 1em;
}

.tt:last-child {
	margin-left: 280px;
	margin-top: 30px
}

img {
	width: 60px;
	height: 60px;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
	cursor: pointer;
	overflow: hidden;
	border: solid 1px #c8cccf;
	border-radius: 3em;
}

.change {
	border: solid 3px #1199ff;
	border-radius: 33px;
	box-sizing: border-box;
	box-shadow: 0 0 8px rgba(81, 81, 81, 0.8);
}

.change2 {
	border: solid 2px #898989;
	box-sizing: border-box;
	box-shadow: 0 0 8px rgba(81, 81, 81, 0.8);
}

.name {
	width: 100px;
	height: 25px;
	bottom: 25px;
	position: absolute;
	display: inline-block;
	text-align: center;
}

.count {
	width: 40px;
	text-align: center;
	display: inline-block;
	margin-top: -25px;
	background-color: #898989;
	color: #FFFFFF;
	font-weight: bold;
}

.count2 {
	width: 40px;
	text-align: center;
	display: inline-block;
	margin-top: -25px;
	background-color: #898989;
	color: #FFFFFF;
	font-weight: bold;
}

.bar {
	width: 40px;
	height: 60px;
	bottom: 50px;
	left: 30px;
	right: 30px;
	background-color: #FF9900;
	position: absolute;
}

.bar2 {
	width: 40px;
	height: 60px;
	bottom: 50px;
	left: 30px;
	right: 30px;
	background-color: #FF9900;
	position: absolute;
}

.des {
	position: absolute;
	width: 250px;
	height: 300px;
	background-color: #b5cce8;
	right: 15px;
	top: 0;
	border: 1px solid #b5cce8;
	border-radius: 1em;
}

.des2 {
	position: absolute;
	width: 250px;
	height: 300px;
	background-color: #b5cce8;
	right: 15px;
	bottom: 0;
	left: 15px;
	border: 1px solid #b5cce8;
	border-radius: 1em;
}

.title {
	font-size: 23px;
	font-weight: bold;
	margin-bottom: 30px;
	margin-left: 10px
}

.h22 {
	padding-top: 30px;
}

.pic404 {
	width: 150px;
	height: 150px;
	margin-left: 120px;
	margin-top: 210px;
}
</style>
<script>
        $(function () {
       window.setTimeout(function() {window.location.reload();},3000);  
        
        if(${queryFight.fid==null}){
        $(".content").children().remove();
        $img1=$("<img class='pic404' src='/Shixun2018/img/404.png' />")
        $h2 = $("<h2 class='h22'>目前暂无对战，过会儿再来看看吧~</h2>")
          $(".content").append($img1);
          $(".content").append($h2);
         
         
        }
        
        var t1="${queryFight.ticket1}";
        var t2="${queryFight.ticket2}";
            $(".bar").height(t1*5);
            $(".bar2").height(t2*5);
            $(".count").html(parseInt(($(".bar").height()))/5);
             $(".count2").html(parseInt(($(".bar2").height()))/5);
 
 
           $(".tt").click(function () {
           if("${user.id}"==""){
           alert("请前往登陆");
           location.href="/Shixun2018/login"
           }else{
              // $(".bar").height((parseInt($(".bar").height())+5)+"px");
               //$(".count").html(parseInt(($(".bar").height()))/5);
               var url="/Shixun2018/ticketPlus";
               var fid="${queryFight.fid}";
               var userid="${user.id}";
               var player="${queryFight.id}";
               var param = {
				i : fid,
				mark : 1,
				userid:userid,
				player :player
			};
			$.post(url, param, function(data) {
				alert(data);
					window.location.reload();
			}) 
			}
            });

           $(".tt2").click(function () {
            if("${user.id}"==""){
           alert("请前往登陆");
           location.href="/Shixun2018/login"
           }else{
             //  $(".bar2").height((parseInt($(".bar2").height())+5)+"px");
              // $(".count2").html(parseInt(($(".bar2").height()))/5);
                var url="/Shixun2018/ticketPlus";
               var fid="${queryFight.fid}";
               var userid="${user.id}";
               var player="${queryFight.id2}";
               var param = {
				i : fid,
				mark : 2,
				userid:userid,
				player :player
			};
			$.post(url, param, function(data) {
				alert(data);
					window.location.reload();
			})
               }
            });

          
           function colorchange()
        {
            $(".des,.des2").css("color",getcolor());
        } 

        function getcolor()
        { 
            var mycolor = "#";
            var color ="123456789abcdef";
            var colorcode = color.split("");
            for(var i=0;i<6;i++)
            {
                mycolor+=colorcode[Math.floor(15*Math.random())];
            }
            return mycolor;
        } 
        setInterval(colorchange,400);
        })
    </script>
<title>Insert title here</title>

</head>
<body>
	<div class="content">
		<div class="tt">
			<img class="pic" id="pic1"
				src="<%=request.getContextPath()%>/files/${queryFight.pic}"
				alt="支持一下" width="60px" height="60px">
			<div class="bar">
				<li class="count">0</li>
			</div>
			<span class="name">${queryFight.name}</span>
		</div>
		<div class="des">
			<li class="title">选手姓名：${queryFight.name}</li>
			<li class="title">选手年龄：${queryFight.age}</li>
			<li class="title">选手性别：<c:choose>
					<c:when test="${queryFight.sex=='0'}">
									女
								</c:when>
					<c:when test="${queryFight.sex=='1'}">
									男
								</c:when>
				</c:choose></li>
			<li class="title">选手爱好：${queryFight.hobby}</li>
			<li class="title">挑战歌曲：${queryFight.song1}</li>
		</div>
		<div class="des2">
			<li class="title">选手姓名：${queryFight.name2}</li>
			<li class="title">选手年龄：${queryFight.age2}</li>
			<li class="title">选手性别：<c:choose>
					<c:when test="${queryFight.sex2=='0'}">
									女
								</c:when>
					<c:when test="${queryFight.sex2=='1'}">
									男
								</c:when>
				</c:choose></li>
			<li class="title">选手爱好：${queryFight.hobby2}</li>
			<li class="title">挑战歌曲：${queryFight.song2}</li>
		</div>
		<div class="tt2">
			<img class="pic" id="pic2"
				src="<%=request.getContextPath()%>/files/${queryFight.pic2}"
				alt="支持一下" width="60px" height="60px">
			<div class="bar2">
				<li class="count2">0</li>
			</div>
			<span class="name">${queryFight.name2}</span>
		</div>

	</div>

</body>
</html>