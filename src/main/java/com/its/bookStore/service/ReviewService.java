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

    public boolean save(ReviewDTO reviewDTO) {
        int saveResult = reviewRepository.save(reviewDTO);
        if(saveResult > 0){
            return true;
        }
        else{
            return false;
        }
    }
    public List<ReviewDTO> findAll(Long bookId) {
        return reviewRepository.findAll(bookId);
    }

    public ReviewDTO findById(Long id) {
        return reviewRepository.findById(id);
    }
}
