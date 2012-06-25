<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/WEB-INF/jmesa.tld" prefix="jmesa" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="org.efs.openreports.util.DisplayProperty"%>
<%@page import="org.efs.openreports.objects.Report"%>

<s:include value="Banner.jsp" />

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
  <script type="text/javascript" src="js/jmesa.js"></script> 

  <script type="text/javascript" src="js/jquery.jmesa.js"></script> 
  <script type="text/javascript" src="js/jquery.validate.js"></script> 


<s:if test="report == null || !report.isDisplayInline()">

<a class="back-link img-report-small" href="reportList.action"><s:text name="link.back.reports"/></a>
<a class="back-link img-group-small" href="reportGroup.action"><s:text name="link.back.groups"/></a>    
  
<br/>

<s:actionerror/>

</s:if>
<br/>
<div align="center">   
    
  <s:set name="results" value="results" scope="request" />  
  <s:set name="properties" value="properties" scope="request" />
  <s:set name="report" value="report" scope="request" />
  <% DisplayProperty[] displayProperties = (DisplayProperty[]) request.getAttribute("properties");  
  Report report = (Report) request.getAttribute("report");
  
     %>
     <div/>
  
  <form name="presidentsForm" action="${pageContext.request.contextPath}/QueryReport.jsp">


        <jmesa:tableModel id="jmesareport" items="${listResults}" exportTypes="csv,excel,pdfp" var="bean">
                <jmesa:htmlTable  caption="${report.name}" width="80%">               
                <jmesa:htmlRow filterable="true">  
        <c:forEach var="item" items="${query_report_properties}">
        <jmesa:htmlColumn property="${item.name}" title="${item.displayName}" sortable="true" filterable="true"/>
        </c:forEach>        
        
        
           </jmesa:htmlRow>

        </jmesa:htmlTable> 
    </jmesa:tableModel> 

    

</form>


</div>
<script type="text/javascript">
function onInvokeAction(id, action) {
    setExportToLimit(id, '');
    createHiddenInputFieldsForLimitAndSubmit(id);
}
function onInvokeExportAction(id) {
                var parameterString = $.jmesa.createParameterStringForLimit(id);
                location.href = '${pageContext.request.contextPath}/queryReportExport.action?' + parameterString;
            }
</script>

<s:if test="report == null || !report.isDisplayInline()">
<s:include value="Footer.jsp" />

</s:if>
