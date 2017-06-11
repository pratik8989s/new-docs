package com.shopping.service;

import com.shopping.beans.ProductBean;
import com.shopping.dao.ProductDAO;
import com.shopping.dao.UpdateProductDAO;

public class ProductService {
	public boolean add(ProductBean pb)
	{
		ProductDAO pdao=new ProductDAO();
		
		return pdao.add(pb);
	}
 public boolean update(ProductBean pb)
 {
	 UpdateProductDAO updao=new UpdateProductDAO();
	 return updao.update(pb);
 }
}

