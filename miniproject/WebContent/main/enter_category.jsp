<%@page import="donWorry.CashBookDAO"%>
<%@page import="donWorry.CategoryDTO"%>
<%@page import="donWorry.MemberDTO"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cate_name = request.getParameter("cate_name");
	String id = (String)session.getAttribute("id");
	
	CategoryDTO categoryDTO = new CategoryDTO();
	categoryDTO.setCate_name(cate_name);
	categoryDTO.setId(id);
	
	CashBookDAO cashBookDAO = CashBookDAO.getInstance();
	boolean result = cashBookDAO.insertCategory(categoryDTO);
	out.println(result);
%>