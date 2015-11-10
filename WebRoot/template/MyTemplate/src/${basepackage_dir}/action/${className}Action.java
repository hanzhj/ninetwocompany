<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import ${basepackage}.action.commom.BaseAction;
import ${basepackage}.action.commom.PageBean;
import ${basepackage}.entity.${className};
import ${basepackage}.service.${className}Service;
/**
 * @author generate
 */
@Controller("${classNameLower}Action")
@Scope("prototype")
public class ${className}Action extends BaseAction{
	private PageBean page;
	@Autowired
	private ${className}Service ${classNameLower}Service;
	private ${className} ${classNameLower};
	private Integer id;
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception{
		if(page == null){
			page = new PageBean();
			page.setCurrentPage(1);
			
		}
		page.setPageSize(25);
		page = ${classNameLower}Service.list(page, ${classNameLower});
		this.nextGepPage = "/${namespace}/${classNameLower}List.jsp";
		return "success";
	}
	/**
	 * 
	 * @throws Exception
	 */
	public void delete() throws Exception{
		${classNameLower}Service.delete${className}(${classNameLower});
		this.getResponse().setContentType("application/json;charset=utf-8");
		this.getResponse().getWriter().write("{\"status\":\"success\"}");
	}
	/**
	 * 
	 * @throws Exception
	 */
	public void save() throws Exception{
		this.getResponse().setContentType("text/html;charset=utf-8");
		if(${classNameLower}!=null){
			if(${classNameLower}.getId()==null){
				<#list table.columns as column>
				<#if column.isDateTimeColumn>
				if(${classNameLower}.get${column.columnName}()==null){
					${classNameLower}.set${column.columnName}(new Date());
				}
				</#if>
				</#list>
				${classNameLower}Service.save(${classNameLower});
			}else{
				${classNameLower}Service.update${className}(${classNameLower});
			}
			this.getResponse().getWriter().write("<script>parent.callback('00')</script>");
		}else{
			this.getResponse().getWriter().write("<script>parent.callback('01')</script>");
			
		}
	}
	/**
	 * 根据操作类型 新增还是修改 决定是否查询
	 * @return
	 * @throws Exception
	 */
	public String input_() throws Exception{
		String operatType = this.getRequest().getParameter("operatType");
		if("modify".equals(operatType)&&id!=null){
			${classNameLower}=${classNameLower}Service.get${className}ById(id);
		}
		this.nextGepPage = "/${namespace}/${classNameLower}Edit.jsp";
		return "success";
	}

	public PageBean getPage() {
		return page;
	}

	public void setPage(PageBean page) {
		this.page = page;
	}

	public ${className} get${className}() {
		return ${classNameLower};
	}

	public void set${className}(${className} ${classNameLower}) {
		this.${classNameLower} = ${classNameLower};
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
