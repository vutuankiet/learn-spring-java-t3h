package t3h.vn.k34_dl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Data
@NoArgsConstructor
public class UserDto {
    Long id;
    @NotEmpty(message = "Không được để trống trường email")
    @Email(message = "Định dạng email")
    String email;
    String fullName;
    String address;
    String role;
    @NotEmpty(message = "Không được để trống trường mật khẩu")
    String password;
    @NotEmpty(message = "Không được để trống trường Nhập lại mạt khẩu")
    String rePassword;

    String avatar;
    MultipartFile fileImage;
}
