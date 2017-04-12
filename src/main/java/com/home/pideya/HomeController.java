package com.home.pideya;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.home.models.Users;
import com.home.mongo.repositories.UsersRepository;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	@Autowired
	private UsersRepository repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView helloWorld(ModelMap model) {
		// for( int i=0;i<5;i++){
		// Users u = new Users();
		// u.setFirstName("pingaSolar"+i);
		// repository.save(u);
		// }

		List<Users> users2 = new ArrayList<Users>();

		List users = repository.findAll();
		for (Users dd : (List<Users>) users) {
			if (dd.getFirstName().equals("pingaSolar2"))
				repository.delete(dd.getId());
			else
				users2.add(dd);
 
		}
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("users", users2);
		return modelAndView;
	}

}