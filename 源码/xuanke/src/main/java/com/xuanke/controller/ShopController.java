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
import com.xuanke.util.JsonUtils;

import tk.mybatis.mapper.entity.Example;

@RequestMapping("/admin/shop")
@Controller
public class ShopController {

	@Autowired
	private ShopDao dao;

	@Autowired
	private UserDao userdao;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpServletRequest request) {
		return "shop/index";
	}

	@RequestMapping(value="/index2",method=RequestMethod.GET)
	public String index2(HttpServletRequest request) {
		return "shop/index2";
	}
	
	@RequestMapping(value="/getList",method=RequestMethod.GET)
	@ResponseBody
	public String getList(@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
        PageHelper.startPage(page, limit,true);
        Example example = new Example(Shop.class);
        List<Shop> list = dao.selectByExample(example);
		Map<String,Object> result = new HashMap<>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", dao.selectAll().size());
		result.put("data", list);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	
	@RequestMapping(value="/getList2",method=RequestMethod.GET)
	@ResponseBody
	public String getList2(HttpServletRequest request,@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
		User user = (User)request.getSession().getAttribute("admin");
		PageHelper.startPage(page, limit,true);
        Example example = new Example(Shop.class);
        example.createCriteria().andEqualTo("uid", user.getId());
        List<Shop> list = dao.selectByExample(example);
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
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("rid", 2);
		List<User> userlist = userdao.selectByExample(example);
		request.setAttribute("userlist", userlist);
		return "shop/add";
	}

	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity addPOST(Shop data) {
		User user = userdao.selectByPrimaryKey(data.getUid());
		data.setUname(user.getName());
		Integer res = dao.insert(data);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String editGET(@RequestParam Integer id,HttpServletRequest request) {
		Shop data = dao.selectByPrimaryKey(id);
		request.setAttribute("data", data);
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("rid", 2);
		List<User> userlist = userdao.selectByExample(example);
		request.setAttribute("userlist", userlist);
		return "shop/edit";
	}

	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity editPOST(Shop data) {
		User user = userdao.selectByPrimaryKey(data.getUid());
		data.setUname(user.getName());
		Integer res = dao.updateByPrimaryKey(data);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	
	@RequestMapping(value="/del",method=RequestMethod.GET)
	@ResponseBody
	public DataEntity delete(@RequestParam Integer id) {
		Integer res = dao.deleteByPrimaryKey(id);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	
}