package com.its.bookStore.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class PurchaseDTO {
    private Long id;
    private Long purchaseBookId;
    private int purchaseBookCounts;
    private String purchaseMemberId;
    private String purchaseBookTitle;
    private Long purchaseBookPrice;
    private Long purchaseTotalPrice;
    private Long purchasePrice;
    private String purchaseAddress;
    private String purchaseMobile;
    private Timestamp purchaseCreatedDate;
    private MultipartFile purchaseBookFile;
    private String purchaseBookFileName;
}
