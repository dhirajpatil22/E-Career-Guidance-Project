package com.app.filter;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;
public class SessionFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
                FilterChain chain) throws IOException,
                ServletException {

    		System.out.println("IN FILTER");
            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) res;
            String url = request.getRequestURI();

            response.setHeader("pragma", "no-cache");              
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
            response.setHeader("Expires", "0"); 
            HttpSession session = request.getSession(false);

            //!url.contains("login.html") check if the requested page is login page or not. you can do it a numerous way.
            // but for simpplicity here i do that
            if(session==null && !url.contains("login")) {
                response.sendRedirect(request.getContextPath() + "/student/login"); // here goto http://yourdoamin/login.html
                response.setHeader("message", "Session Timeout."); // you can set your preffered message.
                return; //break filter chain, requested JSP/servlet will not be executed
            }

            chain.doFilter(req, res);
        }

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}