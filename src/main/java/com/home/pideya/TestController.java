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
import java.util.Collections;

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
import com.pusher.rest.Pusher;


@RestController
public class TestController {

	ModelAndView modelAndView;
	@Autowired
	private PedidoRepository repository;
	
	ApplicationContext ctx =
            new AnnotationConfigApplicationContext(SpringMongoConfig.class);
	MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
	
	
	
    @CrossOrigin(origins = "http://localhost:9000/pideya")
	@RequestMapping(value = "/test/{qrCode}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ModelAndView helloWorld2(HttpServletRequest request,@PathVariable("qrCode") String qrCode) {
    	
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
			
		//	List ped = mongoOperation.find(searchUserQuery, Pedido.class);
			
//			DBCollection table = db.getCollection("Students");
//			BasicDBObject courseNameDBObject = new BasicDBObject("course.course_name", "Java EE") ;
//			DBCursor cursor = table.find(courseNameDBObject);s
//			while(cursor.hasNext()){
//			    System.out.println(cursor.next());
//			}
		
		ModelAndView modelAndView = new ModelAndView("index2");
		String[] parts = qrCode.split("YY");
		String RESTAURANTE = parts[0]; 
		String MESA = parts[1];
		
		request.setAttribute("res", RESTAURANTE);
		request.setAttribute("mesa", MESA);
	  //  request.setAttribute("pList", ped);
		//if(ped!=null && ped.size() > 0)
		//modelAndView.addObject("users", ped);
		return modelAndView;
	}
    
	@RequestMapping(value = "/test/comprado/{id}", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView greeting(HttpServletRequest request,@PathVariable("id") String id) {
		
		modelAndView = new ModelAndView("MisPedidos");
		//request.setAttribute("res", res);
        System.out.println("==== in pedido ====");
        
        if(id.equals("nada"))
        	{
    		modelAndView = new ModelAndView("index2");
            request.setAttribute("result", "id igual a nada");
    		return modelAndView;
        	}
        try{
        	Pedido p = new Pedido();
			Query query = new Query(Criteria.where("id").is(id));
        	p = mongoOperation.findOne(query, Pedido.class);
        	request.setAttribute("pedido", p);
        	request.setAttribute("count", String.valueOf(p.getPedido().size()));
        	request.setAttribute("result", "Pedido enviado");
        }catch(Exception e){
            request.setAttribute("result", e.getLocalizedMessage());
        }
        return modelAndView;
    }
	
		@RequestMapping(value = "/test/pedidos/{restaurante}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ModelAndView verPedidos(HttpServletRequest request,@PathVariable("restaurante") String restaurante) {

			modelAndView = new ModelAndView("pedidos");
			Query searchUserQuery = new Query(Criteria.where("restaurante").is(restaurante));
			List ped = mongoOperation.find(searchUserQuery, Pedido.class);
		    request.setAttribute("pList", ped);
	   return modelAndView;
	   }
		//confirmar directo 
		@RequestMapping(value = "/test/confirmar", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ModelAndView test(HttpServletRequest request) {
			modelAndView = new ModelAndView("confPedido");
			 try{
		        	Pedido p = new Pedido();
		        	String a = (String)request.getParameter("day");
		        	p.setRestaurante((String)request.getParameter("restaurante"));
		        	p.setMesa((String)request.getParameter("mesas"));
		        	String pedido1 = ((String)request.getParameter("day"));
		        	String pedido2 = ((String)request.getParameter("day2"));
		        	List<String> L = new ArrayList<String>();
		        	L.add(pedido1);
		        	L.add(pedido2);
		        	p.setPedido(L);
		        	mongoOperation.save(p);
		        	
		        	Pusher pusher = new Pusher("327249", "25a63b5bdeb97ea6104e", "1c9a836061a07adf968b");
					pusher.setCluster("eu");
					pusher.setEncrypted(true);
					
					pusher.trigger("my-channel", "my-event", Collections.singletonMap("message", p));
		        	
//		        	//pusher start
//		        	Pusher pusher = new Pusher("327249", "25a63b5bdeb97ea6104e", "1c9a836061a07adf968b");
//					pusher.setCluster("eu");
//					pusher.setEncrypted(true);
//					pusher.trigger("my-channel", "my-event", Collections.singletonMap("message", p));
//		        	//pedidospusher end
					
					request.setAttribute("result", "Pedido enviado");
		        	request.setAttribute("pedido", p);
		        	modelAndView.addObject("pedido", p);
		        }catch(Exception e){
		            request.setAttribute("result", e.getLocalizedMessage());
		        }
			return modelAndView;
	   }
		
		//confirmar despues de comprar mas 
				@RequestMapping(value = "/test/confirmar/{id}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
				@ResponseBody
				public ModelAndView comprarDespuesDeMas(HttpServletRequest request,@PathVariable("id") String id) {
					modelAndView = new ModelAndView("confPedido");
					 try{
						 Pedido p = new Pedido();
				        	String a = (String)request.getParameter("day");
				        	String pedido1 = ((String)request.getParameter("day"));
				        	String pedido2 = ((String)request.getParameter("day2"));
				        	List<String> L = new ArrayList<String>();
				        	//L.add(pedido1);
				        	//L.add(pedido2);
				        	int count=0;			        	
				        	
				        	if(id!=null)
				        	{
				        		p.setId(id);
				        	}
				        	
				        	Query searchUserQuery = new Query(Criteria.where("id").is(id));
							
							Pedido ped = mongoOperation.findOne(searchUserQuery, Pedido.class);
							if (ped!=null)
							{
								L = ped.getPedido();
								L.add(pedido2);
								ped.setPedido(L);
					        	mongoOperation.save(ped);
					        	Pusher pusher = new Pusher("327249", "25a63b5bdeb97ea6104e", "1c9a836061a07adf968b");
								pusher.setCluster("eu");
								pusher.setEncrypted(true);
								
								pusher.trigger("my-channel", "my-event", Collections.singletonMap("message", p));
					        	
								for(String s :  ped.getPedido())
								{
									count++;
								}
							}
				        	
							request.setAttribute("pedido",ped);
				        	//mongoOperation.save(p);
				        	
				        	request.setAttribute("count",  String.valueOf(count));
				        }catch(Exception e){
				            request.setAttribute("result", e.getLocalizedMessage());

				        }
				        return modelAndView;
			   }
		
		@RequestMapping(value = "/test/test2/{id}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ModelAndView test2(HttpServletRequest request,@PathVariable("id") String id) {
			
			modelAndView = new ModelAndView("index");
			 try{
		        	Pedido p = new Pedido();
					Query query = new Query(Criteria.where("id").is(id));
		        	p = mongoOperation.findOne(query, Pedido.class);
		        	//p = (Pedido)request.getAttribute("pedido");
					request.setAttribute("result", "Pedido enviado");
		        	request.setAttribute("pedidoF", p);
		        }catch(Exception e){
		            request.setAttribute("result", e.getLocalizedMessage());
		        }
			
			// modelAndView = test2Home(request);//new ModelAndView("redirect:home");
			return modelAndView;
	   }
		//despues de la compra devuelve al index
		@RequestMapping(value = "/test/home/{id}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ModelAndView test2Home(HttpServletRequest request,@PathVariable("id") String id) {
			modelAndView = new ModelAndView("index2");
			 try{
				 if(id.equals("nada"))
				 {
						modelAndView = new ModelAndView("index");
						return modelAndView;
				 }
		        	Pedido p = new Pedido();
		        	Query query = new Query(Criteria.where("id").is(id));
		        	p = mongoOperation.findOne(query, Pedido.class);
		        	String d1 = (String)request.getAttribute("day");
		        	String d2 =(String)request.getAttribute("day2");
		        	List<String> pe = new ArrayList<String>();
		        	if(d1!=null)
		        		pe.add(d1);
		        	
		        	p.setPedido(pe);
		        	request.setAttribute("count", String.valueOf(p.getPedido().size()));
					//request.setAttribute("result", "Pedido enviado");
		        	request.setAttribute("res", p.getRestaurante());
		        	request.setAttribute("mesa", p.getMesa());
		        	request.setAttribute("pedido", p);
		        }catch(Exception e){			
		            request.setAttribute("result", e.getLocalizedMessage());
		        }
			return modelAndView;
	   }
		
		//carrito
		@RequestMapping(value = "/test/carrito/{id}", method = {RequestMethod.POST,RequestMethod.GET})
		@ResponseBody
		public ModelAndView greeting34(HttpServletRequest request,@PathVariable("id") String id) {
			modelAndView = new ModelAndView("Carrito");
			//request.setAttribute("res", res);
	        System.out.println("==== in carrito ====");
	        int count=0;
	        try{
	        	Pedido p = new Pedido();
	        	if(id!=null)
	        	{
	        		p.setId(id);
	        	}
	        	Query searchUserQuery = new Query(Criteria.where("id").is(id));
				
				Pedido ped = mongoOperation.findOne(searchUserQuery, Pedido.class);
				if (ped!=null)
				{
					for(String s :  ped.getPedido())
					{
						count++;
					}
				}
	        	
				request.setAttribute("pedido",ped);
	        	//mongoOperation.save(p);
	        	
	        	request.setAttribute("count", String.valueOf(count));
	        }catch(Exception e){
	            request.setAttribute("result", e.getLocalizedMessage());

	        }
	        return modelAndView;
	    }
		
		//seguir comprando por primera vez --> guarda el pedido y genera id
				@RequestMapping(value = "/test/seguir", method = {RequestMethod.POST,RequestMethod.GET})
				@ResponseBody
				public ModelAndView SeguirComprando(HttpServletRequest request) {
					modelAndView = new ModelAndView("index2");
					//request.setAttribute("res", res);
			        System.out.println("==== in seguir comprando primera vez ====");
			        int count=0;
			        try{
			        	Pedido p = new Pedido();
			        	String a = (String)request.getParameter("day");
			        	p.setRestaurante((String)request.getParameter("restaurante"));
			        	p.setMesa((String)request.getParameter("mesas"));
			        	String pedido1 = ((String)request.getParameter("day"));
			        	String pedido2 = ((String)request.getParameter("day2"));
			        	List<String> L = new ArrayList<String>();
			        	//L.add(pedido1);
			        	L.add(pedido2);
			        	p.setPedido(L);
			        	mongoOperation.save(p);
			        	count = p.getPedido().size();
			        	
						request.setAttribute("pedido",p);
			        	//mongoOperation.save(p);
						request.setAttribute("id",p.getId());
			        	request.setAttribute("count", String.valueOf(count));
			        }catch(Exception e){
			            request.setAttribute("result", e.getLocalizedMessage());

			        }
			        return modelAndView;
			    }
				
				//seguir comprando por segunda y mas veces --> recupera pedido por id
				@RequestMapping(value = "/test/seguir/{id}", method = {RequestMethod.POST,RequestMethod.GET})
				@ResponseBody
				public ModelAndView SeguirComprando2(HttpServletRequest request,@PathVariable("id") String id) {
					modelAndView = new ModelAndView("index2");
					//request.setAttribute("res", res);
			        System.out.println("==== in seguir comprando ====");
			        int count=0;
			        try{
			        	
			        	Pedido p = new Pedido();
			        	String a = (String)request.getParameter("day");
			        	String pedido1 = ((String)request.getParameter("day"));
			        	String pedido2 = ((String)request.getParameter("day2"));
			        	List<String> L = new ArrayList<String>();
			        	//L.add(pedido1);
			        	//L.add(pedido2);
			        				        	
			        	
			        	if(id!=null)
			        	{
			        		p.setId(id);
			        	}
			        	
			        	Query searchUserQuery = new Query(Criteria.where("id").is(id));
						
						Pedido ped = mongoOperation.findOne(searchUserQuery, Pedido.class);
						if (ped!=null)
						{
							L = ped.getPedido();
							L.add(pedido2);
							ped.setPedido(L);
				        	mongoOperation.save(ped);
							for(String s :  ped.getPedido())
							{
								count++;
							}
						}
			        	
						request.setAttribute("pedido",ped);
			        	//mongoOperation.save(p);
			        	
			        	request.setAttribute("count",  String.valueOf(count));
			        }catch(Exception e){
			            request.setAttribute("result", e.getLocalizedMessage());

			        }
			        return modelAndView;
			    }
		
}
