package login.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import login.BO.KakaoLoginBO;
import login.BO.NaverLoginBO;
import login.service.face.LoginService;
import user.dto.UserInfo;

@Controller
@RequestMapping("/login")
public class SocialLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
	    this.kakaoLoginBO = kakaoLoginBO;
	}
	@Autowired LoginService loginService;
	
	// 로그인 첫 화면 요청 메소드
	@RequestMapping("/login")
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
//		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("naverUrl", naverAuthUrl);

		String kakaoAuthUrl = kakaoLoginBO.getKakaoAuthUrl();
		
//		System.out.println("카카오:" + kakaoAuthUrl);
		// 카카오
		model.addAttribute("kakaoUrl", kakaoAuthUrl);
		
		/* 생성한 인증 URL을 View로 전달 */
		return "login/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping("/callback")
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    String apiResult = naverLoginBO.getUserProfile(oauthToken);

	    ObjectMapper mapper = new ObjectMapper();
	    JsonNode rootNode = mapper.readTree(apiResult);
	    JsonNode responseNode = rootNode.path("response"); // 네이버 API 응답의 "response" 노드
//	    System.out.println(responseNode);
	    UserInfo userInfo = new UserInfo();
	    userInfo.setUserName(responseNode.path("name").asText());
	    userInfo.setUserEmail(responseNode.path("email").asText());
	    String gender = responseNode.path("gender").asText();
	    if (gender != null) {
	        // 성별 정보를 0과 1로 매핑
	        if (gender.equals("M")) {
	            userInfo.setUserGender("0");
	        } else if (gender.equals("F")) {
	            userInfo.setUserGender("1");
	        }
	    }
	    userInfo.setUserPhone(responseNode.path("mobile").asText());
	    String birthYear = responseNode.path("birthyear").asText();
	    String birthday = responseNode.path("birthday").asText().replace("-", ""); // "05-05" -> "0505"
	    if (birthday.length() == 4) { // "MMDD" 포맷 확인
	        String birthDateStr = birthYear + "-" + birthday.substring(0, 2) + "-" + birthday.substring(2, 4); // "1996-05-05"
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        Date birthDate = new Date(dateFormat.parse(birthDateStr).getTime());
	        userInfo.setUserBirthday(birthDate);
	    }
//	    model.addAttribute("userInfo", userInfo);
	    
	    //유저중에 이메일 같은사람 있는지 확인
	    boolean result = loginService.isOurClient(userInfo);
	    //없으면 회원가입(insert)
	    if(!result) {
	    	loginService.socialJoin(userInfo);
	    }
	    //로그인
	    userInfo = loginService.getUserData(userInfo);
	    session.setAttribute("isLogin", true);
	    session.setAttribute("userNo", userInfo.getUserNo());
//	    return "login/kakaoSuccess";
	    return "redirect:/main/main";
//	    return "login/naverSuccess";
	}

	@RequestMapping(value = "/callback2", method = RequestMethod.GET)
	public String kakaoCallback(@RequestParam("code") String code, Model model, HttpSession session) {
	    // 액세스 토큰 획득
	    String accessToken = kakaoLoginBO.getAccessToken(code);
//	    System.out.println(accessToken);
	    
	    // 카카오 사용자 정보 획득
	    Map<String, Object> kakaoUserInfo = kakaoLoginBO.getKakaoUserInfo(accessToken);
//	    System.out.println(kakaoUserInfo);

	    UserInfo userInfo = new UserInfo();

	    Map<String, Object> kakaoAccount = (Map<String, Object>) kakaoUserInfo.get("kakao_account");

	    userInfo.setUserName((String) kakaoAccount.get("name"));
	    userInfo.setUserEmail((String) kakaoAccount.get("email"));
	    String gender = (String) kakaoAccount.get("gender");
	    if (gender != null) {
	        // 성별 정보를 0과 1로 매핑
	        if (gender.equals("male")) {
	            userInfo.setUserGender("0");
	        } else if (gender.equals("female")) {
	            userInfo.setUserGender("1");
	        }
	    }
	    String phoneNumber = (String) kakaoAccount.get("phone_number");
	    if (phoneNumber != null) {
	    	phoneNumber = phoneNumber.replace("+82 ", "0");
	        userInfo.setUserPhone(phoneNumber);
	    }

	    String birthYear = (String) kakaoAccount.get("birthyear");
	    String birthday = (String) kakaoAccount.get("birthday"); // "MMDD" 형식

	    // "MMDD" 포맷 확인
	    if (birthday != null && birthday.length() == 4) {
	        String birthDateStr = birthYear + "-" + birthday.substring(0, 2) + "-" + birthday.substring(2, 4); // "1996-05-05"
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date birthDate = new Date(dateFormat.parse(birthDateStr).getTime());
	            userInfo.setUserBirthday(birthDate);
	        } catch (ParseException e) {
	            e.printStackTrace(); // 날짜 파싱 중 발생한 예외 처리
	        }
	    }

//	    model.addAttribute("userInfo", userInfo);
	    
	    //유저중에 이메일 같은사람 있는지 확인
	    boolean result = loginService.isOurClient(userInfo);
	    //없으면 회원가입(insert)
	    if(!result) {
	    	loginService.socialJoin(userInfo);
	    }
	    //로그인
	    userInfo = loginService.getUserData(userInfo);
	    session.setAttribute("isLogin", true);
	    session.setAttribute("userNo", userInfo.getUserNo());
//	    return "login/kakaoSuccess";
	    return "redirect:/main/main";
	}
	
}
