package t3h.vn.k34_dl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class StudentController {

//    @GetMapping("students")
//    public String GetListStudent(Model model, HttpServletRequest req, HttpServletResponse res) throws IOException, SQLException {
//        try {
//            Pager pager = new Pager("students");
//            int limit = 8;
//            int page = Integer.parseInt(req.getParameter("page"));
//            model.addAttribute("current_page", page);
//            req.setAttribute("total_page", pager.get_total_page(limit));
//            req.setAttribute("table_data", model.GetAllByPage(page, limit));
//            return "/WEB-INF/students/index.jsp"l
//        } catch (Exception e) {
//            this.responseErr(e, req, res, true);
//        }
//    }
}
