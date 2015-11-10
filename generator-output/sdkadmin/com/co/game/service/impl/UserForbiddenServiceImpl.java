package com.co.game.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.co.game.action.commom.PageBean;
import com.co.game.entity.UserForbidden;
import com.co.game.service.UserForbiddenService;
/**
 * 
 * @author generate
 *
 */
@Service("userForbiddenService")
public class UserForbiddenServiceImpl extends BaseServiceImpl<UserForbidden> implements UserForbiddenService {
	@Override
	public PageBean list(PageBean page,UserForbidden userForbidden) {
		StringBuilder sql = new StringBuilder();
		StringBuilder hql = new StringBuilder();
		sql.append("select count(id) as ac from UserForbidden where 1=1");
		hql.append("from UserForbidden where 1=1");
		List<Object> list = null;
		if(userForbidden!=null){
			if(StringUtils.isNotBlank(userForbidden.getOperator())){
				sql.append(" and operator='").append(userForbidden.getOperator()).append("'");
				hql.append(" and operator='").append(userForbidden.getOperator()).append("'");
			}
			if(userForbidden.getForbiddenType()!=null){
				sql.append(" and forbiddenType=").append(userForbidden.getForbiddenType());
				hql.append(" and forbiddenType=").append(userForbidden.getForbiddenType());
					
			}
			if(StringUtils.isNotBlank(userForbidden.getUserAccount())){
				sql.append(" and userAccount='").append(userForbidden.getUserAccount()).append("'");
				hql.append(" and userAccount='").append(userForbidden.getUserAccount()).append("'");
			}
			if(userForbidden.getProductId()!=null){
				sql.append(" and productId=").append(userForbidden.getProductId());
				hql.append(" and productId=").append(userForbidden.getProductId());
					
			}
			if(StringUtils.isNotBlank(userForbidden.getRole())){
				sql.append(" and role='").append(userForbidden.getRole()).append("'");
				hql.append(" and role='").append(userForbidden.getRole()).append("'");
			}
			if(StringUtils.isNotBlank(userForbidden.getDescription())){
				sql.append(" and description='").append(userForbidden.getDescription()).append("'");
				hql.append(" and description='").append(userForbidden.getDescription()).append("'");
			}
			}
			
		}
		page = this.queryPage(sql.toString(), hql.toString(),page.getPageSize(), page.getCurrentPage(),list);
		return page;
	}

	@Override
	public UserForbidden save(UserForbidden userForbidden) {
		this.addEntity(userForbidden);
		return userForbidden;
	}

	@Override
	public void delete(UserForbidden userForbidden) {
		this.delEntity(UserForbidden.class, new Object[]{"id"}, new Object[]{userForbidden.getId()});
	}

	@Override
	public void updateUserForbidden(UserForbidden userForbidden) {
		Object fieldName[] = new Object[]{"operator","forbiddenType","userAccount","productId","role","description","addTime"};
		Object fieldValue[] = new Object[]{userForbidden.getOperator(),userForbidden.getForbiddenType(),userForbidden.getUserAccount(),userForbidden.getProductId(),userForbidden.getRole(),userForbidden.getDescription(),userForbidden.getAddTime()};
		
		this.updateEntity(UserForbidden.class, fieldName, fieldValue, new Object[]{"id"}, new Object[]{userForbidden.getId()});
	}
	@Override
	public UserForbidden getUserForbiddenById(Integer id) {
		return this.getEntity(UserForbidden.class, id);
	}
}
