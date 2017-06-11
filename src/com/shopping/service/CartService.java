package com.shopping.service;

import java.util.HashMap;

public class CartService {
	 HashMap<String, Integer> cartItems;
	    public CartService(){
	     cartItems = new HashMap<String,Integer>();
	     
	    }
	    public HashMap getCartItems(){
	        return cartItems;
	    }
	    public void addToCart(String itemId, int price){
	        cartItems.put(itemId, price);
	    }
	    public void deleteFromCart(String itemId){
	        cartItems.remove(itemId);
	    }
}

