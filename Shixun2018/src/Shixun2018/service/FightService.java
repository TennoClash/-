package Shixun2018.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Shixun2018.dao.FightDao;
import Shixun2018.entity.Fight;
import Shixun2018.entity.QueryFight;
import Shixun2018.entity.User;
import Shixun2018.entity.VoteRecord;

@Service
public class FightService {
@Autowired
private FightDao fightDao;

public boolean addFight(int player1,int player2,String song1,String song2,String des,int state){
	Fight fight=new Fight();
	fight.setDes(des);
	fight.setPlayer1(player1);
	fight.setPlayer2(player2);
	fight.setSong1(song1);
	fight.setSong2(song2);
	fight.setState(state);
	int i=fightDao.addFight(fight);
	if(i>0){
		return true;
	}else {
		return false;
	}
}
public boolean addRecord(int userid,int player,int fight){
	VoteRecord voteRecord=new VoteRecord();
	voteRecord.setFight(fight);
	voteRecord.setPlayer(player);
	voteRecord.setUserid(userid);
	int i=fightDao.addRecord(voteRecord);
	if(i>0){
		return true;
	}else {
		return false;
	}
}
public boolean Isduplicate(VoteRecord voteRecord){
	VoteRecord v=fightDao.Isduplicate(voteRecord);
	if(v!=null){
		return false;
	}else {
		return true;
	}
	
}
public List<Fight> fightList(){
	return fightDao.fightList();
}

public int updataState1(int i){
	return fightDao.updataState1(i);
}
public int updataState2(int i){
	return fightDao.updataState2(i);
}
public QueryFight queryFight( ){
	return fightDao.queryFight();
}
public int updataticket1(int i){
	return fightDao.updataticket1(i);
}
public int updataticket2(int i){
	return fightDao.updataticket2(i);
}
public List<User> queryUserByVote(VoteRecord voteRecord){
	return fightDao.queryUserByVote(voteRecord);
}
}
