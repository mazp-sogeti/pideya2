package com.home.pideya;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType; 
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.util.UriComponentsBuilder;

import com.home.models.Users;
import com.home.mongo.repositories.UsersRepository;


@Controller
public class HelloWorldRestController {
	  
	@Autowired
	 private MongoTemplate mongoTemplate;
	 
	 @Autowired
	 private UsersRepository repository;
	 
	    //-------------------Retrieve All Users--------------------------------------------------------
	      
		@ResponseBody
	    @ResponseStatus(HttpStatus.OK)
	    @RequestMapping(value = "/user/", method = RequestMethod.GET)
	 
	    public ResponseEntity <List<Users>> listAllUsers() {
		 MongoOperations mongoOperation = (MongoOperations)mongoTemplate;
		 List<Users> listUser = mongoOperation.findAll(Users.class);
		 
		 System.out.println("Users----from-----Restcontroller"+ listUser);
		 
	     if(listUser.isEmpty()){
	            return new ResponseEntity<List<Users>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
	        }
	        return new ResponseEntity<List<Users>>(listUser, HttpStatus.OK);
	    }
		
		
	      
	    //------------------- Update a User --------------------------------------------------------
	      
	    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	    public ResponseEntity<Users> updateUser(@PathVariable("id") String id, @RequestBody Users user) {
	        System.out.println("Updating User-------- restController " + id);
	          
		   	 MongoOperations mongoOperation = (MongoOperations)mongoTemplate;
	        Users currentUser = mongoOperation.findById(id, Users.class);
	        if (currentUser==null) {
	            System.out.println("User with id " + id + " not found");
	            return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
	        }
	  
	        currentUser.setUsername(user.getUsername());
	        currentUser.setAddress(user.getAddress());
	        currentUser.setEmail(user.getEmail());
	        mongoOperation.save(currentUser);
	       //mongoOperation.findAndModify(new Query(Criteria.where("").is("codesilo")), currentUser, Users.class);
	        return new ResponseEntity<Users>(currentUser, HttpStatus.OK);
	    }
	  
	     
	//    -------------------Retrieve Single User--------------------------------------------------------
	      
	    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	    public ResponseEntity<Users> getUser(@PathVariable("id") String id) {
	        System.out.println("Fetching User with id------RestController " + id);
	   	 MongoOperations mongoOperation = (MongoOperations)mongoTemplate;
	        //Users user = mongoOperation.findById(id, Users.class);
	   	 Users user = repository.findUsersByName(id);
	        if (user == null) {
	            System.out.println("User with id " + id + " not found");
	            return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
	        }
	        return new ResponseEntity<Users>(user, HttpStatus.OK);
	    }
	  
	      
	      
//	    //-------------------Create a User--------------------------------------------------------
	      
	    @RequestMapping(value = "/user/", method = RequestMethod.POST)
	    public ResponseEntity<Void> createUser(@RequestBody Users user,    UriComponentsBuilder ucBuilder) {
	        System.out.println("Creating User " + user.getUsername());
	        MongoOperations mongoOperation = (MongoOperations)mongoTemplate;
	        
	        boolean u= repository.exists(user.username);
	        
	        System.out.println("result of username name exist"+u);
	        
	        if(repository.exists(user.username)!=true){
	            System.out.println("A User with name " + user.getUsername() + " already exist");
	            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	        }
	  
	       repository.save(user);
	  
	        HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri());
	        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    }
	  
	     
	     
//	    //------------------- Delete a User --------------------------------------------------------
	      
	    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	    public ResponseEntity<Users> deleteUser(@PathVariable("id") String id) {
	        System.out.println("Fetching & Deleting User with id " + id);
	  
	        Users user = repository.findOne(id);
	        if (user == null) {
	            System.out.println("Unable to delete. User with id " + id + " not found");
	            return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
	        }
	  
	        repository.delete(id);
	        return new ResponseEntity<Users>(HttpStatus.NO_CONTENT);
	    }
	  
	      
//	     
//	    //------------------- Delete All Users --------------------------------------------------------
//	      
//	    @RequestMapping(value = "/user/", method = RequestMethod.DELETE)
//	    public ResponseEntity<User> deleteAllUsers() {
//	        System.out.println("Deleting All Users");
//	  
//	        userService.deleteAllUsers();
//	        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
//	    }

}
