package Shixun2018.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.regexp.internal.recompile;
import com.sun.swing.internal.plaf.basic.resources.basic;
import com.sun.xml.internal.ws.api.ha.StickyFeature;

import Shixun2018.dao.UserDao;
import Shixun2018.entity.User;
import Shixun2018.entity.VoteRecord;


@Service
public class LoginService {
	@Autowired
	private UserDao userDao;
	public boolean execute(String username,String password){
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		User u=userDao.getUser(user);
		if(u!=null){
			return true;
		}else{
			return false;
		}
	}
	public User getUser(String username,String password){
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		User u=userDao.getUser(user);
		return u;
	}
	public boolean adduser(String username,String password,String birthday,int sex,String telephone,int usertype) {
		User user=new User();
		user.setUsername(username);
		user.setBirthday(birthday);
		user.setPassword(password);
		user.setSex(sex);
		user.setTelephone(telephone);
		user.setUsertype(usertype);
		int i=userDao.addUser(user);
		if(i>0){
			return true;
		}else{
			return false;
		}
	}
	
	public User getUserByName(String i){
		return userDao.getUserByName(i);
	}

}
