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


import org.springframework.stereotype.Repository;


@Repository
public class UserForbiddenDao extends BaseIbatisDao<UserForbidden,java.lang.Integer>{
	
	@Override
	public String getIbatisSqlMapNamespace() {
		return "UserForbidden";
	}
	
	public void saveOrUpdate(UserForbidden entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
	}
	
	public Page findPage(UserForbiddenQuery query) {
		return pageQuery("UserForbidden.findPage",query);
	}
	

}
