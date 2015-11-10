<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import ${basepackage}.util.Struts2Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import ${basepackage}.action.common.BaseAction;
import ${basepackage}.action.common.PageBean;
import ${basepackage}.entity.${className};
import ${basepackage}.service.${className}Service;

/**
 * @author HanZhijun
 */
@Controller("${classNameLower}Action")
@Scope("prototype")
public class ${className}Action extends BaseAction{
	private static final long serialVersionUID = 1L;
	@Autowired
	private ${className}Service ${classNameLower}Service;

	private PageBean pageBean;
	private ${className} ${classNameLower};
	private Integer id;
	private Integer page;
	private Integer rows;
	
	/**
	 * 跳转至列表页面
	 * @return
	 */
	public String toList(){
		nextPage = "/WEB-INF/ui/";
		return SUCCESS;
	}
	
	/**
	 * 分页查询所有记录
	 * @return
	 * @throws Exception
	 */
	public void getAll() throws Exception{
		PageBean p = null;
		p = new PageBean();
		p.setCurrentPage(page);
		p.setPageSize(rows);
		p = ${classNameLower}Service.list(p, ${classNameLower});
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("total",p.getAllRow());
		obj.put("rows",p.getList());
		Struts2Utils.renderJson(obj, this.getResponse());
	}
	
	/**
	 * 
	 * @throws Exception
	 */
	public void delete() throws Exception{
		${classNameLower}Service.delete${className}(${classNameLower});
		this.getResponse().getWriter().write("true");
	}
	
	/**
	 * 根据操作类型 新增还是修改 决定是否查询
	 * @throws Exception
	 */
	public void add() throws Exception{
		if(${classNameLower} != null){
			if(${classNameLower}.getId() == null){
				<#list table.columns as column>
				<#if column.isDateTimeColumn>
				if(${classNameLower}.get${column.columnName}() == null){
					${classNameLower}.set${column.columnName}(new Date());
				}
				</#if>
				</#list>
				${classNameLower}Service.save(${classNameLower});
			}else{
				${classNameLower}Service.update${className}(${classNameLower});
			}
			this.getResponse().getWriter().write("true");
		}else{
			this.getResponse().getWriter().write("false");
			
		}
	}
	
	/**
	 * 根据主键获取信息
	 * @return
	 * @throws Exception
	 */
	public void get() throws Exception{
		if(id != null){
			${classNameLower} = ${classNameLower}Service.get${className}ById(id);
			Struts2Utils.renderJson(${classNameLower}, this.getResponse());
		}
	}

	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
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
	
	public Integer getPage(){
		return page;
	}
	public void setPage(Integer page){
		this.page=page;
	}
	
	public Integer getRows(){
		return rows;
	}
	public void setRows(Integer rows){
		this.rows = rows;
	}
}