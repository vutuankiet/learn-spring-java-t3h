package t3h.vn.k34_dl.service;

import org.springframework.stereotype.Service;
import t3h.vn.k34_dl.dto.SachDto;
import t3h.vn.k34_dl.utils.DbUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class SachService {

    public void save(SachDto sachDto) throws Exception{
        Connection con = DbUtils.getCollection();
        Statement sqlFile = con.createStatement();
        try {
            // Bước 3: Tạo câu truy vấn
            String selectSql = "INSERT INTO sach (NAME, AUTHOR) VALUES ('"+ sachDto.getName() + "','" +  sachDto.getAuthor() + "') ";
            // Bước 4; Run kết quả
            sqlFile.execute(selectSql);
        } finally {
            // Bước 5: Đóng kết nối
            sqlFile.close();
            con.close();
        }
    }

    public List<SachDto> list () throws Exception {
        List<SachDto> sachDtoList = new ArrayList<>();
        Connection conn = DbUtils.getCollection();
        Statement sqlFile = conn.createStatement();
        try {
            String selectSql = "Select * from sach";
            ResultSet resultSet = sqlFile.executeQuery(selectSql);
            while (resultSet.next()) {
                sachDtoList.add(new SachDto(resultSet.getLong("ID"),
                        resultSet.getString("NAME"),
                        resultSet.getString("AUTHOR")));
            }
            resultSet.close();
        } finally {
            sqlFile.close();
            conn.close();
        }
        return sachDtoList;
    }
}
