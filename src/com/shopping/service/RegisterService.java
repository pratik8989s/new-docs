package com.shopping.service;

import com.shopping.beans.RegisterBean;
import com.shopping.dao.RegisterDAO;

public class RegisterService {
	public boolean register(RegisterBean rb)
	{
		RegisterDAO rdao=new RegisterDAO();
		
		return rdao.register(rb);
	}
}

