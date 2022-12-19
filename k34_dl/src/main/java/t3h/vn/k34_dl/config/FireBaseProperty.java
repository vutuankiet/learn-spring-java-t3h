package t3h.vn.k34_dl.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "firebase")
public class FireBaseProperty {

    private String bucketName;

    private String imageUrl;
}
