package com.ict.data.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Random;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.ict.data.service.ProjectDatabaseService;
import com.ict.data.vo.ProjectDatabaseVO;


// Controller 는 servlet-context.xml로 리턴한다.
// RestController 는 servlet-context.xml로 리턴하지 않고 브라우저에 출력

@RestController
public class ProjectTestController {
	@Autowired
	private ProjectDatabaseService projectDatabaseService;
	
	
	@RequestMapping(value = "/project_test", produces="text/xml; charset=utf-8")
	@ResponseBody
	public String Xml_Exam03() {
		
		 BufferedReader rd = null;
		 HttpURLConnection conn = null;
		try {
			StringBuilder urlBuilder = new StringBuilder("http://data.ekape.or.kr/openapi-data/service/user/grade/auct/cattle"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Zi5spyo6uDGwsvsvG7eJlFLkK%2BtywkooVrUgFk6NAWtcsnzQ3aBw1PMxAK%2FHp0fhWiPbbNwvEAe%2F382Rkgk74A%3D%3D");   /*자기의 서비스키 = Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*xml 또는 json*/
	        urlBuilder.append("&" + URLEncoder.encode("startYmd","UTF-8") + "=" + URLEncoder.encode("20100501", "UTF-8")); // 시작일
	        urlBuilder.append("&" + URLEncoder.encode("endYmd","UTF-8") + "=" + URLEncoder.encode("20100530", "UTF-8"));  // 끝나는 날
	        urlBuilder.append("&" + URLEncoder.encode("breedCd","UTF-8") + "=" + URLEncoder.encode("024002", "UTF-8")); // 품종
	        urlBuilder.append("&" + URLEncoder.encode("qgradeYn","UTF-8") + "=" + URLEncoder.encode("N", "UTF-8"));  // 육질등급구분
	        urlBuilder.append("&" + URLEncoder.encode("defectIncludeYn","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); // 결함포함가격
	        
	        URL url = new URL(urlBuilder.toString());
	        conn = (HttpURLConnection) url.openConnection();
	        
	        conn.setRequestMethod("GET");
	        
	        System.out.println("Response code: " + conn.getResponseCode()); // 200 OK
	        
	       
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	       
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        
	        // XML 데이터 파싱
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            try {
				
            	Document doc = builder.parse(new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
            	
            	NodeList items = doc.getElementsByTagName("item");
            	Random random = new Random();
            	
            	for (int i = 0; i < items.getLength(); i++) {
            		Node item = items.item(i);
            		Element element = (Element) item;
            		
            		// 각 필드를 변수로 받기
            		String price = getTagValue("CCityAmt", element);
            		String stock = getTagValue("CCityCnt", element);
            		String created_at = getTagValue("startYmd", element);
            		String categoryIdx = getTagValue("judgeBreedCd", element);
            		
            		// 값이 모두 존재하는 경우에만 저장
            		if (price != null && stock != null && created_at != null && categoryIdx != null) {
            			ProjectDatabaseVO auctionData = new ProjectDatabaseVO();
            			auctionData.setPrice(price);
            			auctionData.setStock(stock);
            			auctionData.setCreated_at(created_at);
            			auctionData.setCategory_idx(categoryIdx);
            			
            			// 추가할 임의의 값 설정
            			String sellerIdx = Integer.toString(random.nextInt(5) + 1);
            			auctionData.setSellers_idx(sellerIdx);  // 1부터 5까지의 임의의 숫자
            			auctionData.setProduct_name(categoryIdx) ;        // 고정 값 "돼지고기"
            			 // 판매자 ID에 따라 product_name과 description 설정
            			switch (sellerIdx) {
                        case "1":
                            auctionData.setDescription("경빈이네 돼지고기! 최고급 품질의 돼지고기를 집에서 쉽고 빠르게 만나보세요! 경빈이네는 오로지 1등급만 취급합니다");
                            auctionData.setProduct_name("[업소용/냉동] 돼지 앞다리살(정육) - 국산");
                            break;
                        case "2":
                            auctionData.setDescription("당당한돈. 더 당당한 품질, 더 당당한 공급, 더 당당한 가격 약속드리며, 품절 없는 당당한돈이 되겠습니다!");
                            auctionData.setProduct_name("호주산 돼지 목살(정육)");
                            break;
                        case "3":
                            auctionData.setDescription("본 상품은 삼겹 돈피, 등심 돈피가 무작위로 혼합된 상품입니다");
                            auctionData.setProduct_name("돈피/돼지껍데기 - 국산|J&J 보성녹돈");
                            break;
                        case "4":
                            auctionData.setDescription("쫄깃한 껍질 단단한 지방층과 두툼한 살이 매력인 부위. 직수입 특수 진공지로 깔끔한 진공 밀착을 통해 신선함을 유지했습니다.");
                            auctionData.setProduct_name("미박후지 - 국산 | 오성愛한돈");
                            break;
                        case "5":
                            auctionData.setDescription("축적된 노하우와 위생적인 시스템으로 더욱 신선한 고급육! 최고의 맛과 육질을 가진 돼지고기.");
                            auctionData.setProduct_name("잡육 - 국산 | 박달재포크");
                            break;
                    }
            			// 데이터베이스에 저장
            			try {
            			    projectDatabaseService.saveDatabaseData(auctionData);
            			} catch (Exception e) {
            			    System.out.println("데이터베이스 삽입 오류 발생: " + e.getMessage());
            			    e.printStackTrace();
            			}
            		}
            	}
			} catch (Exception e) {
				System.out.println("파싱 도중 오류발생");
				e.printStackTrace();
			}
            
	        return sb.toString();
	        
		} catch (Exception e) {
			System.out.println(e);
			return null;
		} finally {
			try {
				rd.close();
			    conn.disconnect();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
	}
	
	private String getTagValue(String tag, Element element) {
	    NodeList nlList = element.getElementsByTagName(tag);
	    if (nlList != null && nlList.getLength() > 0) {
	        Node nValue = nlList.item(0).getFirstChild();
	        if (nValue != null) {
	            return nValue.getNodeValue();
	        }
	    }
	    return null;
	}
	
}

