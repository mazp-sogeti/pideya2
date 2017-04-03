package com.home.pideya;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.home.mongo.repositories.UsersRepository;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	@Autowired
	private UsersRepository repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView helloWorld( ModelMap model ) {
		List users = repository.findAll();

		ModelAndView modelAndView = new ModelAndView("index");		
		modelAndView.addObject("users", users );
		return modelAndView;
	}
}