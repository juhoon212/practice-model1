<%@page import="dto.Member"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  	<%	
  		request.setCharacterEncoding("UTF-8");
  		
  		String id = request.getParameter("id");
  	
  		Member findMember = MemberDAO.getMemberDAO().findById(id);
  		
  		
  		// 성 로직
  		if(findMember == null) {
  			out.print("ok");
  		} else {
  			out.print("x");
  		}
  		
  		response.sendRedirect(request.getContextPath() + "/web/joinForm.jsp");
  		
  		
  		
  		
  		
  		
  	%>