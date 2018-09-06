package Shixun2018.dao;

import java.util.List;

import Shixun2018.entity.Fight;
import Shixun2018.entity.Player;
import Shixun2018.entity.QueryFight;
import Shixun2018.entity.User;
import Shixun2018.entity.VoteRecord;

public interface FightDao {
int addFight(Fight fight);

List<Fight> fightList();

int updataState1(int i);

int updataState2(int i);

QueryFight queryFight();

int updataticket1(int i);

int updataticket2(int i);

int addRecord(VoteRecord voteRecord);

VoteRecord Isduplicate(VoteRecord voteRecord);

List<User> queryUserByVote(VoteRecord voteRecord);
}
