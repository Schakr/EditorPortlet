<%--
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>
<%@page session="false" contentType="text/html"
	pageEncoding="ISO-8859-1"
	import="java.util.*,javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>



<%-- 	
		These next three lines don't really work yet. They are trying to put the value from 
		last saved text into the edit box of current ckeditor. I couldn't find portletSession.getAttribute(...).
		
		That fancy ?"": thing is just an inline if-statement very similar to python.
--%>
<%
	Object freshVal = request.getAttribute("freshVal");
	freshVal = freshVal == null ? "" : freshVal;
	String oVal = freshVal.toString();
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


<FORM id="myform" method="POST" action="<portlet:actionURL/>">
	<LABEL for="name">Enter Name:</LABEL><BR>
	<ckeditor:editor textareaAttributes="<%=attr%>" basePath="<%=bPath%>"
		editor="freshVal" value="<%=oVal%>" />
	<INPUT id="freshSubmit" name="submit" type="submit" value="Submit" />
</FORM>




