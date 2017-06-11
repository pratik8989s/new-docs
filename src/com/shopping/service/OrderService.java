package com.shopping.service;

import com.shopping.beans.OrderBean;
import com.shopping.dao.OrderDAO;

public class OrderService {
	public boolean pay(OrderBean pb)
	{
		OrderDAO odao=new OrderDAO();
		
		return odao.pay(pb);
	}
}

