package t3h.vn.k34_dl.dto;

import lombok.Data;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.method.support.ModelAndViewContainer;
import t3h.vn.k34_dl.dao.PagingDAO;
import t3h.vn.k34_dl.repository.SearchingRepository;

import java.util.List;

@Data
public class ResponseDataTableDto {
    String path;
    Integer page;
    Integer perpage;
    Integer numberPage;
    Integer total;
    List<?> data;
    String key;
    ModelAndViewContainer model;

    public ResponseDataTableDto(String path, Integer page, Integer perpage, String key, ModelAndViewContainer model) {
        this.path = path;
        this.page = page;
        this.perpage = perpage;
        this.model = model;
        this.key = key;
    }

    public void list(PagingDAO dao) throws Exception {
        this.setData(dao.list(page, perpage));
        int total = dao.count();
        this.setTotal(total);
        this.setNumberPage((int) Math.ceil((double) total / perpage));
        model.addAttribute("list", this);
    }
    public void list(JpaRepository repository) throws Exception {
        Pageable pageable = PageRequest.of(page - 1, perpage);
        Page<?> pages = repository.findAll(pageable);
        this.setData(pages.getContent());
        long total = pages.getTotalElements();
        this.setTotal((int)total);
        this.setNumberPage((int) Math.ceil((double) total / perpage));
        model.addAttribute("list", this);
    }

    public void list(SearchingRepository repository) throws Exception {
        Pageable pageable = PageRequest.of(page - 1, perpage);
        Page<?> pages = repository.findAll(key, pageable);
        this.setData(pages.getContent());
        long total = pages.getTotalElements();
        this.setTotal((int)total);
        this.setNumberPage((int) Math.ceil((double) total / perpage));
        model.addAttribute("list", this);
    }


}
