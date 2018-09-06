<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>管理页面</title>
<script src="/Shixun2018/script/jquery-1.11.3.min.js"></script>
<script src="/Shixun2018/script/jquery.form.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

ul, li, ol {
	list-style: none;
}

.box1 {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	background-color: #f8f5f8;
	position: relative;
}

.lr li {
	display: inline-block;
}

.lr ul li:first-child {
	margin-left: 90px;
}

.lr ul input {
	border-color: #acf849;
	border-style: solid;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 1px;
	border-left-width: 0px;
	background: #f8f8f8;
	width: 200px;
	height: 30px;
	font-size: 20px;
}

.table {
	border: 1px solid #ddd;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

.table thead tr th, .table tbody tr td {
	padding: 8px 12px;
	text-align: center;
	color: #333; 
	border: 1px solid #ddd;
	border-collapse: collapse;
	background-color: #FFE9E4;
}
.table2 thead tr th, .table2 tbody tr td {
	text-align: center;
	border: 1px solid #ddd;
	border-collapse: collapse;
	background-color: #d9aaff;
	font-size:12px; 
}
.boder1 {
	width: 1000px;
	margin-top: 20px;
	border: 2px solid #00B83F;
}

.fightbox {
	width: 701px;
	height: 400px;
	margin-left: auto;
	position: relative;
	margin-right: auto;
	background-color: #C6FFC9;
	border: 1px #C6FFC9 solid;
	border-radius: 3em;
}

.fightbox div {
	display: inline-block;
	width: 350px;
	height: 250px;
}

#player1 {
	position: absolute;
	top: 0;
	border-right: black 1px solid;
}

.player1box {
	width: 350px;
	height: 350px;
}

#player2 {
	position: absolute;
	top: 0;
	right: 0;
}

.player2box {
	width: 350px;
	height: 350px;
}

#playermenu {
	position: absolute;
	bottom: 0;
	border-top: black 1px solid;
	width: 700px;
	height: 150px;
}

.playerimg {
	margin-left: 115px;
	border: 2px #EAECE9 solid;
	border-radius: 5em;
}

.songname {
	border-color: #acf849;
	border-style: solid;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 1px;
	border-left-width: 0px;
	background: #f8f8f8;
	width: 200px;
	height: 30px;
	font-size: 20px;
	margin-top: 15px;
	margin-left: 80px;
}
#tips {

	height: 120px;
	background: #92e5ff;
	position: absolute;
	display: none;
	overflow: scroll;
}
.showtip1,.showtip2{
	cursor:pointer;
	 transition:all 0.3s;
}
.showtip1:hover,.showtip2:hover{
background: #92e5ff;
}
</style>
<script type="text/javascript">

	function add() {
		var head = $("#file").val();
		head = head.replace(/\\/g, "/");
		head = head.substr(head.lastIndexOf('/') + 1);
		$("#pic").val(head);
		if ($("#sex").val() == "男") {
			$("#sex").val("1");
		}
		if ($("#sex").val() == "女") {
			$("#sex").val("0")
		}

		var param = $("#form").serialize();
		var url = "/Shixun2018/addplayer";
		$.post(url, param, function(data) {
			if (data == "1") {
				alert("新增成功")
				window.location.reload();
			} else {
				alert("新增失败")
				window.location.reload();
			}
		});
		$tr1 = $("<tr></tr>");
		$td1 = $("<td>" + "新增选手" + "</td>");
		$td2 = $("<td>" + $('#name').val() + "</td>");
		$td3 = $("<td>" + $('#age').val() + "</td>");
		$td4 = $("<td>" + $('#sex').val() + "</td>");
		$td5 = $("<td>" + $('#hobby').val() + "</td>");
		$td6 = $("<td><input type='button' class='add' value='加入对战'/></td>");
		var picname = "'" + "/Shixun2018/files/" + head + "'";
		$td7 = $("<td><img src=" + picname + " width='40px' height='40px'></td>");
		$(".ss").append($tr1);
		$tr1.append($td1);
		$tr1.append($td7);
		$tr1.append($td2);
		$tr1.append($td3);
		$tr1.append($td4);
		$tr1.append($td5);
		$tr1.append($td6);

	}
	function sub() {
		var url = "/Shixun2018/addplayer";
		var param = $("headimg").serialize();
		$("#headimg").ajaxSubmit(function(data) {
			if (data == "1") {
				alert("头像上传成功")
			}
		})
	}
	$(function() {
		var check = 0;
		var pi;
		var pname;
		var pid;
		$("tbody").on("click", ".add", function() {
			pi = $(this).parent().prev().prev().prev().prev().prev().children().attr("src");
			pname = $(this).parent().prev().prev().prev().prev().html();
			pid = $(this).parent().prev().prev().prev().prev().prev().prev().html();
			//alert(pid);  

			$pli1 = $("<li><img class='playerimg' src='" + pi + "' width='120px' height='120px'></li>")
			$pli2 = $("<li id='playname1' style='text-align: center;font-size:20px;margin-top:10px'>" + pname + "</li>")


			if (check == 2) {

			}
			if (check == 4) {
				$("#tip1").remove();
				$(".player1box").append($pli1);
				$(".player1box").append($pli2);
				$pli3 = $("<li><input class='songname' id='song1' type='text' placeholder='输入歌曲名'/></li>")
				$(".player1box").append($pli3);
				$pli4 = $("<input id='player1id1' value='" + pid + "' type='hidden'/>");
				$(".player1box").append($pli4);
				check = 2;
			}
			if (check == 2) {

			} else {
				if (check == 0) {
					$("#tip1").remove();
					$(".player1box").append($pli1);
					$(".player1box").append($pli2);
					$pli3 = $("<li><input class='songname' id='song1' type='text' placeholder='输入歌曲名'/></li>")
					$(".player1box").append($pli3);
					$pli4 = $("<input id='player1id1' value='" + pid + "' type='hidden'/>");
					$(".player1box").append($pli4);
					check = 1;
				} else {
					$("#tip2").remove();
					$(".player2box").append($pli1);
					$(".player2box").append($pli2);
					$pli3 = $("<li><input class='songname' id='song2' type='text' placeholder='输入歌曲名'/></li>")
					$(".player2box").append($pli3);
					$pli4 = $("<input id='player1id2' value='" + pid + "' type='hidden'/>");
					$(".player2box").append($pli4);
					check = 2;
				}
			}


		})

		$("#remove1").on("click", function() {
			$(".player1box").children().remove();
			$tip1 = $("<h2 style='text-align: center;margin-top:100px' id='tip1'>请加入选手</h2>")
			$(".player1box").append($tip1);
			check = 4;
		})

		$("#remove2").on("click", function() {
			$(".player2box").children().remove();
			$tip2 = $("<h2 style='text-align: center;margin-top:100px' id='tip2'>请加入选手</h2>")
			$(".player2box").append($tip2);
			check = 3;
		})

		$("#openF").on("click", function() {
			var pid1 = $("#player1id1").val();
			var pid2 = $("#player1id2").val();
			var song1 = $("#song1").val();
			var song2 = $("#song2").val();
			var des = $("#des").val();
			//alert(des);
			var url = "/Shixun2018/openF";
			var param = {
				pid1 : pid1,
				pid2 : pid2,
				song1 : song1,
				song2 : song2,
				des : des,
				state : 0
			};
			$.post(url, param, function(data) {
				alert(data);
				if (data == "对战添加成功") {
					window.location.reload();
				}
			})

		})
		$(".fightlist").on("click", ".openfight", function() {
			var statei = 0;
			$(".fightlist tbody td").each(function(i) {
				if (i == 7 || (i - 7) % 9 == 0) {
					if ($(this).html() == "开启") {
						statei++;
					}
				}
			});
			if (statei > 0) {
				alert("一次只能开启一个对战");
			} else {
				var pid2 = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().html();
				var url = "/Shixun2018/stateChange";
				var param = {
					i : pid2,
					state : 0
				};
				$.post(url, param, function(data) {
					if (data == "对战开启成功") {
						window.location.reload();
					}
				})
			}
		})

		$(".fightlist").on("click", ".closefight", function() {
			var pid2 = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().html();
			var url = "/Shixun2018/stateChange";
			var param = {
				i : pid2,
				state : 1
			};
			$.post(url, param, function(data) {
				if (data == "对战关闭成功") {
					window.location.reload();
				}
			})
		})
		$(".showtip1").on("click", function() {
			var div = $("#tips");
			if (div.is(":hidden")) {
				div.show();
				div.css("left", event.layerX + 20);
				div.css("top", event.clientY + document.documentElement.scrollTop || document.body.scrollTop);
			
				var voteplayer= $(this).prev().prev().prev().prev().html();
				var fightid=$(this).prev().prev().prev().prev().prev().html();
				var url = "/Shixun2018/queryuserbyvote";
			var param = {
				fight : fightid,
				player :voteplayer
			};
			
			$.post(url, param, function(data) {
			var p1=data.split(",");
				console.log(p1);
				console.log(p1.length);
				console.log(p1[0]);
				for(i=0;i<(p1.length)/3;i++){
				$tr=$("<tr></tr>");
				$td1=$("<td>"+p1[(i+1)*3-3]+"</td>");
				$td2=$("<td>"+p1[(i+1)*3-2]+"</td>");
				if(p1[(i+1)*3-1]=="0"){
				var tsex="女";
				}else{
				var tsex="男";
				}
				$td3=$("<td>"+tsex+"</td>");
				$(".table2 tbody").append($tr);
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3); 
				};
			}) 
				 
			} else {
				div.hide();
				$(".table2 tbody").children().remove();
			}
		})
		
		$(".showtip2").on("click", function() {
			var div = $("#tips");
			if (div.is(":hidden")) {
				div.show();
				div.css("left", event.layerX + 20);
				div.css("top", event.clientY + document.documentElement.scrollTop || document.body.scrollTop);
				//$("#tips tbody tr td").html("");
				var voteplayer= $(this).prev().prev().prev().html();
				var fightid=$(this).prev().prev().prev().prev().prev().prev().html();
				var url = "/Shixun2018/queryuserbyvote";
			var param = {
				fight : fightid,
				player : voteplayer
			};
			$.post(url, param, function(data) {
				var p1=data.split(",");
				console.log(p1);
				console.log(p1.length);
				console.log(p1[0]);
				for(i=0;i<(p1.length)/3;i++){
				$tr=$("<tr></tr>");
				$td1=$("<td>"+p1[(i+1)*3-3]+"</td>");
				$td2=$("<td>"+p1[(i+1)*3-2]+"</td>");
				if(p1[(i+1)*3-1]=="0"){
				var tsex="女";
				}else{
				var tsex="男";
				}
				$td3=$("<td>"+tsex+"</td>");
				$(".table2 tbody").append($tr);
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3); 
				};
				div.show();
			})   
				
			} else {
				div.hide();
				$(".table2 tbody").children().remove();
			}
		})
		
		
	})
</script>
</head>
<body>
	<div class="box1">
		<h1 style="text-align: center">欢迎来到投票管理页面</h1>
		<h2 style="text-align: center;margin-top: 20px;" id="lrtitle">
			选手注册</h2>

		<form id="headimg" action="/Shixun2018/upload_submit" method="POST"
			enctype="multipart/form-data">
			<li style="display:inline-block;margin-left:90px">选择头像</li> <input
				type="file" name="file" id="file" style="margin-left:30px" /> <input
				type="button" onclick="sub()" value="上传" />
		</form>

		<form id="form">
			<div class="lr">
				<ul>
					<li><input type="text" name="name" size="12"
						placeholder="选手名称" id="name"></li>
					<li><input type="text" name="age" size="12" placeholder="选手年龄"
						id="age"></li>
					<li><input type="text" name="sex" id="sex" size="12"
						placeholder="选手性别" id="sex"></li>
					<li><input type="text" name="hobby" size="12"
						placeholder="选手爱好" id="hobby"></li>
					<input type="hidden" name="pic" id="pic">
					<li><input
						style="background:#eca9a9;margin-left:400px;margin-top:20px;cursor: pointer;"
						type="button" onclick="add()" value="新增选手" /></li>
				</ul>
			</div>
		</form>
		<div class=boder1></div>

		<h2 style="text-align: center;margin-top: 20px;" id="lrtitle">对战选单</h2>

		<div class="fightbox">

			<div id="player1">
				<div class="player1box">
					<h2 style="text-align: center;margin-top:100px" id="tip1">请加入选手</h2>
					<input class="player1id" type="hidden" />
				</div>

			</div>
			<div id="player2">
				<div class="player2box">
					<h2 style="text-align: center;margin-top:100px" id="tip2">请加入选手</h2>
					<input class="player2id" type="hidden" />
				</div>
			</div>

			<div id="playermenu">
				<input type="button"
					style="width:100px;height:40px;border:1px;border-radius:1em;
 		font-size:17px;margin-left:120px;margin-top:10px;cursor: pointer;"
					value="移除选手1" id="remove1" /> <input type="button"
					style="width:100px;height:40px;border:1px;border-radius:1em;
 		font-size:17px;margin-left:240px;margin-top:10px;cursor: pointer;"
					value="移除选手2" id="remove2" />
				<textarea id="des" placeholder="输入对战描述"
					style="margin-left:20px;margin-top:20px;display:inline-block;width:430px;height:60px"></textarea>
				<input type="button"
					style="width:100px;height:40px;border:1px;border-radius:1em;
 		font-size:17px;cursor: pointer;display:inline-block;position: absolute;bottom:30px;right:70px"
					value="新增对战" id="openF" />
			</div>
		</div>
		<div class=boder1></div>

		<h2 style="text-align: center;margin-top: 20px;" id="lrtitle">选手列表</h2>
		<div class="playlist">
			<table class="table" cellspacing="0" cellpadding="0">
				<thead>
					<th>选手编号</th>
					<th>选手头像</th>
					<th>选手姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>爱好</th>
					<th>操作</th>
				</thead>
				<tbody class="ss">
					<c:forEach items="${player}" var="item">
						<tr>
							<td>${item.id}</td>
							<td><img
								src="<%=request.getContextPath()%>/files/${item.pic}"
								width="40px" height="40px"></td>
							<td>${item.name}</td>
							<c:choose>
								<c:when test="${item.sex=='0'}">
									<td>女</td>
								</c:when>
								<c:when test="${item.sex=='1'}">
									<td>男</td>
								</c:when>
							</c:choose>
							<td>${item.age}</td>
							<td>${item.hobby}</td>
							<td><input type="button" class="add" value="加入对战" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<!-- ********************************************************************************* -->
		<div class=boder1></div>
		<h2 style="text-align: center;margin-top: 20px;" id="lrtitle">对战列表</h2>
		<div class="fightlist">
			<table class="table" cellspacing="0" cellpadding="0">
				<thead>
					<th>对战编号</th>
					<th>选手一</th>
					<th>选手一挑战歌曲</th>
					<th>选手二</th>
					<th>选手二挑战歌曲</th>
					<th>选手一得票</th>
					<th>选手二得票</th>
					<th>状态</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${fight}" var="item2">
						<tr>
							<td>${item2.id}</td>
							<td>${item2.player1}</td>
							<td>${item2.song1}</td>
							<td>${item2.player2}</td>
							<td>${item2.song2}</td>
							<c:choose>
								<c:when test="${item2.ticket1=='0'}">
									<td>暂无票数</td>
								</c:when>
								<c:when test="${item2.ticket1!='0'}">
									<td class="showtip1">${item2.ticket1}</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${item2.ticket2=='0'}">
									<td>暂无票数</td>
								</c:when>
								<c:when test="${item2.ticket2!='0'}">
									<td class="showtip2">${item2.ticket2}</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${item2.state=='0'}">
									<td>关闭</td>
								</c:when>
								<c:when test="${item2.state=='1'}">
									<td>开启</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${item2.state=='0'}">
									<td><input type="button"
										style="background: #7f6ba5;color:#fff" class="openfight"
										value="开启对战" /></td>
								</c:when>
								<c:when test="${item2.state=='1'}">
									<td><input type="button"
										style="background: #ff613d;color:#fff" class="closefight"
										value="关闭对战" /></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		
		<div id="tips">
<table class="table2"  cellspacing="0" cellpadding="0">
				<thead>
					<th>用户编号</th>
					<th>用户名</th>
					<th>用户性别</th>
				</thead>
				<tbody>
					 <!--  <c:forEach items="${quser}" var="item3">
						<tr>
							<td>${item3.id}</td>
							<td>${item3.username}</td>
							<c:choose>
								<c:when test="${item3.sex=='0'}">
									<td>女</td>
								</c:when>
								<c:when test="${item3.sex=='1'}">
									<td>男</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach> --> 
				</tbody>
			</table>

</div>
	</div>
</body>
</html>