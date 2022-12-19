package t3h.vn.k34_dl.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import t3h.vn.k34_dl.dao.UserDAO;
import t3h.vn.k34_dl.dto.ChangePasswordDto;
import t3h.vn.k34_dl.dto.ResponseDataTableDto;
import t3h.vn.k34_dl.dto.ResponseDto;
import t3h.vn.k34_dl.dto.UserDto;
import t3h.vn.k34_dl.entities.UserEntity;
import t3h.vn.k34_dl.entities.UserTokenEntity;
import t3h.vn.k34_dl.repository.user.UserRepository;
import t3h.vn.k34_dl.repository.user.UserTokenRepository;
import t3h.vn.k34_dl.service.email.EmailDetails;
import t3h.vn.k34_dl.service.email.EmailService;
import t3h.vn.k34_dl.utils.Constant;
import t3h.vn.k34_dl.utils.UserTypeEnum;

import java.sql.Timestamp;
import java.util.UUID;

@Service
public class UserService {

    @Autowired
    UserDAO userDAO;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserTokenRepository userTokenRepository;

    @Autowired
    EmailService emailService;

    public void save(UserDto userDto) throws Exception {
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userDto, userEntity);
        userEntity.setPassword(passwordEncoder.encode(userDto.getPassword()));
//        userDAO.save(userDto);

        userRepository.save(userEntity);
    }

    public ResponseDto changePassword(ChangePasswordDto userDto) {
        // chuyển từ dto sang entity
        UserEntity userEntity = userRepository.findById(((UserEntity) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal()).getId()).get();
        if (!passwordEncoder.matches(userDto.getOldPassword(), userEntity.getPassword())) {
            return new ResponseDto(Constant.CODE_ERROR, "Mật khẩu không khớp");
        }
        userEntity.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(userEntity);
        return new ResponseDto(Constant.CODE_SUCCESS, "Đổi mật khẩu thành công");
    }

    public void list(ResponseDataTableDto dataTableDto) throws Exception {
        dataTableDto.list(userRepository);
    }

    public ResponseDto forgetPassword(String email) {
        UserEntity userEntity = userRepository.findFirstByEmail(email);
        if (userEntity == null) {
            return new ResponseDto(Constant.CODE_ERROR, "Tài khoản không tồn tại");
        }

        String token = UUID.randomUUID().toString();

        UserTokenEntity userTokenEntity =  userTokenRepository.findFirstByEmailAndType(email, UserTypeEnum.FORGET_PASSWORD.ordinal());
        if (userTokenEntity == null) userTokenEntity = new UserTokenEntity();
        userTokenEntity.setEmail(email);
        userTokenEntity.setUserId(userEntity.getId());
        userTokenEntity.setToken(token);
        userTokenEntity.setType(UserTypeEnum.FORGET_PASSWORD.ordinal());
        userTokenEntity.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        userTokenRepository.save(userTokenEntity);

        EmailDetails emailDetails = new EmailDetails();
        emailDetails.setRecipient(email);
        emailDetails.setSubject("[Bảo mật]XÁC NHẬN THAY ĐỔI MẬT KHẨU");
        emailDetails.setMsgBody(String.format("Token sử dụng để xác nhận mật khẩu là %s\n" +
                "Vào đường link http://localhost:8080/user-verify để xác nhận mật khẩu\n Token có hiệu lực 3 phút", token));
        emailService.sendSimpleMail(emailDetails);
        return new ResponseDto(Constant.CODE_SUCCESS, "Gưi xác nhận thành công");
    }

    public ResponseDto verifyForgetPassword(ChangePasswordDto changePasswordDto) {
        UserTokenEntity userTokenEntity = userTokenRepository.findFirstByEmailAndType(changePasswordDto.getEmail(), UserTypeEnum.FORGET_PASSWORD.ordinal());
        if (userTokenEntity == null) {
            return new ResponseDto(Constant.CODE_ERROR, "Tài khoản không tồn tại");
        }

        if (!userTokenEntity.getToken().equalsIgnoreCase(changePasswordDto.getToken().trim()))
            return new ResponseDto(Constant.CODE_ERROR, "Token không đúng");

        if (System.currentTimeMillis() - 180_000L > userTokenEntity.getCreatedTime().getTime()) {
            return new ResponseDto(Constant.CODE_ERROR, "Thời gian hết hiệu lực");
        }

        UserEntity entity = userRepository.findFirstByEmail(changePasswordDto.getEmail());
        entity.setPassword(passwordEncoder.encode(changePasswordDto.getPassword()));
        userTokenRepository.deleteById(userTokenEntity.getId());
        return new ResponseDto(Constant.CODE_SUCCESS, "Đổi mật khẩu thành công");
    }

}
