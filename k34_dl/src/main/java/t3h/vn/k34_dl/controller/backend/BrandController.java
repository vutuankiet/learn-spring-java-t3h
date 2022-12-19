package t3h.vn.k34_dl.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import t3h.vn.k34_dl.dto.UserDto;

@Controller
@RequestMapping("/backend/brand")
public class BrandController {
    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "brand/create";
    }
}
