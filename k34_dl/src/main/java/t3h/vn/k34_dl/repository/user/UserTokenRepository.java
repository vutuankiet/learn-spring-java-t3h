package t3h.vn.k34_dl.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;
import t3h.vn.k34_dl.entities.UserTokenEntity;

public interface UserTokenRepository extends JpaRepository<UserTokenEntity, Long> {

    UserTokenEntity findFirstByEmailAndType(String email, Integer type);
}
