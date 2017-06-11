package com.shopping.service;

import com.shopping.beans.*;
import com.shopping.dao.UserupdateDAO;

public class UpdateService {
	public boolean update(UserUpdate uu)
	{
	  UserupdateDAO udao=new UserupdateDAO();
		
		return udao.update(uu);
	}
}

