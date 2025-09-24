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
import com.xuanke.dao.RoleMapper;
import com.xuanke.dao.ShopDao;
import com.xuanke.dao.UserDao;
import com.xuanke.module.Role;
import com.xuanke.module.Shop;
import com.xuanke.module.User;
import com.xuanke.service.UserService;
import com.xuanke.util.DataEntity;
import com.xuanke.util.FederatedStudentCourseRecommender;
import com.xuanke.util.JsonUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@RequestMapping("/admin/user")
@Controller
public class UserController {

	@Autowired
	private UserService userservice;
	@Autowired
	private UserDao dao;
	@Autowired
	private RoleMapper roledao;
	@Autowired
	private ShopDao sdao;
	
	
	//调用用户管理主页
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(@RequestParam Integer rid,HttpServletRequest request) {
		request.setAttribute("rid", rid);
		return "user/index";
	}
	
	//查询用户管理列表
	@RequestMapping(value="/getList",method=RequestMethod.GET)
	@ResponseBody
	public String getList(HttpServletRequest request,@RequestParam int rid,@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
		User user = (User)request.getSession().getAttribute("admin");
		PageHelper.startPage(page, limit,true);
        Example example = new Example(User.class);
        Criteria criteria = example.createCriteria();
        criteria.andEqualTo("rid", rid);
        if (user.getRid()==2) {
            criteria.andEqualTo("bid", user.getBid());
		}
        List<User> list = dao.selectByExample(example);
		Map<String,Object> result = new HashMap<>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", dao.selectAll().size());
		result.put("data", list);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	
	//调用添加用户管理页面
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addGET(@RequestParam Integer rid,HttpServletRequest request) {
		request.setAttribute("rid", rid);
		return "user/add";
	}

	//添加用户管理方法
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity addPOST(User user) {
		Role role = roledao.selectByPrimaryKey(user.getRid());
		user.setRname(role.getName());
		Integer res = userservice.insert(user);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	//调用编辑用户管理页面
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String editGET(@RequestParam Integer id,HttpServletRequest request) {
		User data = userservice.getUser(id);
		request.setAttribute("data", data);
		return "user/edit";
	}

	//编辑用户管理方法
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity editPOST(User user) {
		Role role = roledao.selectByPrimaryKey(user.getRid());
		user.setRname(role.getName());
		Integer res = userservice.update(user);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	//删除用户管理方法
	@RequestMapping(value="/del",method=RequestMethod.GET)
	@ResponseBody
	public DataEntity delete(@RequestParam Integer id) {
		Integer res = userservice.delete(id);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	

}