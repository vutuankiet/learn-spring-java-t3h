package t3h.vn.k34_dl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloController {

    @GetMapping(value = {"/hello/{id}"})
    public String hello(@PathVariable String id,
                        @RequestParam(required = false) String name,
                        Model model){
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        return "hello";
    }
}
