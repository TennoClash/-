package Shixun2018.dao;

import java.util.List;

import Shixun2018.entity.Player;

public interface PlayerDao {
	int addPlayer(Player player);
	Player getPlayer(Player player);
	List<Player> getPlayers();
}
