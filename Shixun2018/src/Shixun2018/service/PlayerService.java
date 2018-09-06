package Shixun2018.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Shixun2018.dao.PlayerDao;
import Shixun2018.entity.Player;
@Service
public class PlayerService {
	@Autowired
	private PlayerDao playerDao;
	
public int addPlayer(Player player){
	return playerDao.addPlayer(player);
}
public List<Player>  getPlayers(){
	return playerDao.getPlayers();
}
}
