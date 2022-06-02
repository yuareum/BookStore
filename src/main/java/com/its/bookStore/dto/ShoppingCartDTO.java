package com.its.bookStore.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class ShoppingCartDTO {
    private Long id;
    private Long shoppingCartBookId;
    private String shoppingCartMemberId;
    private Long shoppingCartBookPrice;
    private Timestamp shoppingCartCreatedDate;
    private MultipartFile shoppingCartBookFile;
    private String shoppingCartBookFileName;
}
