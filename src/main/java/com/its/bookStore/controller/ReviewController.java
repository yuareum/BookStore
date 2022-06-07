package com.its.bookStore.controller;

import com.its.bookStore.dto.ReviewDTO;
import com.its.bookStore.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @PostMapping("/save")
    public @ResponseBody List<ReviewDTO> save(@ModelAttribute ReviewDTO reviewDTO){
        System.out.println("reviewDTO" + reviewDTO);
        reviewService.save(reviewDTO);
        List<ReviewDTO> reviewDTOList = reviewService.findAll(reviewDTO.getBookId());
        return reviewDTOList;
    }
}
