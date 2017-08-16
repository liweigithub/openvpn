package com.openvpn.dao.ipml;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.openvpn.common.DBUtils;
import com.openvpn.common.TransactionManage;
import com.openvpn.dao.BaseDAO;
import com.openvpn.entity.User;

public class UserDao implements BaseDAO<User> {

	@Override
	public void save(User user) throws SQLException {
		String sql = "INSERT INTO user (username,password,enabled,name,email,note,quota_bytes) values (?,ENCRYPT(?),?,?,?,?,?)";
		QueryRunner run = new QueryRunner();
		run.insert(TransactionManage.getConnection(), sql,
				new BeanHandler<User>(User.class), user.getUsername(),
				user.getPassword(), user.getEnabled(), user.getName(),
				user.getEmail(), user.getNote(), user.getQuota_bytes());
		TransactionManage.close();
	}

	@Override
	public int delete(User user) throws Exception {
		String sql = "delete from user where id=? and usernmae=? and password=?";
		QueryRunner run = new QueryRunner();
		int update = run.update(TransactionManage.getConnection(), sql,
				user.getId(), user.getUsername(), user.getPassword());
		TransactionManage.close();
		return update;
	}

	@Override
	public User findById(Integer id) throws Exception {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from user where id=?";
		User query = queryRunner.query(TransactionManage.getConnection(), sql,
				new BeanHandler<User>(User.class), id);
		TransactionManage.close();
		return query;
	}

	public User findByName(String username) throws Exception {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from user where username=?";
		User query = queryRunner.query(TransactionManage.getConnection(), sql,
				new BeanHandler<User>(User.class), username);
		TransactionManage.close();
		return query;
	}

	@Override
	public User findByExample(User instance) throws Exception {
		QueryRunner run = new QueryRunner();

		User user = run.query(TransactionManage.getConnection(),
				"select * from user where username=?", new BeanHandler<User>(
						User.class), instance.getUsername());

		User query = run
				.query(TransactionManage.getConnection(),
						"select * from user where username=? and password=ENCRYPT(?,?)",
						new BeanHandler<User>(User.class),
						instance.getUsername(), instance.getPassword(),
						user.getPassword());
		TransactionManage.close();
		return query;

	}

	@Override
	public List<User> findAll() throws Exception {
		QueryRunner run = new QueryRunner();
		List<User> account = run.query(DBUtils.getConnection(),
				"select * from user order by quota_bytes desc",
				new BeanListHandler<User>(User.class));
		TransactionManage.close();
		return account;
	}

	@Override
	public int update(User user) throws Exception {
		String sql = "update user set username=?,enabled=?,name=?,email=?,note=?,quota_bytes=? where username=?";
		QueryRunner run = new QueryRunner();
		int update = run.update(TransactionManage.getConnection(), sql,
				user.getUsername(), user.getEnabled(), user.getName(),
				user.getEmail(), user.getNote(), user.getQuota_bytes(),
				user.getUsername());
		TransactionManage.close();
		return update;
	}

	public int resetPassword(String username, String password) throws Exception {
		String sql = "update user set password=ENCRYPT(?) where username=?";
		QueryRunner run = new QueryRunner();
		int update = run.update(TransactionManage.getConnection(), sql,
				password, username);
		TransactionManage.close();
		return update;
	}

	public List<User> findByUsername(String username) throws Exception {
		QueryRunner run = new QueryRunner();
		List<User> account = run.query(DBUtils.getConnection(),
				"select * from user where username=?",
				new BeanListHandler<User>(User.class), username);
		TransactionManage.close();
		return account;
	}

	public void registerUser(User user) throws Exception {
		String sql = "INSERT INTO user (username,password,enabled,name,email,note,quota_bytes) values (?,ENCRYPT(?),?,?,?,?,?)";
		QueryRunner run = new QueryRunner();
		run.insert(TransactionManage.getConnection(), sql,
				new BeanHandler<User>(User.class), user.getUsername(),
				user.getPassword(), 1, user.getName(),
				user.getEmail(), "试用用户", 200);
		TransactionManage.close();
	}
}
