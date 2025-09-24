package com.xuanke.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.github.pagehelper.PageHelper;
import com.xuanke.dao.OrderDAO;
import com.xuanke.dao.RoleMapper;
import com.xuanke.dao.ShopDao;
import com.xuanke.dao.UserDao;
import com.xuanke.module.Order;
import com.xuanke.module.Role;
import com.xuanke.module.Shop;
import com.xuanke.module.User;
import com.xuanke.service.UserService;
import com.xuanke.util.DataEntity;
import com.xuanke.util.JsonUtils;

import tk.mybatis.mapper.entity.Example;

@RequestMapping("/admin/order")
@Controller
public class OrderController {

	@Autowired
	private OrderDAO dao;
	@Autowired
	private ShopDao shopdao;

	@Autowired
	private UserDao userdao;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpServletRequest request) {
		return "order/index";
	}

	
	@RequestMapping(value="/getList",method=RequestMethod.GET)
	@ResponseBody
	public String getList(HttpServletRequest request,@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
        PageHelper.startPage(page, limit,true);
        Example example = new Example(Order.class);
        User user = (User)request.getSession().getAttribute("admin");
        example.createCriteria().andEqualTo("uid", user.getId());
        List<Order> list = dao.selectByExample(example);
		Map<String,Object> result = new HashMap<>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", dao.selectAll().size());
		result.put("data", list);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addGET(HttpServletRequest request) {
		List<Shop> shoplist = shopdao.selectAll();
		request.setAttribute("shoplist", shoplist);
		return "order/add";
	}

	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity addPOST(Order data) {
		Shop shop = shopdao.selectByPrimaryKey(data.getSid());
		data.setSname(shop.getName());
		data.setUid2(shop.getUid());
		data.setUname2(shop.getUname());
		data.setState("已选课");
		Integer res = dao.insert(data);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	
	
	
	@RequestMapping(value="/tuiding",method=RequestMethod.GET)
	@ResponseBody
	public DataEntity tuiding(@RequestParam Integer id) {
		Order order = dao.selectByPrimaryKey(id);
		order.setState("已退课");
		Integer res = dao.updateByPrimaryKey(order);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	
}