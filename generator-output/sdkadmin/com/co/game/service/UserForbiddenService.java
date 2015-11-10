package com.co.game.service;

import com.co.game.action.commom.PageBean;
import com.co.game.entity.UserForbidden;
/**
 * 
 * @author xiaohe
 *
 */
public interface UserForbiddenService {
	/**
	 * 保存记录
	 * @param uf
	 * @return
	 */
	public UserForbidden save(UserForbidden userForbidden);
	/**
	 * 删除
	 * @param userForbidden
	 */
	public void deleteUserForbidden(UserForbidden userForbidden);
	/**
	 * 修改记录
	 * @param userForbidden
	 * @return
	 */
	public void updateUserForbidden(UserForbidden userForbidden);
	/**
	 * 根据条件查询记录
	 * @param userForbidden
	 * @return
	 */
	public PageBean list(PageBean page,UserForbidden userForbidden);
	/**
	 * 根据UserForbidden ID查询信息
	 * @param id
	 * @return
	 */
	public UserForbidden getUserForbiddenById(Integer id);
}
