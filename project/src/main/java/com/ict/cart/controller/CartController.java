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
import com.ict.member.service.MemberService; // 추가된 부분
import com.ict.member.vo.AddressVO; // 추가된 부분
import com.ict.member.vo.MemberVO;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;
    
    @Autowired
    private MemberService memberService; // 추가된 부분

    // 세션에서 user_id를 가져오는 로그인 상태 확인 메서드
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
            String user_idx_String = getUserIdxFromSession(session);
            if (user_idx_String == null) {
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
            String user_idx_String = getUserIdxFromSession(session);
            System.out.println("user_idx : " + user_idx_String);
            if (user_idx_String == null) {
                return new ModelAndView("redirect:/user_login");
            }

            // 사용자 주소 목록 받아오기 - 추가된 부분
            List<AddressVO> user_addresses = memberService.getMemberAddressList(user_idx_String);
            System.out.println("address : " + user_addresses.get(0).getAddress_idx());
            if (user_addresses != null) {
                mv.addObject("user_addresses", user_addresses);
            }
            

            // 사용자 포인트 불러오기 - 추가된 부분
            int point = memberService.getTotalPoint(user_idx_String);
            
            if(point <= 0) {
            	point = 0;
            } else {            	
            	mv.addObject("point", point);
            }
            System.out.println("point :" + point);
            

            // JSON 문자열을 List<Map<String, Object>>로 변환
            Gson gson = new Gson();
            List<Map<String, Object>> items = gson.fromJson(selectedItemsJson, List.class);


            // 선택된 아이템들을 CartVO 리스트로 변환하기
            List<CartVO> cartList = new ArrayList<>();

            System.out.println("여기?");
            for (Map<String, Object> item : items) {
                int productIdx = ((Double) item.get("product_idx")).intValue();
                int quantity = ((Double) item.get("quantity")).intValue();

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
    public Map<String, Object> deleteSelectedItems(HttpSession session, 
    		@RequestParam("product_ids") List<Integer> product_ids) {
        Map<String, Object> response = new HashMap<>();
        String user_idx_String = getUserIdxFromSession(session);
        System.out.println("user_idx : " + user_idx_String);
        if (user_idx_String == null) {
            response.put("login", false);
            response.put("success", false);
            return response;
        } else {
            response.put("login", true);
        }

        try {
            int result = cartService.deleteSelectedItems(product_ids, user_idx_String);
            response.put("success", result > 0);
            return response;
        } catch (Exception e) {
            System.out.println(e);
            response.put("error", e);
            return response;
        }
    }

    @PostMapping("/add_to_cart")
    @ResponseBody
    public Map<String, Object> addCart(HttpSession session, 
    		@RequestParam("product_idx") int product_idx, 
    		@RequestParam("quantity") int quantity) {
        Map<String, Object> response = new HashMap<>();

        try {
            String user_idx_String = getUserIdxFromSession(session);
            if (user_idx_String == null) {
                response.put("redirect", true);
                response.put("loginUrl", "/user_login");
                return response;
            }
            

            int result;
            // 장바구니에 상품이 이미 있는지 확인 후 insert 또는 update
            CartVO existingItem = cartService.isProductInCart(user_idx_String, product_idx);
            if (existingItem == null) {
                result = cartService.addToCart(user_idx_String, product_idx, quantity);
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