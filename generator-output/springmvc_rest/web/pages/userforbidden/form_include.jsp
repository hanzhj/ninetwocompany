<%@page import="com.leygame.game.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${userForbidden.id}"/>

	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_OPERATOR%>:
		</td>		
		<td>
		<form:input path="operator" id="operator" cssClass="" maxlength="20" />
		<font color='red'><form:errors path="operator"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_FORBIDDEN_TYPE%>:
		</td>		
		<td>
		<form:input path="forbiddenType" id="forbiddenType" cssClass="validate-integer max-value-2147483647" maxlength="3" />
		<font color='red'><form:errors path="forbiddenType"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_USER_ACCOUNT%>:
		</td>		
		<td>
		<form:input path="userAccount" id="userAccount" cssClass="" maxlength="30" />
		<font color='red'><form:errors path="userAccount"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_PRODUCT_ID%>:
		</td>		
		<td>
		<form:input path="productId" id="productId" cssClass="validate-integer max-value-2147483647" maxlength="10" />
		<font color='red'><form:errors path="productId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_ROLE%>:
		</td>		
		<td>
		<form:input path="role" id="role" cssClass="" maxlength="64" />
		<font color='red'><form:errors path="role"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_DESCRIPTION%>:
		</td>		
		<td>
		<form:input path="description" id="description" cssClass="" maxlength="65535" />
		<font color='red'><form:errors path="description"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_ADD_TIME%>:
		</td>		
		<td>
		<input value="${userForbidden.addTimeString}" onclick="WdatePicker({dateFmt:'<%=UserForbidden.FORMAT_ADD_TIME%>'})" id="addTimeString" name="addTimeString"  maxlength="0" class="" />
		<font color='red'><form:errors path="addTime"/></font>
		</td>
	</tr>	
	
		