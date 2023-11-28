package user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lecture.dto.Class;
import lecture.service.face.ClassService;
import teacher.dto.Teacher;
import user.dto.UserInfo;
import user.service.face.UserService;
@Controller
@RequestMapping("/user")
public class UserController {
   private final Logger logger = LoggerFactory.getLogger( this.getClass() );

   @Autowired UserService userService;
   @Autowired ClassService classService;
   
   @GetMapping("/mypageMain")
   public void myOnClassList(Model model, HttpSession session) {
      logger.info("/class/myOnClassList");
//      logger.info("session : {}", session.getAttribute("userNo")); 
      int userNo = (int)session.getAttribute("userNo"); // 세션에서 사용자 번호 가져오기
      UserInfo userInfo = new UserInfo();
      userInfo.setUserNo(userNo);
      
      List<Class> lecture = classService.allLecture(userInfo); // 사용자의 수강 강의 목록 가져오기
      logger.info("class : {}", lecture);
      model.addAttribute("lecture", lecture); // 모델에 수강 강의 목록 추가
   }
   
   @GetMapping("/searchIdPw")
   public void searchIdPw() {
   }
   
   @PostMapping("/searchIdPw")
   public ModelAndView searchIdPwPost(UserInfo userInfo) {
       logger.info("post");
       logger.info("userInfo : {}", userInfo);

       // 이메일과 이름을 기반으로 사용자 정보를 가져옵니다.
       String idInfo = userService.searchInfo(userInfo);
       logger.info("idInfo : {}", idInfo);

       // ModelAndView 객체 생성
       ModelAndView modelAndView = new ModelAndView();
       
       if( idInfo != null ) {
    	   // 검색된 사용자 정보를 ModelAndView에 추가
    	   modelAndView.addObject("userId", idInfo);
    	   // 이동할 뷰의 경로 설정
    	   modelAndView.setViewName("user/searchUserId");
       } else {
           modelAndView.addObject("isIdCoincide", false );
           modelAndView.setViewName("user/searchIdPw");
       }

       // ModelAndView 반환
       return modelAndView;
   }
   
   @GetMapping("/resetPw")
   public String resetPwGet() {
       return "user/resetPw";
   }

//   @PostMapping("/resetPw")
//   public String resetPwPost(@ModelAttribute("userInfo") UserInfo userInfo, Model model) {
//
//       // 여기서 DB에 비밀번호 재설정 로직 추가
//       boolean isPasswordUpdated = userService.updatePassword(userInfo.getUserPw());
//
//       if (isPasswordUpdated) {
//           // 비밀번호가 성공적으로 업데이트된 경우
//           return "redirect:/user/updatePwChk"; // 로그인 페이지로 이동하도록 수정
//       } else {
//           model.addAttribute("errorMessage", "비밀번호 재설정에 실패했습니다. 다시 시도하세요.");
//           return "user/resetPw";
//       }
//   }
   
   	 @PostMapping("/checkPw")
   	 public ModelAndView checkPw(@ModelAttribute("userInfo") UserInfo userInfo ) {
   		 
   		 System.out.println("받아온 정보 : " + userInfo);
         // 사용자 비밀번호 업데이트 시도
         boolean isPasswordCoincide = userService.findPassword(userInfo);

         ModelAndView modelAndView = new ModelAndView();

         if (isPasswordCoincide) { // 회원정보가 일치 할 때 
        	 modelAndView.addObject("userInfo", userInfo);
             modelAndView.setViewName("user/resetPw"); // 업데이트 완료 페이지로 이동
         } else {
             modelAndView.addObject("errorMessage", "비밀번호 재설정에 실패했습니다.");
             modelAndView.addObject("isPassworCoincide", false );
             modelAndView.setViewName("user/searchIdPw"); // 실패 시 비밀번호 재설정 페이지로 다시 이동
         }
         return modelAndView;
   	 }
   	 
   @PostMapping("/resetPw")
   public ModelAndView resetPwPost(@ModelAttribute("userInfo") UserInfo userInfo) {
       // 사용자 비밀번호 업데이트 시도
	   System.out.println("현재 아이디 = " + userInfo.getUserId());
	   System.out.println("변경할 비밀 번호 = " + userInfo.getUserPw());
       boolean isPasswordUpdated = userService.updatePassword(userInfo);

       ModelAndView modelAndView = new ModelAndView();

       if ( isPasswordUpdated ) {
           // 비밀번호 업데이트 성공
           modelAndView.setViewName("user/updatePw"); // 업데이트 완료 페이지로 이동
       } else {
           // 비밀번호 업데이트 실패
           modelAndView.addObject("errorMessage", "비밀번호 재설정에 실패했습니다.");
           modelAndView.setViewName("user/resetPw"); // 실패 시 비밀번호 재설정 페이지로 다시 이동
       }
       return modelAndView;
   }
   
   @GetMapping("/userPwChk")
   public String userPwChkGet() {
	   return "user/userPwChk";
   }
   
   // 비밀번호 확인 및 회원정보 수정 처리
   @PostMapping("/userPwChk")
   public String userPwChkPost(Model model, String userId, String userPw, UserInfo userInfo) {
       boolean isPasswordCorrect = userService.checkPassword(userId, userPw);

       if (isPasswordCorrect) {
           return "redirect:/user/updateUserData";  // 비밀번호가 맞으면 회원정보수정 페이지로 이동
       } else {
           // 비밀번호가 틀리면 실패 메시지를 모델에 추가하여 userPwChk 페이지로 다시 이동
           model.addAttribute("passwordIncorrect", true);
           return "user/userPwChk";
       }
   }

   @GetMapping("/updatePw")
   public void updatePw() {}
   
   @GetMapping("/updateUserData")
   public void updateUserData(HttpSession session, Model model) {
      logger.info("{}",session.getAttribute("userNo"));
      UserInfo userInfo = new UserInfo();
      userInfo.setUserNo((int)session.getAttribute("userNo")); // 세션에서 사용자 번호 가져오기
      userInfo = userService.updateInfo(userInfo); // 사용자 정보 업데이트
      logger.info("{}",userInfo);
      model.addAttribute("userInfo", userInfo); // 모델에 사용자 정보 추가
   }
   
   @ResponseBody
   @PostMapping("/updateUserData")
   public Map<String, Object> updateUserDataPost(HttpSession session, UserInfo updatedUserInfo) {
       Map<String, Object> response = new HashMap<>();
       //       logger.info("param : {}", updatedUserInfo);
      
       updatedUserInfo.setUserNo((int)session.getAttribute("userNo"));
       
       UserInfo existingUserInfo = new UserInfo();
       existingUserInfo.setUserNo((int)session.getAttribute("userNo"));
       existingUserInfo = userService.updateInfo(existingUserInfo);  // 기존 사용자 정보 가져오기
       
       
       
       // 각 필드를 체크하여 값이 null이면 기존 데이터의 값을 사용한다
       if (updatedUserInfo.getUserId() == null) {
           updatedUserInfo.setUserId(existingUserInfo.getUserId());
       }
       if (updatedUserInfo.getUserPw() == null) {
          updatedUserInfo.setUserPw(existingUserInfo.getUserPw());
       }
       if (updatedUserInfo.getUserGender() == null) {
          updatedUserInfo.setUserGender(existingUserInfo.getUserGender());
       }
       if (updatedUserInfo.getUserBirthday() == null) {
          updatedUserInfo.setUserBirthday(existingUserInfo.getUserBirthday());
       }
       if (updatedUserInfo.getUserPhone() == null) {
          updatedUserInfo.setUserPhone(existingUserInfo.getUserPhone());
       }
       if (updatedUserInfo.getUserName() == null) {
          updatedUserInfo.setUserName(existingUserInfo.getUserName());
       }
       if (updatedUserInfo.getUserEmail() == null) {
          updatedUserInfo.setUserEmail(existingUserInfo.getUserEmail());
       }
       if (updatedUserInfo.getMainAddress() == null) {
          updatedUserInfo.setMainAddress(existingUserInfo.getMainAddress());
       }
       if (updatedUserInfo.getSubAddress() == null) {
          updatedUserInfo.setSubAddress(existingUserInfo.getSubAddress());
       }
       if (updatedUserInfo.getUserPost() == 0) {
          updatedUserInfo.setUserPost(existingUserInfo.getUserPost());
       }
       if (updatedUserInfo.getUserSecession() == 0) {
          updatedUserInfo.setUserSecession(existingUserInfo.getUserSecession());
       }
       
       logger.info("updatedUserInfo : {}", updatedUserInfo);
       logger.info("existingUserInfo : {}", existingUserInfo);
       int result = userService.updateUserData(updatedUserInfo);
       
       // 회원 정보 업데이트 성공 여부에 따라 1 또는 0을 설정
       int updateResult = userService.updateUserData(updatedUserInfo);
       response.put("success", updateResult == 1);
       return response;
   }
   
   @PostMapping("/updateUserDataOut")
   public void updateUserDataOut(HttpSession session, Model model) {
      logger.info("성공? 실패?");
      UserInfo userInfo = new UserInfo();
      logger.info("userNo : {}", session.getAttribute("userNo"));
      userInfo.setUserNo((int)session.getAttribute("userNo"));
       int data = userService.updateOutUser(userInfo);
       logger.info("탈퇴 처리 결과: {}", data);

       if (data == 1) {
          model.addAttribute("success", true);
       } else {
          model.addAttribute("success", false);
      }
   }
   
   @GetMapping("/searchUserId")
   public void searchUserId() {}
   
   @GetMapping("/join")
   public void join() {}
   
   @GetMapping("/joinOk")
   public String joinOk() {
      return "user/joinOk";
   }
   
   @PostMapping("/join")
   public String joinPost(UserInfo userInfo) {
      logger.info("param : {}", userInfo);
      
      userService.join( userInfo );
      
      return "redirect:./joinOk";
   }
   
   @GetMapping("/login")
   public void login() {
//      logger.info("test");
   }
   
   @PostMapping("/login")
   public String loginPost( UserInfo userInfo, Model model, HttpSession session, Teacher teacher ) {
//      logger.info("param : {}", userInfo);
      
      UserInfo loginInfo = userService.loginPost( userInfo );
      logger.info("loginInfo : {}", loginInfo);
      
       // 강사 번호
       if (loginInfo != null) {
           teacher.setUserNo(loginInfo.getUserNo()); // 강사 번호
           Teacher teacherNo = userService.getTeacherNo(teacher); // 강사 번호

           if(teacherNo != null) {
              session.setAttribute("teacherNo", teacherNo.getTeacherNo()); // 강사 번호
           }
           
           // 일반회원 로그인
           if (loginInfo.getUserNo() != 0) {
               boolean isLogin = true;
               session.setAttribute("isLogin", isLogin);
               session.setAttribute("userId", loginInfo.getUserId());
               session.setAttribute("userNo", loginInfo.getUserNo());

           } else if (loginInfo.getUserNo() == 0) { // 관리자 로그인
               boolean isLogin = true;
               session.setAttribute("isLogin", isLogin);
               session.setAttribute("admin", "ADMIN");
               session.setAttribute("userId", loginInfo.getUserId());

               return "redirect:/admin/main";
           }
       } else { // 로그인 실패
           session.invalidate();
        
           return "redirect:/user/login";
       }
      return "redirect:/main/main";
   }
   
   @GetMapping("/logout")
   public String logout(HttpSession session) {
      session.invalidate();
      
      return "redirect:/main/main";
   }
   
    @PostMapping("/checkDuplicateId")
    @ResponseBody
    public Map<String, Object> checkDuplicateId(@RequestParam("userId") String userId) {
        Map<String, Object> result = new HashMap<>();
        
        boolean isDuplicate = userService.checkDuplicateId(userId);
        
        result.put("duplicate", isDuplicate);
        return result;
    }
}