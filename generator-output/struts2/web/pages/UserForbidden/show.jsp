<%@page import="com.leygame.game.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=UserForbidden.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/UserForbidden/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/UserForbidden/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_OPERATOR%></td>	
				<td><s:property value="%{model.operator}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_FORBIDDEN_TYPE%></td>	
				<td><s:property value="%{model.forbiddenType}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_USER_ACCOUNT%></td>	
				<td><s:property value="%{model.userAccount}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_PRODUCT_ID%></td>	
				<td><s:property value="%{model.productId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_ROLE%></td>	
				<td><s:property value="%{model.role}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_DESCRIPTION%></td>	
				<td><s:property value="%{model.description}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_ADD_TIME%></td>	
				<td><s:property value="%{model.addTimeString}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>