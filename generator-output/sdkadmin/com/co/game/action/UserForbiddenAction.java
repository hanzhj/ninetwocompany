package com.co.game.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.co.game.action.SessionKeys;
import com.co.game.action.commom.BaseAction;
import com.co.game.action.commom.PageBean;
import com.co.game.entity.SysUser;
import com.co.game.entity.UserForbidden;
import com.co.game.service.UserForbiddenService;
import com.opensymphony.xwork2.ActionContext;
@Controller("userForbiddenAction")
@Scope("prototype")
public class UserForbiddenAction extends BaseAction{
	private PageBean page;
	@Autowired
	private UserForbiddenService userForbiddenService;
	private UserForbidden userForbidden;
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
		page = userForbiddenService.list(page, userForbidden);
		this.nextGepPage = "/userForbidden/userForbiddenList.jsp";
		return "success";
	}
	/**
	 * 
	 * @throws Exception
	 */
	public void delete() throws Exception{
		userForbiddenService.delete(userForbidden);
		this.getResponse().setContentType("application/json;charset=utf-8");
		this.getResponse().getWriter().write("{\"status\":\"success\"}");
	}
	/**
	 * 
	 * @throws Exception
	 */
	public void save() throws Exception{
		this.getResponse().setContentType("text/html;charset=utf-8");
		if(userForbidden!=null){
			if(userForbidden.getId()==null){
				userForbidden.setAdd_time(new Date());
				userForbiddenService.save(userForbidden);
			}else{
				userForbiddenService.updateuserForbidden(userForbidden);
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
			userForbidden=userForbiddenService.getuserForbiddenById(id);
		}
		this.nextGepPage = "/userForbidden/userForbiddenEdit.jsp";
		return "success";
	}

	public PageBean getPage() {
		return page;
	}

	public void setPage(PageBean page) {
		this.page = page;
	}

	public userForbidden getuserForbidden() {
		return userForbidden;
	}

	public void setuserForbidden(userForbidden userForbidden) {
		this.userForbidden = userForbidden;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
