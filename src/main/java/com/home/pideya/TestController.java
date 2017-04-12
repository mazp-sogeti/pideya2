package com.home.pideya;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import com.home.models.Pedido;
import com.home.models.Users;
import com.home.mongdbConf.SpringMongoConfig;
import com.home.mongo.repositories.PedidoRepository;
import com.home.mongo.repositories.UsersRepository;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;


@RestController
public class TestController {

	@Autowired
	private PedidoRepository repository;
	
	ApplicationContext ctx =
            new AnnotationConfigApplicationContext(SpringMongoConfig.class);
	MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
	
	
	
    @CrossOrigin(origins = "http://localhost:9000/pideya")
	@RequestMapping(value = "/test/{qrCode}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Pedido> helloWorld2(@PathVariable("qrCode") String qrCode) {
    	
		List<Pedido> pList = new ArrayList<Pedido>();
		Pedido p;
		// List listAllPedidos = repository.findAll();
		
//			p = new Pedido();
//			p.setMesa("mesa1");
//			p.setPedido("Pizza");
//			p.setRestaurante(qrCode);
//			repository.save(p);
	//		pList.add(p);
//			
//			p = new Pedido();
//			p.setMesa("mesa2");
//			p.setPedido("Burguer");
//			p.setRestaurante("masmas");
//			repository.save(p);
//			pList.add(p);

			Query searchUserQuery = new Query(Criteria.where("restaurante").is(qrCode));
			
			List ped = mongoOperation.find(searchUserQuery, Pedido.class);
			
//			DBCollection table = db.getCollection("Students");
//			BasicDBObject courseNameDBObject = new BasicDBObject("course.course_name", "Java EE") ;
//			DBCursor cursor = table.find(courseNameDBObject);
//			while(cursor.hasNext()){
//			    System.out.println(cursor.next());
//			}
			
		ModelAndView modelAndView = new ModelAndView("home");
		if(ped!=null && ped.size() > 0)
		modelAndView.addObject("users", ped);
		return ped;
	}
    
    @GetMapping("/home")
    public ModelAndView greeting() {
		ModelAndView modelAndView = new ModelAndView("index2");
        System.out.println("==== in greeting ====");
        return modelAndView;
    }
}
