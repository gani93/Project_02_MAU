package com.spring.mau.view.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@Controller
public class KakaoController {

@RequestMapping(value = "/login/getKakaoAuthUrl",method = RequestMethod.GET)
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=ecf9b919f7ed4543a850f3e479252f56"
				+ "&redirect_uri=http://localhost:8181/mau/login/oauth_kakao"
//				+ "&scope=account_email"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/login/oauth_kakao",method = RequestMethod.GET)
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model,HttpServletResponse response,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		System.out.println("#########" + code);
        String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
       
        session.setAttribute("access_Token", access_Token);
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        model.addAttribute("kakaoInfo", kakaoInfo);
       
        return "/index"; //본인 원하는 경로 설정
	}
	
    //토큰발급
	public String getAccessToken (String authorize_code) throws ParseException {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=ecf9b919f7ed4543a850f3e479252f56");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8181/mau/login/oauth_kakao");   
            sb.append("&client_secret=IorMHqPRlfv4xCvFLWAGBCgwYNSLn2r0");// 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            //
            

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode1 : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body1 : " + result);

            
            String str = result;
    	    String[] array = str.split(",");
    	    		    
    	    //출력				
    	    for(int i=0;i<array.length;i++) {
    	    System.out.println(array[i]);
    	    }
            
//    	    System.out.println(array[0]);
    	    
    	    String Ktoken = array[0].replaceAll("\\\"","");
    	    
    	    String Ktokenstr = Ktoken;
    	    String[] Ktokenarray = Ktokenstr.split(":");
    	    
    	    

            System.out.println("access_token : " + Ktokenarray[1]);
            access_Token = Ktokenarray[1];
//            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
//            JSONParser parser = new JSONParser();
//            JSONObject jsonObj = (JSONObject)parser.parse(result);
////            JsonElement element = (JsonElement) parser.parse(result);
//     
////            access_Token = element.getAsJsonObject().get("access_token").getAsString();
////            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
//            
//            access_Token = (String)jsonObj.get(access_Token);
//            refresh_Token = (String)jsonObj.get(refresh_Token);
//
////            System.out.println("access_token : " + access_Token);
////            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
        	
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
    //유저정보조회
    public HashMap<String, Object> getUserInfo(String access_Token){

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization"," Bearer " +access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode2 : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body2 : " + result);

//            JSONParser parser = new JSONParser();
//            JSONObject jsonObj = (JSONObject)parser.parse(result);
//
//            JSONObject properties = (JSONObject) jsonObj.get("properties");
//            JSONObject kakao_account = (JSONObject) jsonObj.get("kakao_account");
//
//            String nickname = properties.get("nickname").toString();
//            String email = kakao_account.get("email").toString();
//            
//            userInfo.put("accessToken", access_Token);
//            userInfo.put("nickname", nickname);
//            userInfo.put("email", email);
            
            String str1 = result;
    	    String[] array1 = str1.split(",");
    	    		    
    	    //출력				
    	    for(int i=0;i<array1.length;i++) {
    	    System.out.println(array1[i]);
    	    }
    	    
//    	    System.out.println(array1[9]);
    	    
    	    String nickname = array1[2].replaceAll("\\\"","").replace("}", "");
    	    
    	    String nickstr = nickname;
    	    String[] nickarray = nickstr.split(":");
    	    
    	    String email = array1[9].replaceAll("\\\"","").replace("}", "");
    	    
    	    String emailstr = email;
    	    String[] emailarray = emailstr.split(":");
    	    
    	    nickname = nickarray[2];
    	    email = emailarray[1];
    	    
    	    
    	    userInfo.put("email", email);
    	    userInfo.put("nickname", nickname);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }
    
 }
