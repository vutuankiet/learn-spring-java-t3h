package t3h.vn.k34_dl.dto;

import lombok.Data;

@Data
public class ChangePasswordDto {
    String oldPassword;
    String password;
    String rePassword;
    String token;
    String email;
}
