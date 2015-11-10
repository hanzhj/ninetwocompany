<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service;

import ${basepackage}.action.common.PageBean;
import ${basepackage}.entity.${className};

/**
 * 
 * @author HanZhijun
 */
public interface ${className}Service {
	
	/**
	 * 根据条件分页查询记录
	 * @param ${classNameLower}
	 * @return
	 */
	public PageBean list(PageBean page,${className} ${classNameLower});
	
	/**
	 * 保存记录
	 * @param po
	 * @return
	 */
	public ${className} save(${className} ${classNameLower});
	
	/**
	 * 删除
	 * @param ${classNameLower}
	 */
	public void delete${className}(${className} ${classNameLower});
	
	/**
	 * 修改记录
	 * @param ${classNameLower}
	 * @return
	 */
	public void update${className}(${className} ${classNameLower});
	
	/**
	 * 根据${className} ID查询信息
	 * @param id
	 * @return
	 */
	public ${className} get${className}ById(Integer id);
}