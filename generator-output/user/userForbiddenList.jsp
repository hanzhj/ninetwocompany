<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/import.jsp"%>
<title>封号</title>
	<link rel="stylesheet" type="text/css" href="${ectx}/css/style.css"/>
	<link href="${ctx}/js/jquery-autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/js/jquery-autocomplete/jquery.autocomplete.js"></script>
	
	<script type="text/javascript" >
		var delServer =  function(id) {
			if (confirm("确定删除吗？")) {
						$.get("${ectx}userForbiddenAction!delete.action",{"userForbidden.id":id},function(data){
	                   console.log(data);
	                   if(data.status=="success"){
	                     //window.location.href = window.location.href;//没效果
	                     $("#mark_"+id).remove();
	                     alert("删除成功");
	                   }else if(data=="0"){
	                     alert("删除出错");
	                   }else{
	                   	 alert("没有删除对象");
	                   }
			    });
			}
		}
	function openDialog(url) {
		tipsWindown("添加/修改封号信息",
					"iframe:"+url, "550", "350", "true", "", "true", "");
	}
	function searchProduct(){
		 $("#pageNo").val(1);
		 $("#mainForm").submit();
	}
	$(function(){
		$.get("productAction!getThroughProduct.action",function(data){
		     $('#game').autocomplete(data, {
		            max: 12,    //列表里的条目数
		            minChars: 0,    //自动完成激活之前填入的最小字符
		            width: 150,     //提示的宽度，溢出隐藏
		            scrollHeight: 300,   //提示的高度，溢出显示滚动条
		            matchContains: true,    //包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
		            autoFill: false,    //自动填充
		            formatItem: function(row, i, max) {
		                return row.name;
		            },
		            formatMatch: function(row, i, max) {
		                return row.name + row.to;
		            },
		            formatResult: function(row) {
		                return row.name;
		            }
		        }).result(function(event, row, formatted) {
		            $("#productId").val(row.id);
		        });
		});		        
	});
	</script>
</head>

<body>
	<form id="mainForm" action="${ectx}userForbidden!list.action" method="post" >
	<input type=hidden id="pageNo" name="page.currentPage" value="${page.currentPage}"/>
	<input id="productId"  type="hidden" name="userForbidden.product.id" value="${userForbidden.product.id}"/>
			<table cellpadding="0" cellspacing="0" border="1"   bordercolor="#95bce2"  class="table_wdp_ty" style="border-collapse: collapse;height: 0">
				<tr>
				   </tr>
				   <tr>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';">操作人：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="userForbidden" name="userForbidden.operator"  style="width:100%" value="${userForbidden.operator}"/>
					</td>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';">封号类型：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="userForbidden" name="userForbidden.forbiddenType"  style="width:100%" value="${userForbidden.forbiddenType}"/>
					</td>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';">用户帐号：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="userForbidden" name="userForbidden.userAccount"  style="width:100%" value="${userForbidden.userAccount}"/>
					</td>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';">产品ID：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="userForbidden" name="userForbidden.productId"  style="width:100%" value="${userForbidden.productId}"/>
					</td>
				   </tr>
				   <tr>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';">角色：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="userForbidden" name="userForbidden.role"  style="width:100%" value="${userForbidden.role}"/>
					</td>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';">封号描述：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="userForbidden" name="userForbidden.description"  style="width:100%" value="${userForbidden.description}"/>
					</td>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';">添加时间：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="userForbidden" name="userForbidden.addTime"  style="width:100%" value="${userForbidden.addTime}"/>
					</td>
					
					<td style="padding-left: 10px">
						<input type="button" value="查询" class="button_wdp_ty" onclick="searchProduct();"/>
						<input  type="button" onclick="javascript:openDialog('${ectx}userForbiddenAction!input_.action')" value="新增" class="button_wdp_ty" />
					</td>
				</tr>
			</table>
  </form>				
		<table class="stripe_tb" width="100%" align="center">
   	 	<thead>
	   	 	<tr>
				<th width="5%">id</th>
				<th width="5%">操作人</th>
				<th width="5%">封号类型</th>
				<th width="5%">用户帐号</th>
				<th width="5%">产品ID</th>
				<th width="5%">角色</th>
				<th width="5%">封号描述</th>
				<th width="5%">添加时间</th>
				
				<th width="10%">操作</th>
			</tr>
		</thead>
		<c:if test="${not empty page.list}">
			<c:forEach items="${page.list}" var="mark"
				varStatus="index">
				<tr style="height:20" id="mark_${mark.id} ">
	   	 			<td >${mark.id}</td>
	   	 			<td >${mark.operator}</td>
	   	 			<td >${mark.forbiddenType}</td>
	   	 			<td >${mark.userAccount}</td>
	   	 			<td >${mark.productId}</td>
	   	 			<td >${mark.role}</td>
	   	 			<td >${mark.description}</td>
	   	 			<td >${mark.add_time}</td>
					
					<td >
					<a href="javascript:openDialog('${ectx}userForbidden!input_.action?id=${mark.id}&operatType=modify')">修改</a>|
	   	 			<a href="javascript:delServer('${mark.id}');">删除</a></td>
				</tr>
			</c:forEach>
		</c:if>
		</table>
		<!-- 跳转页面 -->
		<div style="text-align:right" class="action">
			<%@include file="../common/pagebean_bar.jsp"%>		
		</div>
</body>
</html>
