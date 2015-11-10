<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/common/jsAndcss.jsp" %>
<#include "/macro.include"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<@jspEl 'ectx'/>">
	<title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/pagerFilter.js"></script>
</head>
<body>
	<div id="main" class="easyui-panel" data-options="border:false,maximized:true">
  
		<!-- 弹出层DIV --------------新增开始---------------- -->	
		<div id="w" class="easyui-dialog" title="新增" data-options="iconCls:'icon-edit',modal:true,closed:true,width:700" >
			<div class="easyui-panel" title="" style="width:650px;" data-options="border:false">
				<div style="padding:10px;">
					<form id="ff" method="post" action="<@jspEl 'ectx'/>${namespace}/${table.classNameFirstLower}Action!add.action">
					<input type="hidden" name="${table.classNameFirstLower}.id"/>
					<table cellpadding="2" cellspacing="2" border="1" bordercolor="#dddddd"
							style="border-collapse:collapse; font-size:12px; width: 620px;">
					<#list table.columns as column>
					<#if !column.htmlHidden>
						<tr>
							<td><#if (column.remarks?length>=4)>${column.remarks?substring(0,4) }<#else>${column.remarks}</#if></td>
							<td><input class="easyui-combobox" name="${table.classNameFirstLower}.${column.columnNameLower}" data-options="required:true" style="width:200px;"/></td>
						</tr>
					</#if>
					</#list>
					</table>
					</form>
				</div>
				<div style="text-align:center;padding:5px">
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
				</div>
			</div>
			<script type="text/javascript">
				function submitForm(){
					var v = $('#ff').form('validate');
					if(v){
						var url = "<@jspEl 'ectx'/>${namespace}${table.classNameFirstLower}Action!add.action";
						$.ajax({
							url: url,
							type: "post",
							data: $('#ff').serialize(),
							dataType: 'json',
							success: function(data){
								if(data == false){
									$.messager.alert("消息", "系统错误，操作失败！", "error");
								}else if(data == true){
									$.messager.alert("消息", "操作成功，将刷新列表", "info", function(){
										$("#w").dialog('close');
										$('#dg').datagrid('load');
									});
								}else{
									errorHandler(data);
								}
							}
						});
					}
				}

				function clearForm(){
					$('#ff').form('clear');
				}
			</script>		
		</div>
		<!-- 弹出层DIV --------------新增结束---------------- -->	


		<!--------------------------查询条件开始------------------>	
		<div id="tb" class="easyui-panel"  style="padding:10px 0px;">
			<div style="margin-left:20px;">
				<div style="float:left">
				<#list table.columns as column>
				<#if !column.htmlHidden>
					<span><#if (column.remarks?length>=4)>${column.remarks?substring(0,4) }<#else>${column.remarks}</#if>：</span>
					&nbsp;
					<input class="easyui-combobox" name="${table.classNameFirstLower}.${column.columnNameLower}" data-options="required:false"/>
				</#if>
				</#list>
				</div>
				<div style="float:left;margin-left:10px;">
					<a name="querybtn" href="javascript:toquery();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>  
				</div>
			</div>
		</div>
		<!-------------------------查询条件结束------------------>	


		<!-------------------------列表开始------------------>
		<table id="dg" title="列表" class="easyui-datagrid" style="width:1600px;height:750px" data-options="
			rownumbers:true,
			singleSelect:true,
			fitColumns:false,
			fit:true,
			pagination:true,
			pageSize:15,
			pageNumber:1,
			pageList:[15,25,50],
			pagePosition:'top',
			loadFilter:pagerFilter,
			idField:'id',
			url:'<@jspEl 'ectx'/>${namespace}/${table.classNameFirstLower}Action!getAll.action',
			loadMsg:'正在加载，请稍后...',
			iconCls: 'icon-edit',
			remoteSort:false,
			toolbar:'#tb'">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th field="id" align="center" >id</th>
					<#list table.columns as column>
					<#if !column.htmlHidden>		
					<th field="${column.columnNameLower}" align="center" ><#if (column.remarks?length>=4)>${column.remarks?substring(0,4) }<#else>${column.remarks}</#if></th>
					</#if>
					</#list>
					<th field="operate"  align="center"   data-options="formatter:getOpterater">操作</th>
				</tr>
			</thead>
		</table>
		<script type="text/javascript">
			/*新增按钮*/
			var pagePlugin = {
				buttons: [{
					id: 'addbutton',
					iconCls: 'icon-add',
					text: '新增',
					handler: function(){
						openAddDialog();
					}
				}]
			};
	
			$(function(){
				$("#w").dialog('close');
				$('#dg').datagrid('getPager').pagination(pagePlugin);
			});
			
			/** 操作列模板 **/
			function getOpterater(value,row,index){
				var value = '<a href="javascript: openUpdateDialog(' + row.id + ');">修改</a>';
				var value2 = '<a href="javascript: deleteWeixinMsg(' + row.id + ');">删除</a>';
				var b = $(value).linkbutton({iconCls:"icon-edit"});
				var b2 = $(value2).linkbutton({iconCls:"icon-remove"});
				var op = b.linkbutton('options');
				var h = b.prop('outerHTML');
				var h2 = b2.prop('outerHTML');
				h = h + h2;
				return h;
			}
			
			/*-------- 弹出修改窗口 ------*/
			function openUpdateDialog(id){
				$("#ff").form('clear');
				$('#w').dialog({
					title: '编辑',
					iconCls: 'icon-edit',
					cache: false, 
					modal: true,
					onOpen: readEntityInfo(id)
				});
				$('#w').dialog('open');
			}
			
			/*读取实体信息*/
			function readEntityInfo(id){
				$.ajax({
					url: '<@jspEl 'ectx'/>${namespace}/${table.classNameFirstLower}Action!get.action',
					data: {
						id: id
					},
					dataType: 'json',
					success: function(data){
						if(data == 'false'){
							$.messager.alert("消息", "获取数据失败", "error");
						}else if(!$.isEmptyObject(data)){
							for(var p in data){
								data['${table.classNameFirstLower}.' + p] = data[p];
								delete data[p];
							} 
							$('#ff').form('clear');
							$('#ff').form('load',data);  
						}else{
							errorHandler(data);
						}
					}
				});
			}
			
			/*删除记录*/
			function deleteWeixinMsg(id){
				var rowIndex = $("#dg").datagrid("getRowIndex",id);
				deleteItem(id, rowIndex);
			}
			
			function deleteItem(id, rowIndex){
				$.messager.confirm('确认','你确定要删除？',function(r){
					if(r){
						$.ajax({
							url: '<@jspEl 'ectx'/>${namespace}/${table.classNameFirstLower}Action!delete.action',
							type: 'post',
							data: {
								'${table.classNameFirstLower}.id': id
							},
							success: function(data){
								if(data == 'true'){
									$("#dg").datagrid("deleteRow", rowIndex);
									$.messager.alert("消息", "删除成功", "info");
								}else{
									errorHandler(data);
								}
							},
							error:function(){
								$.messager.alert("消息", "系统正忙，请稍后再试...", "error");
							}
						});
					}
				});
			}

			/*弹出新增窗口*/
			function openAddDialog(){
				$("#ff").form('clear');
				$("#w").dialog({
					title: "新增",
					iconCls: 'icon-add'
				});
				$("#w").dialog('open');
			}

			//查询条件最后一个逗号需手动去掉
			function toquery(){
				$('#dg').datagrid({
					queryParams: {
					<#list table.columns as column>
					<#if !column.htmlHidden>
						'${table.classNameFirstLower}.${column.columnNameLower}': $("input[name='${table.classNameFirstLower}.${column.columnNameLower}']").val(),
					</#if>
					</#list>	
					}
				});
				$('#dg').datagrid('getPager').pagination(pagePlugin);
			}
			
			function errorHandler(data){
				if(data == -1 || data == '-1'){
					$.messager.alert("消息", "请重新登陆", "error", function(){
						window.top.location.href = "<@jspEl 'ectx'/>";
					});
				}else if(data == -2 || data == '-2'){
					$.messager.alert("消息", "您无此权限，请联系管理员", "error");
				}else{
					$.messager.alert("消息", "系统错误", "error");
				}
				return;
			}
	</script>
	</div>
</body>
</html>