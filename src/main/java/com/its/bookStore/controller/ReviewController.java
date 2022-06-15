package com.its.bookStore.controller;

import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.dto.PurchaseDTO;
import com.its.bookStore.dto.ReviewDTO;
import com.its.bookStore.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("save")
    public @ResponseBody List<ReviewDTO> save(@ModelAttribute ReviewDTO reviewDTO){
        reviewService.save(reviewDTO);
        List<ReviewDTO> reviewDTOList = reviewService.findAll(reviewDTO.getBookId());
        return reviewDTOList;
    }

}
