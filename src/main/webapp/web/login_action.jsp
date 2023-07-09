<%@page import="dto.Member"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	
    	String id = request.getParameter("id");
    	String password = request.getParameter("password");
    	
    	Member member = MemberDAO.getMemberDAO().login(id, password);
    	
    	
    	// 아이디가 없는 경우 리다이렉트
    	
    	if(member == null) {
    		session.setAttribute("message", "아이디 혹은 비밀번호가 잘못되었습니다");
    		response.sendRedirect(request.getContextPath() + "/web/login.jsp");
    		
    	} else { //	아이디가 있으면 홈으로		
    		session.setAttribute("member", member);
    		response.sendRedirect(request.getContextPath() + "/web/home.jsp");
    	}
    	
    	
    %>
