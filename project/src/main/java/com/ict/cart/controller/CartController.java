package com.ict.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.ict.cart.service.CartService;
import com.ict.cart.vo.CartVO;
import com.ict.member.vo.MemberVO;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    // 세션에서 user_idx를 가져오는 로그인 상태 확인 메서드
    private String getUserIdxFromSession(HttpSession session) {
        MemberVO loggedInUser = (MemberVO) session.getAttribute("userInfo");
        return (loggedInUser != null) ? loggedInUser.getUser_idx() : null;
    }

    @GetMapping("/cart_list")
    public ModelAndView cartList(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {
            String user_idx = getUserIdxFromSession(session);
            if (user_idx == null) {
                System.out.println("로그인되지 않은 사용자입니다.");
                mv.setViewName("redirect:/user_login");
                return mv;
            }

            List<CartVO> cart_list = cartService.getCartList(user_idx);
            mv.setViewName("cart/cart_list");
            mv.addObject("cart_list", cart_list);
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("errorPage");
            mv.addObject("errorMessage", "장바구니 정보를 불러오는 중 오류가 발생했습니다.");
        }
        return mv;
    }

    @GetMapping("/orders_detail")
    public ModelAndView ordersDetail(HttpSession session) {
        try {
            String user_idx = getUserIdxFromSession(session);
            if (user_idx == null) {
                return new ModelAndView("redirect:/user_login");
            }
            ModelAndView mv = new ModelAndView("products/order_details");
            return mv;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @PostMapping("/view_orders_detail")
    public ModelAndView viewOrderDetails(@RequestParam("selectedItems") String selectedItemsJson, HttpSession session) {
        ModelAndView mv = new ModelAndView("cart/order_details");
        try {
            String user_idx = getUserIdxFromSession(session);
            if (user_idx == null) {
                return new ModelAndView("redirect:/user_login");
            }

            // JSON 문자열을 List<Map<String, Object>>로 변환
            Gson gson = new Gson();
            List<Map<String, Object>> items = gson.fromJson(selectedItemsJson, List.class);

            // 선택된 아이템들을 CartVO 리스트로 변환하기
            List<CartVO> cartList = new ArrayList<>();

            for (Map<String, Object> item : items) {
            	String productIdx = String.valueOf(((Double) item.get("product_idx")).intValue());
                String quantity = String.valueOf(((Double) item.get("quantity")).intValue());

                // 상품 정보 DB에서 조회
                CartVO product = cartService.getProductByIdx(productIdx);
                if (product != null) {
                    product.setQuantity(quantity);
                    cartList.add(product);
                }
            }

            mv.addObject("cart_list", cartList);
            return mv;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @PostMapping("/deleteSelectedItems")
    @ResponseBody
    public Map<String, Object> deleteSelectedItems(HttpSession session, @RequestParam("product_ids") List<Integer> product_ids) {
        Map<String, Object> response = new HashMap<>();
        String user_idx = getUserIdxFromSession(session);

        if (user_idx == null) {
            response.put("login", false);
            response.put("success", false);
            return response;
        } else {
            response.put("login", true);
        }

        try {
            // 만약 deleteSelectedItems 메서드가 int를 반환하면 아래와 같이 처리
            int result = cartService.deleteSelectedItems(product_ids, user_idx);
            response.put("success", result > 0); // 성공 여부를 정수 비교로 처리
            return response;
        } catch (Exception e) {
            System.out.println(e);
            response.put("error", e);
            return response;
        }
    }


    @PostMapping("/add_to_cart")
    @ResponseBody
    public Map<String, Object> addCart(HttpSession session, @RequestParam("product_idx") String product_idx, @RequestParam("quantity") int quantity) {
        Map<String, Object> response = new HashMap<>();

        try {
            String user_idx = getUserIdxFromSession(session);
            if (user_idx == null) {
                response.put("redirect", true);
                response.put("loginUrl", "/user_login");
                return response;
            }

            int result;
            CartVO existingItem = cartService.isProductInCart(user_idx, product_idx);
            if (existingItem == null) {
                result = cartService.addToCart(user_idx, product_idx, quantity);
            } else {
                result = cartService.updateExistingQuantity(existingItem.getCart_idx(), quantity);
            }

            response.put("success", result > 0);
            return response;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }




}
