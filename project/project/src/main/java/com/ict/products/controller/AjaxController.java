package com.ict.products.controller;

import org.springframework.web.bind.annotation.*;
import com.ict.common.Paging;
import com.ict.products.service.ProductsService;
import com.ict.products.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@RestController
public class AjaxController {

    @Autowired
    private ProductsService productsService;
	@Autowired
	private Paging paging;
	
    @GetMapping("/reviews")  // GET 메서드로 변경
    @ResponseBody
    public ResponseEntity<ReviewResponse> getReviews(
    		@ModelAttribute("cPage") int cPage,
    		@RequestParam("product_idx") int product_idx) {
        // 페이지 정보 설정
    	System.out.println("product_idx : " + product_idx);

        try {
            // 전체 리뷰 개수 가져오기
            int totalRecords = productsService.getReviewsCount(String.valueOf(product_idx));
            paging.setTotalRecord(totalRecords);
            System.out.println("전체 페이지 수 : " + totalRecords);
            
    		// 2. 전체 페이지 수를 구한다.
    		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
    			paging.setTotalPage(1);
    		} else {
    			paging.setTotalPage(paging.getTotalRecord()/ paging.getNumPerPage());
    			if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
    				paging.setTotalPage(paging.getTotalPage() + 1);
    			}
    		}
            
    		// 3. 파라미터에서 넘어오는 cPage를 구하자(보고 싶은 페이지 번호)
    		//만약 cPage가 null이면 무조건 1page이다.
    		if (cPage == 0) {
    			paging.setNowPage(1);
    			cPage = 1;
    		} else {
    			paging.setNowPage(cPage);
    		}
    		
    		System.out.println("cPage : " + cPage);
    		paging.setOffset(paging.getNumPerPage()*(paging.getNowPage()-1));
    	
    		
            
            // 리뷰 가져오기
            List<ReviewVO> reviews = productsService.getReviewList(String.valueOf(product_idx), paging.getNumPerPage(), cPage-1);
            
            // 응답 객체 생성
            ReviewResponse response = new ReviewResponse();
            response.setReviews(reviews);
            response.setTotalRecords(totalRecords);
            response.setTotalPages(paging.getTotalPage());
            response.setNumPerPage(paging.getNumPerPage());
            return ResponseEntity.ok(response); // JSON으로 응답 반환
            
        } catch (Exception e) {
            System.out.println(e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null); // 오류 시 500 반환
        }
    }
    
    // 내부 클래스 응답 객체
    public static class ReviewResponse {
        private List<ReviewVO> reviews; // 필드 명칭 통일
        private int totalRecords;
        private int totalPages;
        private int pagePerBlock;
        private int nowBlock;
        private int beginBlock;
		private int endBlock;
        private int numPerPage;
        
        
        public int getNumPerPage() {
			return numPerPage;
		}

		public void setNumPerPage(int numPerPage) {
			this.numPerPage = numPerPage;
		}

		public int getNowBlock() {
			return nowBlock;
		}

		public void setNowBlock(int nowBlock) {
			this.nowBlock = nowBlock;
		}

		public int getBeginBlock() {
			return beginBlock;
		}

		public void setBeginBlock(int beginBlock) {
			this.beginBlock = beginBlock;
		}

		public int getEndBlock() {
			return endBlock;
		}

		public void setEndBlock(int endBlock) {
			this.endBlock = endBlock;
		}

        // Getters and Setters
        public List<ReviewVO> getReviews() {
            return reviews;
        }

        public void setReviews(List<ReviewVO> reviews) {
            this.reviews = reviews;
        }

        public int getTotalRecords() {
            return totalRecords;
        }

        public void setTotalRecords(int totalRecords) {
            this.totalRecords = totalRecords;
        }

        public int getTotalPages() {
            return totalPages;
        }

        public void setTotalPages(int totalPages) {
            this.totalPages = totalPages;
        }

		public int getPagePerBlock() {
			return pagePerBlock;
		}

		public void setPagePerBlock(int pagePerBlock) {
			this.pagePerBlock = pagePerBlock;
		}
    }
}
