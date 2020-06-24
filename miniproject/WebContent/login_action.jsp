<%@page import="donWorry.MembersDTO"%>
<%@page import="donWorry.donWorryDAO"%>
<%@page import="donWorry.InputOutputDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id 		= request.getParameter("id");
	String password = request.getParameter("password");
	
	MembersDTO membersDTO = new MembersDTO();
	membersDTO.setId(id);
	membersDTO.setPassword(password);
	
	donWorryDAO donworryDAO = donWorryDAO.getInstance();
	//List<donWorryDTO> list = donworryDAO.checkdonWorry();
	String name = donworryDAO.checkdonWorry(membersDTO);
	if(!name.equals("")){
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		out.print("true");
	} else {
		out.print("false");
	}
%>