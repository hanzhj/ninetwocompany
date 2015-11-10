<%@page import="com.leygame.game.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.leygame.game.model.UserForbidden@ALIAS_OPERATOR}" key="operator" value="%{model.operator}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.leygame.game.model.UserForbidden@ALIAS_FORBIDDEN_TYPE}" key="forbiddenType" value="%{model.forbiddenType}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.leygame.game.model.UserForbidden@ALIAS_USER_ACCOUNT}" key="userAccount" value="%{model.userAccount}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.leygame.game.model.UserForbidden@ALIAS_PRODUCT_ID}" key="productId" value="%{model.productId}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.leygame.game.model.UserForbidden@ALIAS_ROLE}" key="role" value="%{model.role}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.leygame.game.model.UserForbidden@ALIAS_DESCRIPTION}" key="description" value="%{model.description}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			<%=UserForbidden.ALIAS_ADD_TIME%>:
		</td>	
		<td>
		<input value="${model.addTimeString}" onclick="WdatePicker({dateFmt:'<%=UserForbidden.FORMAT_ADD_TIME%>'})" id="addTimeString" name="addTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
