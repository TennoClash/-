package Shixun2018.dao;

import Shixun2018.entity.User;

public interface UserDao {
	User getUser(User user);
	int addUser(User user);
	User getUserByName(String i);
}
