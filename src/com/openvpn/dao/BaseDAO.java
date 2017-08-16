package com.openvpn.dao;

import java.util.List;

public interface BaseDAO<T> {

	public void save(T t) throws Exception;

	public int update(T t) throws Exception ;
	
	public int delete(T admin) throws Exception;

	public T findById(java.lang.Integer id) throws Exception;

	public T findByExample(T t) throws Exception;

	public List<T> findAll() throws Exception;
}