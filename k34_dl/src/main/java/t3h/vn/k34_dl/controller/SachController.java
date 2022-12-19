package t3h.vn.k34_dl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import t3h.vn.k34_dl.dto.SachDto;
import t3h.vn.k34_dl.service.SachService;

@Controller
@RequestMapping("sach")
public class SachController {

    @Autowired
    SachService sachService;

    @GetMapping("create")
    public String create(Model model) {
        return "sach/create";
    }
    @PostMapping(value = "save", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String save(SachDto sachDto, RedirectAttributes model) {
        model.addFlashAttribute("message", "Tạo mới thành công");
        try {
            sachService.save(sachDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/sach/create";
    }


    @GetMapping("list")
    public String list(Model model) throws Exception {
        model.addAttribute("list", sachService.list());
        return "sach/list";
    }
}
