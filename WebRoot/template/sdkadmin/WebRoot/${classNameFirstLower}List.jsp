<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<#include "/macro.include"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/import.jsp"%>
<title></title>
	<link rel="stylesheet" type="text/css" href="<@jspEl 'ectx'/>/css/style.css"/>
	<link href="<@jspEl 'ctx'/>/js/jquery-autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<@jspEl 'ctx'/>/js/jquery-autocomplete/jquery.autocomplete.js"></script>
	
	<script type="text/javascript" >
		var delServer =  function(id) {
			if (confirm("确定删除吗？")) {
						$.get("<@jspEl 'ectx'/>${table.classNameFirstLower}Action!delete.action",{"${table.classNameFirstLower}.${table.idColumn.columnNameFirstLower}":id},function(data){
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
		tipsWindown("添加/修改信息",
					"iframe:"+url, "550", "350", "true", "", "true", "");
	}
	function search${table.className}(){
		 $("#pageNo").val(1);
		 $("#mainForm").submit();
	}
	/*$(function(){
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
	});*/
	</script>
</head>

<body>
	<form id="mainForm" action="<@jspEl 'ectx'/>${table.classNameFirstLower}Action!list.action" method="post" >
	<input type=hidden id="pageNo" name="page.currentPage" value="<@jspEl 'page.currentPage'/>"/>
			<table cellpadding="0" cellspacing="0" border="1"   bordercolor="#95bce2"  class="table_wdp_ty" style="border-collapse: collapse;height: 0">
				<tr>
				<#list table.columns as column>
					<#if !column.htmlHidden>
					<td width="10%" align="right" style="padding: 8px">
				       <label style="font-size: 16px; font-family:'微软雅黑';"><#if (column.remarks?length>=4)>${column.remarks?substring(0,4) }<#else>${column.remarks}</#if>：</label>
				    </td>
				    <td width="12%" style="padding-left: 2px;padding-right: 6px">
				        <input id="${column.columnNameLower}" name="${table.classNameFirstLower}.${column.columnNameLower}"  style="width:100%" value="<@jspEl table.classNameFirstLower+'.'+column.columnNameLower />" <#if column.isDateTimeColumn>class="Wdate"</#if>/>
					</td>
				    </#if>
				    <#if column_index%4==0>
				   </tr>
				   <tr>
				    </#if>
				 </#list>
					
					<td style="padding-left: 10px">
						<input type="button" value="查询" class="button_wdp_ty" onclick="search${table.className}();"/>
						<input  type="button" onclick="javascript:openDialog('<@jspEl 'ectx'/>${table.classNameFirstLower}Action!input_.action')" value="新增" class="button_wdp_ty" />
					</td>
				</tr>
			</table>
  </form>				
		<table class="stripe_tb" width="100%" align="center">
   	 	<thead>
	   	 	<tr>
	   	 		<#list table.columns as column>
	   	 			<#if column.isNotIdOrVersionField>
				<th ><#if (column.remarks?length>=4)>${column.remarks?substring(0,4) }<#else>${column.remarks}</#if></th>
					</#if>
				</#list>
				
				<th >操作</th>
			</tr>
		</thead>
		<c:if test="<@jspEl 'not empty page.list'/>">
			<c:forEach items="<@jspEl 'page.list'/>" var="mark"
				varStatus="index">
				<tr style="height:20" id="mark_<@jspEl 'mark.'+table.idColumn.columnNameFirstLower/> ">
					<#list table.columns as column>
					<#if column.isNotIdOrVersionField>
	   	 			<td ><@jspEl 'mark.'+column.columnNameLower/></td>
	   	 			</#if>
	   	 			</#list>
					
					<td >
					<a href="javascript:openDialog('<@jspEl 'ectx'/>${table.classNameFirstLower}Action!input_.action?id=<@jspEl 'mark.'+table.idColumn />&operatType=modify')">修改</a>|
	   	 			<a href="javascript:delServer('<@jspEl "mark."+table.idColumn/>');">删除</a></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="<@jspEl 'empty page.list'/>">
			<tr><td colspan="${table.columns?size }" class="td_v"><font color="red">当前条件无数据，请重新选择条件！</font></td></tr>
		</c:if>
		</table>
		<!-- 跳转页面 -->
		<div style="text-align:right" class="action">
			<%@include file="../common/pagebean_bar.jsp"%>		
		</div>
</body>
</html>
