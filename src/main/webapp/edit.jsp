
<%@page session="false" contentType="text/html"
	pageEncoding="ISO-8859-1" import="java.util.*,javax.portlet.*"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portletAPI"%>

<%@ page import="javax.portlet.RenderRequest" %>
<%@ page import="javax.portlet.RenderResponse" %>
<%@ page import="javax.portlet.PortletConfig" %>
<portletAPI:defineObjects />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<%-- 	
		These next three lines don't really work yet. They are trying to put the value from 
		last saved text into the edit box of current ckeditor. I couldn't find portletSession.getAttribute(...).
		
		That fancy ?"": thing is just an inline if-statement very similar to python.
--%>
<%

	Object oVal = renderRequest.getPortletSession().getAttribute("freshVal");
	String Val = (oVal == null) ? "" : oVal.toString();
	
%>

<%-- 	
		The bPath is written outside of the main form code as for some reason JSP seems to mess up
		with little scripts like this. This basically defines the relative path of the folder where
		out main ckeditor files are located.
--%>

<%
	String bPath = request.getContextPath() + "/ckeditor";
%>

<%-- 	
		The attr is basically for the ckeditor textarea. You can play around with adding more
		html stuff like id/class/etc.
--%>

<%
	Map<String, String> attr = new HashMap<String, String>();
	attr.put("rows", "8");
	attr.put("cols", "50");
%>


<FORM id="myform" method="POST" action="<portletAPI:actionURL/>">
	<LABEL for="name">Enter Name:</LABEL><BR>
	<ckeditor:editor textareaAttributes="<%=attr%>" basePath="<%=bPath%>"
		editor="freshVal" value="<%=Val%>" />
	<INPUT id="freshSubmit" name="submit" type="submit" value="Submit" />
</FORM>
