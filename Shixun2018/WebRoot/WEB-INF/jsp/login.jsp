<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/Shixun2018/script/jquery-1.11.3.min.js"></script>
<script src="/Shixun2018/script/calendar5.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta http-equiv="Cache-Control" content="no-cache"/>  
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=2.0"/>
<title>欢迎来到在线投票系统</title>
<style>
        *{
            margin:0;
            padding:0;
        }
        ul,li,ol{
            list-style:none;
        }
        a{
            text-decoration:none;
        }
        .bg{
            width: 1000px;
            height: 667px;
            margin: 0 auto;
            background: url("/Shixun2018/img/background.jpg") ;
            position: relative;
        }
        .lr{
            width: 250px;
            height: 200px;
            border: 2px solid black;
            border-radius: 1em;
            position: absolute;
            left: 50px;
            top: 100px;
            background: #f8f8f8;
        }
        .lr li {
            display: inline-block;
        }
        .lr input{
            margin-left: 25px;
            margin-top: 20px;
        }
        input{
            border-color: #878787;
            border-style: solid;
            border-top-width: 0px;
            border-right-width: 0px;
            border-bottom-width: 1px ;
            border-left-width: 0px;
            background: #f8f8f8;
            width: 200px;
            height: 30px;
            font-size: 20px;
        }
        .reg{
            margin-top: 25px;
            margin-left: 10px;
            color: #878787;

        }
        ::-webkit-input-placeholder {
            font-size: 15px;
        }
        .log{
            margin-left: 110px;
            margin-top: 0px;
            cursor: pointer;
        }
    </style>
     <script>
     var c = new Calendar("c");                     
    document.write(c);
        $(function () {
            var isLogin=true;
            var isRePasswordRight=false;
            var isPhoneRight=false;
            var username="";
            var password="";



            $("#toregister").on("click",function () {
                if(isLogin){
                    var $li3=$("<li><input type=\"password\" name=\"name\" size=\"12\" placeholder=\"确认密码\" id='repassword'></li>");
                    var $li4=$("<li><input type='text' name='name' onclick='c.show(this);' placeholder=\"生日\" id='brithday' />");
                    var $li5=$("<li><input type=\"text\" name=\"name\" size=\"12\" placeholder=\"联系电话\" id='phone'></li>");
                    var $li6=$("<li><input type=\"text\" name=\"name\" size=\"12\" placeholder=\"性别(请输入'男'或'女')\" id='sex'></li>")
                    $(".lr").animate({height:"420px"});
                    $("#lrtitle").html("用户注册");
                    $("#toregister").html("有账号了？");
                    $(".lr ul li:eq(1)").after($li3);
                    $(".lr ul li:eq(2)").after($li4);
                    $(".lr ul li:eq(3)").after($li5);
                    $(".lr ul li:eq(4)").after($li6);
                    $("#login").attr("id","register");
                    isLogin=false;
                }else {
 
                    $(".lr").animate({height:"200px"});
                    $("#lrtitle").html("用户登录");
                    $("#toregister").html("免费注册");
                    $(".lr ul li:eq(2)").remove();
                    $(".lr ul li:eq(2)").remove();
                    $(".lr ul li:eq(2)").remove();
                    $(".lr ul li:eq(2)").remove();
                    $("#register").attr("id","login");
                    isLogin=true;
                }
            });

            $(".lr").on("keyup","#repassword",function () {
                var keyValue = $(this).val().trim();
                var reKeyValue =$("#password").val().trim();
               // console.log(keyValue+"++++"+reKeyValue);
                if(keyValue==reKeyValue){
                    $(this).css("background","#f8f8f8");
                    isRePasswordRight=true;
                }else {
                    $(this).css("background","#ff0000");
                    isRePasswordRight=false;
                }

            }).keyup();

            $(".lr").on("keyup","#phone",function () {
                var phone = $("#phone").val().trim();
                if(validatePhone(phone)){
                    $(this).css("background","#f8f8f8");
                    isPhoneRight=true;
                }else {
                    $(this).css("background","#ff0000");
                    isPhoneRight=false;
                }

            });

            function validatePhone(phone){
                var isMobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
                var isPhone = /^(?:(?:0\d{2,3})-)?(?:\d{7,8})(-(?:\d{3,}))?$/;
                if (phone.substring(0, 1) == 1) {
                    if (!isMobile.exec(phone) && phone.length != 11) {
                        return false;
                    }
                }
                else {
                    return false;
                }
                return true;
            }

            $(".lr").on("click","#login",function () {
                var ipassword=$("#password").val().trim();
                var iusername=$("#username").val().trim();
                if(ipassword!=null&&iusername!=""&&iusername!=null&&iusername!=""){
                var url="/Shixun2018/ajax_submit";
                var param={username:iusername,password:ipassword};
				$.post(url,param,function(data){
				alert(data);
				if(data=="管理员登录成功"){
				location.href="/Shixun2018/manage"
				}if(data=="用户登录成功"){
				location.href="/Shixun2018/ticket"
				}
					
			});
                }
                /*if(username==""&&password==""){
                    alert("请先注册");
                }if(ipassword==password&&iusername==username&&username!==""&&password!=="") {
                    alert("登录成功");
                    password=ipassword;
                    username=iusername;
                    window.location.href="index.html";
                }else {
                    alert("密码或用户名错误")
                }*/

            });
            $(".lr").on("click","#register",function () {
                if(!isPhoneRight){
                    alert("请输入正确的电话号码");
                }if(!isRePasswordRight){
                    alert("两次密码不一致")
                }/*if($("#sex").val()!="男"||$("#sex").val()!="女"){
                	alert("请输入正确的性别")
                }*/else {
                    password=$("#password").val().trim();
                    username=$("#username").val().trim();
                    var sex=$("#sex").val().trim();
                    var birthday=$("#brithday").val().trim();
                    var telephone=$("#phone").val().trim();
                    if(sex=="男"){
                    sex=0;
                    }if(sex=="女"){
                    sex=1;
                    }
                    //var 
                    //$.cookie('username', username,{path:'/'});
                     var url="/Shixun2018/ajax_reg";
               		 var param={username:username,password:password,birthday:birthday,sex:sex,telephone:telephone,usertype:0};
               		 $.post(url,param,function(data){
					 alert(data);
					 
					 })
                }
            });
            
            
        })

    </script>
</head>
<body>
<div class="bg">
 
<li style="position:absolute;right:200px;top:100px;font-size:40px">在线投票系统</li>
 
    <div class="lr">
        <ul>
            <h2 style="text-align: center;margin-top: 20px;" id="lrtitle"> 用户登录</h2>
            <li><input type="text" name="name" size="12" placeholder="用户名" id="username"></li>
            <li><input type="password" name="name" size="12" placeholder="密码" id="password"></li>
            <li class="reg" id="toregister" style="cursor: pointer">免费注册</li>
            <li><img src="/Shixun2018/img/skip.png" alt="" class="log" id="login"></li>
        </ul>


    </div>

</div>
</body>
</html>