package Shixun2018.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Shixun2018.entity.User;
import Shixun2018.entity.VoteRecord;
import Shixun2018.service.FightService;

@Controller
public class FightMController {
	@Autowired
	FightService fightService;
	
	@RequestMapping(value="/openF",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String addFight(String pid1,String pid2,String song1,String song2,String des,int state){
		int ipid1=Integer.parseInt(pid1);
		int ipid2=Integer.parseInt(pid2);
		boolean i=fightService.addFight(ipid1, ipid2, song1, song2, des, state);
		if(i){
			return "对战添加成功";
		}else {
			return "对战添加失败";
		}
	}
	
	@RequestMapping(value="/stateChange",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String state(int i,int state){
		if(state==0){
			int ii=fightService.updataState1(i);
			if(ii>0){
				return "对战开启成功";
			}else {
				return "对战开启失败";
			}
		}else {
			int ii=fightService.updataState2(i);
			if(ii>0){
				return "对战关闭成功";
			}else {
				return "对战关闭失败";
			}
		}
	}
	@RequestMapping(value="/queryuserbyvote",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String queryUser(int fight,int player,HttpSession session){
		VoteRecord voteRecord = new VoteRecord();
		voteRecord.setFight(fight);
		voteRecord.setPlayer(player);
		List<User> userlist=fightService.queryUserByVote(voteRecord);
		 System.out.println(userlist.size());
		String userlist2 = "";
		for(int i=0;i<userlist.size();i++){
			  System.out.println(userlist.get(i).getId());
			  System.out.println(userlist.get(i).getUsername());
			  System.out.println(userlist.get(i).getSex());
			  userlist2=userlist2+String.valueOf(userlist.get(i).getId())+",";
			  userlist2=userlist2+userlist.get(i).getUsername()+",";
			  if(i==userlist.size()-1){
				  userlist2=userlist2+String.valueOf(userlist.get(i).getSex());
			  }else {
				  userlist2=userlist2+String.valueOf(userlist.get(i).getSex())+",";
			}
			 
		}
		session.setAttribute("quser", userlist);
		return userlist2;
	}
	
}
