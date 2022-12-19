package t3h.vn.k34_dl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import t3h.vn.k34_dl.config.language.MessageConfig;
import t3h.vn.k34_dl.dto.ChangePasswordDto;
import t3h.vn.k34_dl.dto.ResponseDto;
import t3h.vn.k34_dl.service.UserService;

@Controller
public class HomeController {
    @Autowired
    MessageConfig messageConfig;

    @Autowired
    UserService userService;

    @GetMapping(value = {"home", "", "/"})
    public String home(Model model) {
        return "home";
    }

    @GetMapping("login")
    public String login(Model model, @RequestParam(required = false) String error) {
        if (error != null) model.addAttribute("message", messageConfig.getMessage(error));
        return "backend/login";
    }

    @GetMapping("forget-password")
    public String forgetPassword(Model model) {
        return "backend/forget-password";
    }

    @PostMapping(value = "forget-password")
    public String forgetPasswordForm(Model model, @RequestParam String email) {
        ResponseDto responseDto = userService.forgetPassword(email);
        model.addAttribute("message", responseDto.getMessage());
        return "backend/forget-password";
    }

    @GetMapping(value = "user-verify")
    public String userVerify(Model model) {
        model.addAttribute("user", new ChangePasswordDto());
        return "backend/user-verify";
    }

    @PostMapping(value = "user-verify", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String createform(ChangePasswordDto userDto,
                             RedirectAttributes redirectAttributes, Model model) throws Exception {
        ResponseDto result = userService.verifyForgetPassword(userDto);
        model.addAttribute("message", result.getMessage());
        return "backend/user-verify";
    }

//
//    @GetMapping(value = "user-active/{token}")
//    public String userActive(RedirectAttributes model, @PathVariable String token, @RequestParam String email){
//        ResponseDto responseDto = userService.userActive(token, email);
//        model.addFlashAttribute("message", responseDto.getMessage());
//        return "redirect:/login";
//    }
}
