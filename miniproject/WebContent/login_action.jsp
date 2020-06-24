<%@page import="donWorry.MemberDTO"%>
<%@page import="donWorry.CashBookDAO"%>
<%@page import="donWorry.InputOutputDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id 		= request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDTO membersDTO = new MemberDTO();
	membersDTO.setId(id);
	membersDTO.setPassword(password);
	
	CashBookDAO donworryDAO = CashBookDAO.getInstance();
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