package com.openvpn.dao.ipml;

import java.math.BigDecimal;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.openvpn.common.TransactionManage;
import com.openvpn.entity.User;
/**
 * 
 * @author liwei
 * 统计用户使用流量情况
 */
public class LogDao {
	/**
	 * 用的流量
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public BigDecimal findUserSend(User user) throws Exception {
		String sql = "select round(sum(bytes_sent)/1024/1024,2) from log where username=?";
		QueryRunner queryRunner = new QueryRunner();
		 BigDecimal decimal = queryRunner.query(TransactionManage.getConnection(), sql,
				new ScalarHandler<BigDecimal>(), user.getUsername());
		 TransactionManage.close();
		 return decimal;
	}

	
	public BigDecimal findUserReceived(User user) throws Exception {
		String sql = "select round(sum(bytes_received)/1024/1024,2) from log where username=?";
		QueryRunner queryRunner = new QueryRunner();
		 BigDecimal query = queryRunner.query(TransactionManage.getConnection(), sql,
				new ScalarHandler<BigDecimal>(), user.getUsername());
		 TransactionManage.close();
		 return query;
	}
}
