package login.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Component
@PropertySource("classpath:/config.properties")
public class KakaoLoginBO {

    private static String CLIENT_ID;
    private static String REDIRECT_URI;

    @Autowired
    public KakaoLoginBO(@Value("${spring.datasource.RestAPIKey}") String clientId,
                        @Value("${spring.datasource.ip}") String ip) {
        KakaoLoginBO.CLIENT_ID = clientId;
        KakaoLoginBO.REDIRECT_URI = "http://" + ip + "/login/callback2";
//        System.out.println("RestAPIKey: " + clientId);
//        System.out.println("Redirect URI: " + REDIRECT_URI);
    }

    public String getKakaoAuthUrl() {
        return "https://kauth.kakao.com/oauth/authorize" +
               "?client_id=" + CLIENT_ID +
               "&redirect_uri=" + REDIRECT_URI +
               "&response_type=code";
    }
	

	// 액세스 토큰 획득
    public String getAccessToken(String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", CLIENT_ID);
        params.add("redirect_uri", REDIRECT_URI);
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.exchange(
            "https://kauth.kakao.com/oauth/token", 
            HttpMethod.POST,
            request, 
            Map.class
        );

        Map<String, Object> responseBody = response.getBody();
        return (String) responseBody.get("access_token");
    }

    public Map<String, Object> getKakaoUserInfo(String accessToken) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(accessToken);

        HttpEntity<?> entity = new HttpEntity<>(headers);
        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<Map> response = restTemplate.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.GET,
                entity,
                Map.class);

        return response.getBody();
    }
}