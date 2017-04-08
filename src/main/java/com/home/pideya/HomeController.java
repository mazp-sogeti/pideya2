package com.home.pideya;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.home.models.Users;
import com.home.mongo.repositories.UsersRepository;

/**
 * Handles requests for the application home page.
 */

//	 @Controller
//	 public class HomeController2 {
//	
//		 @Autowired
//		 private UsersRepository repository;
//		
//		// @RequestMapping(value = "/", method = RequestMethod.GET)
//		 @RequestMapping(value = "/kfkfkfkfkfk")
//		 //public ModelAndView helloWorld( ModelMap model ) {
//		 public String helloWorld(  ) {
//		 //List users = repository.findAll();
//		
//		 //ModelAndView modelAndView = new ModelAndView("index");
//		 //modelAndView.addObject("users", users );
//		 return "login";
//		 }
	 

@Controller
public class HomeController {

	@Autowired
	private MongoTemplate mongoTemplate;
	
	
//	 @Autowired
//	 private UsersRepository repository;
//	 

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		MongoOperations mongoOperation = (MongoOperations)mongoTemplate;
		 //Users user = mongoOperation.findOne(new Query(Criteria.where("username").is("codesilo")), Users.class);
		Query searchUserQuery = new Query(Criteria.where("username").is("codesilo"));
		
//		for(int i=0;i<4;i++){
//			Users user = new Users("mazp"+i, "Password", "marcelus", "zeron","marcelusz@hotmial.com ","ps donde tu quieras # 1",1);
//			mongoOperation.save(user);
//			
//		}
		//Users user = new Users("mazp", "Password", "marcelus", "zeron","marcelusz@hotmial.com ","ps donde tu quieras # 1",1);
		//mongoOperation.save(user);
		/// user= repository.save(user);	
		//Users user2 = repository.findUsersByName("codesilo");
		//List<Users> users = repository.findAll();
		 Users user = mongoOperation.findOne(new Query(Criteria.where("username").is("codesilo")), Users.class);
		// mongoOperation.remove(new Query(Criteria.where("lastName").is("zeron")), Users.class);
//		System.out.println("retrieve user with Query--------"+ user);
//		model.addAttribute("user", user.toString());

		return "home";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String getUser(Locale locale, Model model) {
		return "UserManagement";
	}
 	}

