/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.leygame.game.dao;

import java.util.*;

import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.leygame.game.model.*;
import com.leygame.game.dao.*;
import com.leygame.game.service.*;
import com.leygame.game.vo.query.*;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */


import static cn.org.rapid_framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

@Repository
public class UserForbiddenDao extends BaseHibernateDao<UserForbidden,java.lang.Integer>{

	public Class getEntityClass() {
		return UserForbidden.class;
	}
	
	public Page findPage(UserForbiddenQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from UserForbidden t where 1=1 "
			  	+ "/~ and t.operator = {operator} ~/"
			  	+ "/~ and t.forbiddenType = {forbiddenType} ~/"
			  	+ "/~ and t.userAccount = {userAccount} ~/"
			  	+ "/~ and t.productId = {productId} ~/"
			  	+ "/~ and t.role = {role} ~/"
			  	+ "/~ and t.description = {description} ~/"
				+ "/~ and t.addTime >= {addTimeBegin} ~/"
				+ "/~ and t.addTime <= {addTimeEnd} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from UserForbidden t where 1=1 ");
        if(isNotEmpty(query.getId())) {
            sql2.append(" and  t.id = :id ");
        }
        if(isNotEmpty(query.getOperator())) {
            sql2.append(" and  t.operator = :operator ");
        }
        if(isNotEmpty(query.getForbiddenType())) {
            sql2.append(" and  t.forbiddenType = :forbiddenType ");
        }
        if(isNotEmpty(query.getUserAccount())) {
            sql2.append(" and  t.userAccount = :userAccount ");
        }
        if(isNotEmpty(query.getProductId())) {
            sql2.append(" and  t.productId = :productId ");
        }
        if(isNotEmpty(query.getRole())) {
            sql2.append(" and  t.role = :role ");
        }
        if(isNotEmpty(query.getDescription())) {
            sql2.append(" and  t.description = :description ");
        }
        if(isNotEmpty(query.getAddTimeBegin())) {
            sql2.append(" and  t.addTime >= :addTimeBegin ");
        }
        if(isNotEmpty(query.getAddTimeEnd())) {
            sql2.append(" and  t.addTime <= :addTimeEnd ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
