package com.ict.cart.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ict.cart.dao.CartDAO;
import com.ict.cart.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDAO cartDAO;

    @Override
    public List<CartVO> getCartList(String user_idx) throws Exception {
        return cartDAO.getCartList(user_idx);
    }

    @Override
    public CartVO isProductInCart(String user_idx, int product_idx) throws Exception {
        return cartDAO.isProductInCart(user_idx, product_idx);
    }

    @Override
    public int addToCart(String user_idx, int product_idx, int quantity) throws Exception {
        return cartDAO.addToCart(user_idx, product_idx, quantity);
    }

    @Override
    public int updateExistingQuantity(int cart_idx, int quantity) throws Exception {
        return cartDAO.updateExistingQuantity(cart_idx, quantity);
    }

    @Override
    public int deleteSelectedItems(List<Integer> product_ids, String user_idx) throws Exception {
        return cartDAO.deleteSelectedItems(product_ids, user_idx);
    }

    @Override
    public int getCartEdit(CartVO cavo) throws Exception {
        return 0;
    }

    @Override
    public int getCartDelete(String cart_idx) throws Exception {
        return 0;
    }

    @Override
    public CartVO getProductByIdx(int product_idx) throws Exception {
        return cartDAO.getProductByIdx(product_idx);
    }
}