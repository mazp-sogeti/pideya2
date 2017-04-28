package com.home.pideya;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * Enabling CORS support  - Access-Control-Allow-Origin
 * @author zeroows@gmail.com
 * 
 * <code>
 	<!-- Add this to your web.xml to enable "CORS" -->
	<filter>
	  <filter-name>cors</filter-name>
	  <filter-class>com.elm.mb.rest.filters.CORSFilter</filter-class>
	</filter>
	  
	<filter-mapping>
	  <filter-name>cors</filter-name>
	  <url-pattern>/*</url-pattern>
	</filter-mapping>
 * </code>
 */

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
 
@Component
public class CORSFilter implements Filter {
 
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
        chain.doFilter(req, res);
    }
 
    public void init(FilterConfig filterConfig) {}
 
    public void destroy() {}
 
}

//
//public class CORSFilter extends OncePerRequestFilter {
//	private static final Log LOG = LogFactory.getLog(CORSFilter.class);
//
//	@Override
//	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
//		response.addHeader("Access-Control-Allow-Origin", "*");
//		
//		if (request.getHeader("Access-Control-Request-Method") != null && "OPTIONS".equals(request.getMethod())) {
//			LOG.trace("Sending Header....");
//			// CORS "pre-flight" request
//			response.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
//			response.addHeader("Access-Control-Allow-Headers", "Authorization");
//            response.addHeader("Access-Control-Allow-Headers", "Content-Type");
//			response.addHeader("Access-Control-Max-Age", "1");
//		}
//		
//		filterChain.doFilter(request, response);
//	}
//
//}