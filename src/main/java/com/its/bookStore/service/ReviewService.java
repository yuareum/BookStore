package com.its.bookStore.service;

import com.its.bookStore.dto.ReviewDTO;
import com.its.bookStore.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepository reviewRepository;

    public void save(ReviewDTO reviewDTO) {
        reviewRepository.save(reviewDTO);
    }
    public List<ReviewDTO> findAll(Long bookId) {
        return reviewRepository.findAll(bookId);
    }
}
