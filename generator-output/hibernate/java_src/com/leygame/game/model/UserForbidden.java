/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.leygame.game.model;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import javax.validation.constraints.*;
import org.hibernate.validator.constraints.*;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

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


@Entity
@Table(name = "t_user_forbidden")
public class UserForbidden extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "UserForbidden";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_OPERATOR = "操作人";
	public static final String ALIAS_FORBIDDEN_TYPE = "封号类型";
	public static final String ALIAS_USER_ACCOUNT = "用户帐号";
	public static final String ALIAS_PRODUCT_ID = "产品ID";
	public static final String ALIAS_ROLE = "角色";
	public static final String ALIAS_DESCRIPTION = "封号描述";
	public static final String ALIAS_ADD_TIME = "添加时间";
	
	//date formats
	public static final String FORMAT_ADD_TIME = DATE_FORMAT;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
	private java.lang.Integer id;
	@Length(max=20)
	private java.lang.String operator;
	@Max(127)
	private Integer forbiddenType;
	@Length(max=30)
	private java.lang.String userAccount;
	
	private java.lang.Integer productId;
	@Length(max=64)
	private java.lang.String role;
	@Length(max=65535)
	private java.lang.String description;
	
	private java.util.Date addTime;
	//columns END


	public UserForbidden(){
	}

	public UserForbidden(
		java.lang.Integer id
	){
		this.id = id;
	}

	

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "increment")
	@Column(name = "id", unique = true, nullable = false, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getId() {
		return this.id;
	}
	
	@Column(name = "operator", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public java.lang.String getOperator() {
		return this.operator;
	}
	
	public void setOperator(java.lang.String value) {
		this.operator = value;
	}
	
	@Column(name = "forbiddenType", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getForbiddenType() {
		return this.forbiddenType;
	}
	
	public void setForbiddenType(Integer value) {
		this.forbiddenType = value;
	}
	
	@Column(name = "userAccount", unique = false, nullable = true, insertable = true, updatable = true, length = 30)
	public java.lang.String getUserAccount() {
		return this.userAccount;
	}
	
	public void setUserAccount(java.lang.String value) {
		this.userAccount = value;
	}
	
	@Column(name = "productId", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getProductId() {
		return this.productId;
	}
	
	public void setProductId(java.lang.Integer value) {
		this.productId = value;
	}
	
	@Column(name = "role", unique = false, nullable = true, insertable = true, updatable = true, length = 64)
	public java.lang.String getRole() {
		return this.role;
	}
	
	public void setRole(java.lang.String value) {
		this.role = value;
	}
	
	@Column(name = "description", unique = false, nullable = true, insertable = true, updatable = true, length = 65535)
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	@Transient
	public String getAddTimeString() {
		return DateConvertUtils.format(getAddTime(), FORMAT_ADD_TIME);
	}
	public void setAddTimeString(String value) {
		setAddTime(DateConvertUtils.parse(value, FORMAT_ADD_TIME,java.util.Date.class));
	}
	
	@Column(name = "add_time", unique = false, nullable = true, insertable = true, updatable = true, length = 0)
	public java.util.Date getAddTime() {
		return this.addTime;
	}
	
	public void setAddTime(java.util.Date value) {
		this.addTime = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Operator",getOperator())
			.append("ForbiddenType",getForbiddenType())
			.append("UserAccount",getUserAccount())
			.append("ProductId",getProductId())
			.append("Role",getRole())
			.append("Description",getDescription())
			.append("AddTime",getAddTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof UserForbidden == false) return false;
		if(this == obj) return true;
		UserForbidden other = (UserForbidden)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

