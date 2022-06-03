package com.its.bookStore.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class BookDTO {
    private Long id;
    private int bookCounts;
    private String bookTitle;
    private String bookAdmin;
    private String bookWriter;
    private String bookPublisher;
    private String bookPublicationDate;
    private String bookIntroduceContents;
    private int bookPrice;
    private Timestamp bookCreatedDate;
    private MultipartFile bookFile;
    private String bookFileName;
}
