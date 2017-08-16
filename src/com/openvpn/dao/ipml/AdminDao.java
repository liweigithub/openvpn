package com.openvpn.dao.ipml;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.openvpn.common.TransactionManage;
import com.openvpn.dao.BaseDAO;
import com.openvpn.entity.Admin;

public class AdminDao implements BaseDAO<Admin> {

	@Override
	public void save(Admin admin) throws SQLException {
		String sql = "INSERT INTO admin (username, password) VALUES('?', ENCRYPT('?'));";
		QueryRunner run = new QueryRunner();
		Admin insert = run.insert(TransactionManage.getConnection(), sql,
				new BeanHandler<Admin>(Admin.class), admin.getUsername());
	}

	@Override
	public int delete(Admin admin) throws Exception {
	
		return 0 ;
	}

	@Override
	public Admin findById(Integer id) throws Exception {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from admin where id=?";
		return queryRunner.query(TransactionManage.getConnection(), sql,
				new BeanHandler<Admin>(Admin.class), id);
	}

	@Override
	public Admin findByExample(Admin instance) throws Exception {
		QueryRunner run = new QueryRunner();
	
		
		 Admin admin = run.query(TransactionManage.getConnection(),
				"select * from admin where username=? and password=?",
				new BeanHandler<Admin>(Admin.class), instance.getUsername(),
				instance.getPassword());
		 TransactionManage.close();
		 return admin;
		
	}

	
	@Override
	public List<Admin> findAll() {
		return null;
	}

	@Override
	public int update(Admin t) {
		return 0;
	}
}
