package bitcamp.java110.cms.web;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.java110.cms.domain.Classes;
import bitcamp.java110.cms.domain.Mentee;
import bitcamp.java110.cms.domain.Mentor;
import bitcamp.java110.cms.domain.Product;
import bitcamp.java110.cms.domain.ProductQnA;
import bitcamp.java110.cms.service.BigTagService;
import bitcamp.java110.cms.service.ClassService;
import bitcamp.java110.cms.service.MenteeService;
import bitcamp.java110.cms.service.MentorFileService;
import bitcamp.java110.cms.service.MentorLicenseService;
import bitcamp.java110.cms.service.MentorService;
import bitcamp.java110.cms.service.ProductPopulService;
import bitcamp.java110.cms.service.ProductService;

@Controller
@RequestMapping("/master")
public class MasterController {

  MenteeService menteeService;
  MentorService mentorService;
  ProductService productService;
  ProductPopulService productPopulService;
  ClassService classService;
  
  BigTagService bigTagService;
  MentorFileService mentorFileService;
  MentorLicenseService mentorlicenseService;

  public MasterController(
      ProductService productService,
      ProductPopulService productPopulService,
      ClassService classService,
      MenteeService menteeService,
      MentorService mentorService,
      MentorFileService mentorFileService,
      MentorLicenseService mentorlicenseService,
      BigTagService bigTagService
      ) {

    this.productService = productService;
    this.productPopulService = productPopulService;
    this.classService = classService;
    this.menteeService = menteeService;
    this.mentorService = mentorService;
    this.mentorFileService = mentorFileService;
    this.mentorlicenseService = mentorlicenseService;
    this.bigTagService = bigTagService;
  }

  @GetMapping("prdtlist")
  public void prdt(Model model) {
    List<Product> productList = productService.list();
    model.addAttribute("productList", productList);
  }
  
  /*
   * 멘토신청목록 관련
  */
  
  @RequestMapping(value = "mtstat.do", method = { RequestMethod.GET, RequestMethod.POST})
  public @ResponseBody int mtstat(int meno,char stat) {
    Mentee mentee = menteeService.get(meno);
    mentee.setMtstat(stat);
    return menteeService.updateMtstat(mentee);
  }

  @GetMapping("mentorreqlist")
  public void mentorlist(Model model) {
    List<Mentor> MentorRequestList = mentorService.listByMetoStat();
    for(Mentor m : MentorRequestList) {
      m.setMentorFile(mentorFileService.get(m.getNo()));
      m.setMentorLicense(mentorlicenseService.get(m.getNo()));
      m.setMentorTag(bigTagService.listByMono(m.getNo()));
    }
    model.addAttribute("MentorRequestList", MentorRequestList);
  }
  
  /*
   * 클래스신청목록 관련
  */
  
  @GetMapping("classlist")
  public void classlist(Model model) {
    List<Classes> ClassRequestList = classService.listByStat("I");

    model.addAttribute("ClassRequestList", ClassRequestList);
  }
  
  /*
   * Request 예제 (추후 삭제)
  */
  @RequestMapping(value = "addqna", method = RequestMethod.POST)
  public String addqna(String type, String titl, String conts) {
    ProductQnA pqna = new ProductQnA();
    pqna.setTitl(titl);
    pqna.setConts(conts);
    pqna.setType(type);
    pqna.setMeno(5);
    pqna.setPtno(5);

    return "redirect:./prdtQna";
  }

}

