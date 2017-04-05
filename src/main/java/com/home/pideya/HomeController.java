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

// @Controller
// public class HomeController {
//
// @Autowired
// private UsersRepository repository;
//
// @RequestMapping(value = "/", method = RequestMethod.GET)
// public ModelAndView helloWorld( ModelMap model ) {
// List users = repository.findAll();
//
// ModelAndView modelAndView = new ModelAndView("index");
// modelAndView.addObject("users", users );
// return modelAndView;
// }
// }

@Controller
public class HomeController {

	@Autowired
	private MongoTemplate mongoTemplate;
	 @Autowired
	 private UsersRepository repository;
	 
	 @Autowired
	 private MongoOperations mongoOperations;
	 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		logger.info("Welcome home! the client locale is " + locale.toString());
		

		Query searchUserQuery = new Query(Criteria.where("username").is("codesilo"));
	
		
			
		Users user = repository.findUsersByName("codesilo");
		//List<Users> users = repository.findAll();
				

		System.out.println("retrieve user with Query--------"+ user);
		model.addAttribute("user", user.toString());

		return "home";
	}

}