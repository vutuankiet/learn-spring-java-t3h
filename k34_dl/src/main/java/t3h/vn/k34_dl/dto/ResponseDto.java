package t3h.vn.k34_dl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.method.support.ModelAndViewContainer;
import t3h.vn.k34_dl.dao.PagingDAO;
import t3h.vn.k34_dl.repository.SearchingRepository;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseDto {
    int code;
    String message;

}
