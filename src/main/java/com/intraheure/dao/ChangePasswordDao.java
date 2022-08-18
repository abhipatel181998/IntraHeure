package com.intraheure.dao;

import com.intraheure.model.LoginVo;

public interface ChangePasswordDao {

	void updatePassword(LoginVo loginVo);

}
