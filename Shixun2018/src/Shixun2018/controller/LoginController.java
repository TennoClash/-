package Shixun2018.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Shixun2018.entity.User;
import Shixun2018.service.LoginService;


@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping(value="/ajax_submit",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String login_submit(String username,String password,HttpServletRequest request,HttpSession session){		
		System.out.println(username+password);
		//request.setAttribute("username", username);
		boolean result= loginService.execute(username, password);
		if(result){
			User user=loginService.getUserByName(username);
			int usertype=user.getUsertype();
			if(usertype==1){
				User user2=loginService.getUser(username, password);
				session.setAttribute("user", user2);
				return "����Ա��¼�ɹ�";
			}else {
				User user2=loginService.getUser(username, password);
				session.setAttribute("user", user2);
				return "�û���¼�ɹ�";
			}
			
		}else{
			return "�û������������";
		}
	}
	
	@RequestMapping(value="/ajax_reg",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String register(String username,String password,String birthday,String sex,String telephone,String usertype){
		System.out.println(username+"++"+password+"++"+telephone+"++"+sex);
		int isex=Integer.parseInt(sex);
		int iusertype=Integer.parseInt(usertype);
		boolean result=loginService.adduser(username, password, birthday, isex, telephone, iusertype);
		if(result){
			return "ע��ɹ�  �뷵�ص�¼";
		}else {
			return "ע��ʧ��";
		}
	
	}

}
