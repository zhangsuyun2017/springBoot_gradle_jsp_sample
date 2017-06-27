package com.test.demo.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.demo.entity.User;

@Controller 
@RequestMapping("/index")  
public class HelloController {  
  
    @RequestMapping("/{id}")  
    public User view(@PathVariable("id") Long id) {  
        User user = new User();
        user.setId(id);  
        user.setName("zhang");  
        return user;  
    }  
  
    @RequestMapping("/homePage")
    public ModelAndView homePage(Map<String, Object> model) {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("hello");
    	User user = new User();
        user.setId(100L);  
        user.setName("张三");
        user.setAge(100);
        view.addObject("user", user);
        view.addObject("msg", "张三");
        
        List list = new ArrayList();
        list.add(user);
        
        view.addObject("list", list);
        return view;
    }
  
}  
