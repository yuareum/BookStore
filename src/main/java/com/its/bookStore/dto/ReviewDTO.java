package com.its.bookStore.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReviewDTO {
    private Long id;
    private Long bookId;
    private String reviewWriter;
    private String reviewContents;
    private Timestamp reviewCreatedDate;
}
