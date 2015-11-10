<%@page import="com.leygame.game.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=UserForbidden.TABLE_ALIAS%> 维护</title>
	
	<script src="${ctx}/scripts/rest.js" ></script>
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=UserForbidden.ALIAS_OPERATOR%></td>		
					<td>
						<input value="${query.operator}" id="operator" name="operator" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel"><%=UserForbidden.ALIAS_FORBIDDEN_TYPE%></td>		
					<td>
						<input value="${query.forbiddenType}" id="forbiddenType" name="forbiddenType" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=UserForbidden.ALIAS_USER_ACCOUNT%></td>		
					<td>
						<input value="${query.userAccount}" id="userAccount" name="userAccount" maxlength="30"  class=""/>
					</td>
					<td class="tdLabel"><%=UserForbidden.ALIAS_PRODUCT_ID%></td>		
					<td>
						<input value="${query.productId}" id="productId" name="productId" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=UserForbidden.ALIAS_ROLE%></td>		
					<td>
						<input value="${query.role}" id="role" name="role" maxlength="64"  class=""/>
					</td>
					<td class="tdLabel"><%=UserForbidden.ALIAS_DESCRIPTION%></td>		
					<td>
						<input value="${query.description}" id="description" name="description" maxlength="65535"  class=""/>
					</td>
					<td class="tdLabel"><%=UserForbidden.ALIAS_ADD_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.addTimeBegin}' pattern='<%=UserForbidden.FORMAT_ADD_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=UserForbidden.FORMAT_ADD_TIME%>'})" id="addTimeBegin" name="addTimeBegin"   />
						<input value="<fmt:formatDate value='${query.addTimeEnd}' pattern='<%=UserForbidden.FORMAT_ADD_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=UserForbidden.FORMAT_ADD_TIME%>'})" id="addTimeEnd" name="addTimeEnd"   />
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/userforbidden'"/>
			<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/userforbidden/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/userforbidden','items',document.forms.queryForm)"/>
		<div>
	
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		显示在这里是为了提示你如何自定义表头,可修改模板删除此行
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="operator" ><%=UserForbidden.ALIAS_OPERATOR%></th>
				<th sortColumn="forbiddenType" ><%=UserForbidden.ALIAS_FORBIDDEN_TYPE%></th>
				<th sortColumn="userAccount" ><%=UserForbidden.ALIAS_USER_ACCOUNT%></th>
				<th sortColumn="productId" ><%=UserForbidden.ALIAS_PRODUCT_ID%></th>
				<th sortColumn="role" ><%=UserForbidden.ALIAS_ROLE%></th>
				<th sortColumn="description" ><%=UserForbidden.ALIAS_DESCRIPTION%></th>
				<th sortColumn="add_time" ><%=UserForbidden.ALIAS_ADD_TIME%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.id}"></td>
				
				<td><c:out value='${item.operator}'/>&nbsp;</td>
				<td><c:out value='${item.forbiddenType}'/>&nbsp;</td>
				<td><c:out value='${item.userAccount}'/>&nbsp;</td>
				<td><c:out value='${item.productId}'/>&nbsp;</td>
				<td><c:out value='${item.role}'/>&nbsp;</td>
				<td><c:out value='${item.description}'/>&nbsp;</td>
				<td><c:out value='${item.addTimeString}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/userforbidden/${item.id}">查看</a>&nbsp;&nbsp;
					<a href="${ctx}/userforbidden/${item.id}/edit">修改</a>&nbsp;&nbsp;
					<a href="${ctx}/userforbidden/${item.id}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		显示在这里是为了提示你如何自定义表头,可修改模板删除此行
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
