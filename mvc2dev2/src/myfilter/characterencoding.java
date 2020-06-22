package myfilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName = "characterEncoding", urlPatterns = "/*")
public class characterencoding implements Filter {

    public characterencoding() {
       System.out.println("CharacterEncoding()");
    }

   public void destroy() {
      System.out.println("CharacterEncoding().destroy");
   }

   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      System.out.println("CharacterEncoding().doFilter");
      request.setCharacterEncoding("UTF-8");
      chain.doFilter(request, response);
   }

   public void init(FilterConfig fConfig) throws ServletException {
      System.out.println("CharacterEncoding().init");
   }

}