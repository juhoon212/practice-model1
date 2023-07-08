<%@page import="dto.Member"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%	
    
    	
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String id = request.getParameter("id");
    	String password = request.getParameter("password");
    	String name = request.getParameter("name");
    	
    	System.out.println(id);
    	
    	Member member = new Member();
    	
    	member.setId(id);
    	member.setPassword(password);
    	member.setName(name);
    	
    	MemberDAO.getMemberDAO().insertMember(member);
    	
    	response.sendRedirect(request.getContextPath() + "/web/home.jsp");
    	
    	
    %>

