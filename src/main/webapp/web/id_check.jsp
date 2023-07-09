<%@page import="dto.Member"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  	<%	
  		request.setCharacterEncoding("UTF-8");
  		
  		String id = request.getParameter("id");
  	
  		Member findMember = MemberDAO.getMemberDAO().findById(id);
  		
  		// ajax로 응답
  		if(findMember == null) {
  			out.print("ok"); 
  		} else {
  			out.print("x"); 
  		}
  	%>

