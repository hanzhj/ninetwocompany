<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import ${basepackage}.action.commom.PageBean;
import ${basepackage}.entity.${className};
import ${basepackage}.service.${className}Service;
/**
 * 
 * @author generate
 *
 */
@Service("${classNameLower}Service")
public class ${className}ServiceImpl extends BaseServiceImpl<${className}> implements ${className}Service {
	@Override
	public PageBean list(PageBean page,${className} ${classNameLower}) {
		StringBuilder sql = new StringBuilder();
		StringBuilder hql = new StringBuilder();
		sql.append("select count(id) as ac from ${className} where 1=1");
		hql.append("from ${className} where 1=1");
		List<Object> list = null;
		if(${classNameLower}!=null){
			<#list table.columns as column>
			<#if column.isNotIdOrVersionField>
			<#if column.isStringColumn>
			if(StringUtils.isNotBlank(${classNameLower}.get${column.columnName}())){
				sql.append(" and ${column.columnNameFirstLower}='").append(${classNameLower}.get${column.columnName}()).append("'");
				hql.append(" and ${column.columnNameFirstLower}='").append(${classNameLower}.get${column.columnName}()).append("'");
			}
				<#elseif column.isNumberColumn>
			if(${classNameLower}.get${column.columnName}()!=null){
				sql.append(" and ${column.columnNameFirstLower}=").append(${classNameLower}.get${column.columnName}());
				hql.append(" and ${column.columnNameFirstLower}=").append(${classNameLower}.get${column.columnName}());
			}		
			</#if>
			
			</#if>
			</#list>
			
		}
		page = this.queryPage(sql.toString(), hql.toString(),page.getPageSize(), page.getCurrentPage(),list);
		return page;
	}

	@Override
	public ${className} save(${className} ${classNameLower}) {
		this.addEntity(${classNameLower});
		return ${classNameLower};
	}

	@Override
	public void delete${className}(${className} ${classNameLower}) {
		this.delEntity(${className}.class, new Object[]{"id"}, new Object[]{${classNameLower}.getId()});
	}

	@Override
	public void update${className}(${className} ${classNameLower}) {
		Object fieldName[] = new Object[]{<#list table.columns as column><#if column.isNotIdOrVersionField>"${column.columnNameFirstLower}"<#if column_has_next>,</#if></#if></#list>};
		Object fieldValue[] = new Object[]{<#list table.columns as column><#if column.isNotIdOrVersionField>${classNameLower}.get${column.columnName}()<#if column_has_next>,</#if></#if></#list>};
		
		this.updateEntity(${className}.class, fieldName, fieldValue, new Object[]{"id"}, new Object[]{${classNameLower}.getId()});
	}
	@Override
	public ${className} get${className}ById(Integer id) {
		return this.getEntity(${className}.class, id);
	}
}
