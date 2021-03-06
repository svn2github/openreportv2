<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:include value="Banner.jsp" />

<s:actionerror/> 

<br/>

<div align="center">
  
  <div class="instructions" id="instructions">
  	<a href="editReportParameter.action?command=add">
  		<img border="0" src="images/add.gif"/> <s:text name="link.admin.addReportParameter"/>
  	</a>
  	<a href="reportAdmin.action?command=add">
  			<img border="0" src="images/back.gif"/> <s:text name="link.back.admin"/>
  	</a>
  </div>
    
  <br/>
  
  <s:set name="reportParameters" value="reportParameters" scope="request" />
  
  <display:table name="reportParameters" class="displayTag" sort="list"  requestURI="listReportParameters.action" decorator="org.efs.openreports.util.HRefColumnDecorator">  	      
    <display:column property="name" href="editReportParameter.action?command=edit" paramId="id" paramProperty="id" titleKey="label.name" sortable="true" headerClass="sortable"/>
    <display:column property="description" titleKey="label.description" sortable="true" headerClass="sortable"/>  	     	        	     	     
    <display:column property="removeLink" title="" href="deleteReportParameter.action" paramId="id" paramProperty="id"/>  	     	     
  </display:table>
  <br> 
</div>

<s:include value="Footer.jsp" /> 

