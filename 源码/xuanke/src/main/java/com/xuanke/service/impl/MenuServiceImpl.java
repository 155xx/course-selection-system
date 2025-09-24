package com.xuanke.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xuanke.dao.MenuDAO;
import com.xuanke.module.Menu;
import com.xuanke.module.User;
import com.xuanke.service.MenuService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuDAO menuDAO;
	
	
	@Override
	public List<Menu> select(HttpServletRequest request) {
		List<Menu> list = new ArrayList<Menu>();
		list = menuDAO.selectAll();
		return list;
	}

	@Override
	public Integer delete(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer insert(Menu chuku) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(Menu chuku) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
