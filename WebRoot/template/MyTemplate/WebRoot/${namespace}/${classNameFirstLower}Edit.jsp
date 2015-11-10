<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <%@include file="/common/import.jsp" %>
    
    
    <title></title>
    <style type="text/css">
		label.error{
			 margin-left: 2px; 
		     border-color:red;
			 border-style:solid;
			 border-width:1px;
			 color:red;
			}
	</style>
    <script type="text/javascript">
    	//弹出框回调函数
        function callback(code)
        {	try{
            if(code=='00'){alert("操作成功");window.parent.location.reload();}
            else {
            	$('#msg').html('<font color=red>操作失败！</font>');
            	return;
            }
            }catch(e){
            	//$('#msg').html('<font color=red>操作失败！</font>');
            }
        }
	 	//提交验证
			jQuery(document).ready(function() {
				checksubmit();
			
		});
			
			
			
				        
			function checksubmit() {
			
				$("#saveForm").validate({
				
				rules:{
				<#list table.columns as column>
					<#if !column.htmlHidden&&!column.nullable> 
					"${table.classNameFirstLower}.${column.columnNameLower}":{required:true}<#if column_has_next>,</#if>
				  </#if>
				 </#list>
					
				
				},
				messages:{ 
				<#list table.columns as column>
					<#if !column.htmlHidden&&!column.nullable> 
					"${table.classNameFirstLower}.${column.columnNameLower}":{required:"必填项"}<#if column_has_next>,</#if>
				  </#if>
				 </#list>
					
					
				},
				 onfoucusout:false
				}); 
				
			}   
			
    	</script>
  </head>
  
  <body>
  	 	<iframe id="hidden_iframe1" name="hidden_iframe1" style="display:none"></iframe>
    	<form id="saveForm" action="${table.classNameFirstLower}Action!save.action" method="post" target="hidden_iframe1"  >
			
    		<table cellpadding="0" cellspacing="0" style="line-height:30px;text-align:left;">
    			<#list table.columns as column>
					<#if !column.htmlHidden>
    			<tr>
				  <td><#if (column.remarks?length>=4)>${column.remarks?substring(0,4) }<#else>${column.remarks}</#if>：</td>	
				   <td>	 
				   		 <input type="text" name="${table.classNameFirstLower}.${column.columnNameLower}" id="${column.columnNameLower}" value="<@jspEl table.classNameFirstLower+'.'+column.columnNameLower />" <#if column.isDateTimeColumn>class="Wdate"</#if>/>
				  			
				   </td>
				</tr>
				</#if>
				 </#list>
				
				
				
				
				
				<tr>
				   <td colspan=4 style="text-align:center">
				       
				       <input type="submit" value="保存" />
				     
				   </td>	
				</tr>
				<tr><td id="msg" colspan=2></td></tr>
				
    		</table>
    		<input type="hidden" name="${table.classNameFirstLower}.${table.idColumn }"  id="id" value="<@jspEl table.classNameFirstLower+'.'+table.idColumn/>"/> 
    	</form>
  </body>
</html>
