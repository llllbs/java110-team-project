package bitcamp.java110.cms.web;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.java110.cms.domain.Mentee;
import bitcamp.java110.cms.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {

    AuthService authService;
    
    
    public AuthController(AuthService authService) {
        this.authService = authService;
    }
    
    @GetMapping("form")
    public void form() {
    }
    
    @PostMapping("login")
    public String login(
            String email,
            String pwd,
            String save,
            HttpServletResponse response,
            HttpSession session) {
      System.out.println(email);
      System.out.println(pwd);
      System.out.println(save);
        
        if (save != null) {// 이메일 저장하기를 체크했다면,
            Cookie cookie = new Cookie("email", email);
            cookie.setMaxAge(60 * 60 * 24 * 30);
            response.addCookie(cookie);
            
        } else {// 이메일을 저장하고 싶지 않다면,
            Cookie cookie = new Cookie("email", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        
        Mentee loginUser = authService.getMentee(email, pwd);
        System.out.println(loginUser.getEmail());
        System.out.println(loginUser.getPwd());
        //System.out.println(loginUser.getBas_addr());
        //System.out.println(loginUser.getMtstat());
        System.out.println("여기는?");
        
        if (loginUser != null) {
            // 회원 정보를 세션에 보관한다.
            session.setAttribute("loginUser", loginUser);
            String redirectUrl = null;
            System.out.println("요까지");
            if(loginUser.getMtstat() == 'Y') {
              System.out.println("멘토로그인성공");
              redirectUrl = "form";
            } else {
              System.out.println("멘티로그인성공");
              redirectUrl = "form";
            }
            return "redirect:" + redirectUrl;
            
        } else {
            session.invalidate();
            return "redirect:form";
        }
    }
    
    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:form";
    }
    
    @RequestMapping("fblogin")
    public String fblogin(
            String accessToken,
            HttpSession session) {
        
        try {
//          Mentee loginUser = authService.getFacebookMember(accessToken);
          authService.getFacebookMember(accessToken);
          
          // 회원 정보를 세션에 보관한다.
//          session.setAttribute("loginUser", loginUser);
          String redirectUrl = null;

//          redirectUrl = "../manager/list";
          redirectUrl = "../auth/form";
          return "redirect:" + redirectUrl;
          
        } catch (Exception e) {
            e.printStackTrace();
            session.invalidate();
            return "redirect:form";
        }
    }
 
}














