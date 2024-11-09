package com.ict.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ict.cart.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<CartVO> getCartList(String user_idx) throws Exception {
        return sqlSessionTemplate.selectList("cart.list", user_idx);
    }

    @Override
    public CartVO isProductInCart(String user_idx, int product_idx) {
        Map<String, Object> map = new HashMap<>();
        map.put("user_idx", user_idx);
        map.put("product_idx", product_idx);
        return sqlSessionTemplate.selectOne("isProductInCart", map);
    }

    @Override
    public int addToCart(String user_idx, int product_idx, int quantity) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("user_idx", user_idx);
        map.put("product_idx", product_idx);
        map.put("quantity", quantity);
        return sqlSessionTemplate.insert("cart.add", map);
    }

    @Override
    public int updateExistingQuantity(int cart_idx, int quantity) throws Exception {
        Map<String, Integer> map = new HashMap<>();
        map.put("cart_idx", cart_idx);
        map.put("quantity", quantity);
        return sqlSessionTemplate.update("cart.updateQuantity", map);
    }
    
    @Override
    public int deleteSelectedItems(List<Integer> product_ids, String user_idx) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("product_ids", product_ids);
        map.put("user_idx", user_idx);
        return sqlSessionTemplate.delete("cart.removeProductsFromCart", map);
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
        return sqlSessionTemplate.selectOne("cart.orderedItem", product_idx);
    }
}