package bitcamp.java110.cms.web;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.java110.cms.domain.Cert;
import bitcamp.java110.cms.domain.ClassOrder;
import bitcamp.java110.cms.domain.ClassQna;
import bitcamp.java110.cms.domain.Classes;
import bitcamp.java110.cms.domain.Cs;
import bitcamp.java110.cms.domain.Mentee;
import bitcamp.java110.cms.domain.Mentor;
import bitcamp.java110.cms.domain.MentorTag;
import bitcamp.java110.cms.domain.Product;
import bitcamp.java110.cms.domain.ProductOrder;
import bitcamp.java110.cms.domain.ProductQnA;
import bitcamp.java110.cms.service.BigTagService;
import bitcamp.java110.cms.service.CertService;
import bitcamp.java110.cms.service.ClassOrderService;
import bitcamp.java110.cms.service.ClassQnaService;
import bitcamp.java110.cms.service.ClassService;
import bitcamp.java110.cms.service.CsService;
import bitcamp.java110.cms.service.MenteeService;
import bitcamp.java110.cms.service.MentoTagService;
import bitcamp.java110.cms.service.MentorService;
import bitcamp.java110.cms.service.ProductOrderService;
import bitcamp.java110.cms.service.ProductQnAService;
import bitcamp.java110.cms.service.ProductService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

  MenteeService menteeService;
  MentorService mentorService;
  CsService csService;
  ClassQnaService classQnaService;
  ProductQnAService productQnAService;
  ClassOrderService classOrderService;
  ProductOrderService productOrderSerivce;
  ClassService classService;
  ProductService productService;
  CertService certService;
  BigTagService bigTagService;
  MentoTagService mentoTagService;
  ServletContext sc;
  

  public MypageController(
      MenteeService menteeService,
      MentorService mentorService,
      CsService csService,
      ClassQnaService classQnaService,
      ProductQnAService productQnAService,
      ClassOrderService classOrderService,
      ProductOrderService productOrderService,
      ClassService classService,
      ProductService productService,
      CertService certService,
      BigTagService bigTagService,
      MentoTagService mentoTagService,
    ServletContext sc) {
   this.menteeService = menteeService;
   this.mentorService = mentorService;
   this.csService = csService;
   this.classQnaService = classQnaService;
   this.productQnAService = productQnAService;
   this.classOrderService = classOrderService;
   this.productOrderSerivce = productOrderService;
   this.classService = classService;
   this.productService = productService;
   this.certService = certService;
   this.bigTagService = bigTagService;
   this.mentoTagService = mentoTagService;
   this.sc = sc ;
   
   
  }
  
  @GetMapping("mypage")
  public void mypage(Model model,HttpSession session) {
    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    model.addAttribute("mentee", mentee);
    
    Mentor mentor = mentorService.get(mentee.getNo());
    model.addAttribute("mentor", mentor);
    
    
  }
  
  @GetMapping("menu1")
  public void menu1(Model model,HttpSession session) {
    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    
    model.addAttribute("mentee", mentee);

  }
  
  
  
  @RequestMapping(value = "imgupload", method=RequestMethod.POST)
  public String  imgupload(@RequestParam("fileUpload1") List<MultipartFile> files,
      @RequestParam("fileUpload2") List<MultipartFile> files2,
      @RequestParam("no") int noin,
      @RequestParam("carrin") String carrin, 
      @RequestParam("btno") int btnoin,
      Mentor mentor, MentorTag mentorTag) throws Exception {
    
      // string 에서 int값만 뽑아서  을 int type으로 변환
      String str1 = carrin;
      String str3 = new String();
    
    
      for(int i = 0 ; i < str1.length(); i ++)
      {    
        if(48 <= str1.charAt(i) && str1.charAt(i) <= 57)
            str3 += str1.charAt(i);
      }
    
      int newCarr = Integer.parseInt(str3);
      // string 에서 int값만 뽑아서  을 int type으로 변환
    
      mentorTag.setMono(noin);
      mentorTag.setBtno(btnoin);
      
      mentor.setNo(noin);
      mentor.setCarr(newCarr);
    
      mentorService.add(mentor);
      mentoTagService.add(mentorTag);
      
    


 

      

        
    for(MultipartFile file : files) {
      if(file.getOriginalFilename().length() > 2 ) {
        
        String filename = UUID.randomUUID().toString();
        file.transferTo(new File(sc.getRealPath("/upload/img/meto_file/" + filename+".png")));
       
      } 
    }
    
    for(MultipartFile file : files2) {
      if(file.getOriginalFilename().length() > 2 ) {
        
        String filename = UUID.randomUUID().toString();
        file.transferTo(new File(sc.getRealPath("/upload/img/meto_licn/" + filename+".png")));
       
      } 
    }
    
    return "redirect:mypage";
  }

  
/*  
  @RequestMapping(value = "mentorInsert.do", method = {RequestMethod.POST})
  public @ResponseBody int add(Mentor mentor,HttpSession session) {
    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    
    mentee.getNo()
    
    return mentorService.add(mentor);
  }

    */  
    
    
  @RequestMapping(value = "updateProfile.do", method = {RequestMethod.POST})
  public @ResponseBody int updateProfile(Mentee mentee) {
    
    return menteeService.updateProfile(mentee);
  }
  
  @RequestMapping(value = "updatePwd.do", method = {RequestMethod.POST})
  public @ResponseBody int updatePwd(Mentee mentee) {
    
    return menteeService.updatePwd(mentee);
  }
  
  @RequestMapping(value = "updatePhone.do", method = {RequestMethod.POST})
  public @ResponseBody int updatePhone(Mentee mentee) {
    
    return menteeService.updatePhone(mentee);
  }
  
  @RequestMapping(value = "updateAddr.do", method = {RequestMethod.POST})
  public @ResponseBody int updateAddr(Mentee mentee) {
    
    return menteeService.updateAddr(mentee);
  }
  
  
  
  @GetMapping("menu2")
  public void menu2(Model model,HttpSession session) {

    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<ClassOrder> colist = classOrderService.listByMeno(4,10,mentee.getNo());
    model.addAttribute("colist", colist );
    
  }
  
  
  @GetMapping("menu3-1")
  public void menu3_1(Model model,HttpSession session) {
    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<ClassOrder> colist = classOrderService.listByMeno(4,10,mentee.getNo());
    model.addAttribute("colist", colist );
 }
  
  @GetMapping("menu3-2")
  public void menu3_2(Model model,HttpSession session) {
    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<ProductOrder> polist = productOrderSerivce.listByMeno(4,10,mentee.getNo());
    model.addAttribute("polist", polist );
    
  }
  
  @GetMapping("menu4-1")
  public void menu4_1(Model model,HttpSession session) {
    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<Cs> cslist = csService.list(4,10,mentee.getNo());
    
    model.addAttribute("cslist",cslist);
    
    
    
  }
  
  @GetMapping("menu4-2")
  public void menu4_2(Model model,HttpSession session) {
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<ClassQna> cqlist = classQnaService.classqnalist(4,10,mentee.getNo());
    model.addAttribute("cqlist", cqlist );
    
  }
  
  @GetMapping("menu4-3")
  public void menu4_3(Model model,HttpSession session) {
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<ClassQna> cqlist2 = classQnaService.classqnalist2(4,10,mentee.getNo());
    model.addAttribute("cqlist2", cqlist2 );
    
  }
  
  @GetMapping("menu4-4")
  public void menu4_4(Model model,HttpSession session) {
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<ProductQnA> pqlist = productQnAService.listByMeno(4,10,mentee.getNo());
    model.addAttribute("pqlist", pqlist );
    
  }
  
  @GetMapping("menu4-5")
  public void menu4_5(Model model,HttpSession session) {
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<ProductQnA> pqlist2 = productQnAService.listByMeno2(4,10,mentee.getNo());
    model.addAttribute("pqlist2", pqlist2 );
  }
  
  @GetMapping("menu5")
  public void menu5(Model model,HttpSession session) { 
    
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<Classes> cmanage = classService.manageByMono(mentee.getNo());
    model.addAttribute("cmanage",cmanage);
    
    
 /*   List<Classes> cm = classService.manageByCno(cno);
    
    model.addAttribute("cm", cm);*/
        
  }
  
  @RequestMapping(value = "insertCert.do", method = {RequestMethod.POST})
  public @ResponseBody int insertCert(Cert cert) {
    
    return certService.insertCert(cert);
  }
  
 
  
  @GetMapping("menu5disable")
  public void menu5disable(Model model) { 

  }
  
  @GetMapping("menu5disable2")
  public void menu5disable2(Model model) { 

  }
  
  
  @GetMapping("menu6")
  public void menu6(Model model,HttpSession session) {
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<Product> pmanage = productService.listBySeller(1,10,mentee.getNo());
    model.addAttribute("pmanage", pmanage );
    
  }
  
  
  @RequestMapping(value="menu6buyer", method = {RequestMethod.GET, RequestMethod.POST})
  public void menu6buyer(Model model,int ptno) {
    System.out.println(ptno);
    
    List<Product> pmanage2 = productService.listBySeller2(1,10,ptno);
    model.addAttribute("pmanage2", pmanage2 );
       
  }
  
 /* @GetMapping("menu6buyer")
  public void menu6buyer(Model model,HttpSession session) {
    Mentee mentee = (Mentee) session.getAttribute("loginUser");
    List<Product> pmanage = productService.listBySeller(1,10,mentee.getNo());
    
    int i = 0;
    for(Product p: pmanage) {
    System.out.println(p.getNo());
    
    i++;
    
    List<Product> pmanage2i= productService.listBySeller2(1,10,p.getNo());
    
    model.addAttribute("pmanage2"+i, pmanage2i ); 
    }
   
  }*/
  
  
  @RequestMapping(value = "getMenteeList.do", method = {RequestMethod.POST})
  public @ResponseBody List<Classes> getMenteeList(int cno) {
    
    
    return classService.manageByCno(cno);
  }
  
/*  @RequestMapping(value = "buyerList.do", method = {RequestMethod.POST})
  public @ResponseBody List<Product> buyerList(int ptno) {
    
    return productService.listBySeller2(1, 10, ptno);
  }*/
  

  
  
}





