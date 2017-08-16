package com.openvpn.dao.ipml;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.openvpn.common.TransactionManage;
import com.openvpn.entity.Account;

public class AccountDaoImpl  {

	public void update(Account account) throws Exception {
		QueryRunner run = new QueryRunner();
		run.update(TransactionManage.getConnection(),
				"update account set money=? where name=?", account.getMoney(),
				account.getName());
	}

	
	public Account findAccountByName(String name) throws Exception {
		QueryRunner run = new QueryRunner();
		return run.query(TransactionManage.getConnection(),
				"select * from account where name=?", new BeanHandler<Account>(
						Account.class), name);
	}
}
