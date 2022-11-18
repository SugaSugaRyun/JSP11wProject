<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ page import="com.example.util.FileUpload" %>
<%
	String seq = request.getParameter("id");
	if (seq != ""){
		int id = Integer.parseInt(seq);
		BoardDAO boardDAO = new BoardDAO();

		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request, filename);

		boardDAO.deleteBoard(id);
	}
	response.sendRedirect("posts.jsp");
%>