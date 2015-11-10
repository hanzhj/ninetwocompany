<%@page import="com.leygame.game.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=UserForbidden.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="userforbidden"  >
		<input type="button" value="返回列表" onclick="window.location='${ctx}/userforbidden'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<input type="hidden" id="id" name="id" value="${userForbidden.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_OPERATOR%></td>	
				<td><c:out value='${userForbidden.operator}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_FORBIDDEN_TYPE%></td>	
				<td><c:out value='${userForbidden.forbiddenType}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_USER_ACCOUNT%></td>	
				<td><c:out value='${userForbidden.userAccount}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_PRODUCT_ID%></td>	
				<td><c:out value='${userForbidden.productId}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_ROLE%></td>	
				<td><c:out value='${userForbidden.role}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_DESCRIPTION%></td>	
				<td><c:out value='${userForbidden.description}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=UserForbidden.ALIAS_ADD_TIME%></td>	
				<td><c:out value='${userForbidden.addTimeString}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>