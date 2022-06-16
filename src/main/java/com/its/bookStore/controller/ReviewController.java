package com.its.bookStore.controller;

import com.its.bookStore.dto.BookDTO;
import com.its.bookStore.dto.ReviewDTO;
import com.its.bookStore.service.BookService;
import com.its.bookStore.service.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private BookService bookService;
    @GetMapping("/save")
    public String saveForm(@RequestParam("bookId") Long bookId, Model model) {
        BookDTO bookDTO = bookService.findById(bookId);
        model.addAttribute("book", bookDTO);
        return "review/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ReviewDTO reviewDTO){
        boolean saveResult = reviewService.save(reviewDTO);
        if(saveResult){
            return "redirect:/book/detail?id=" + reviewDTO.getBookId();
        }
        else{
            return "saveFail";
        }
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id,Model model){
        ReviewDTO reviewDTO = reviewService.findById(id);
        model.addAttribute("review", reviewDTO);
        return "/review/detail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        ReviewDTO reviewDTO = reviewService.findById(id);
        model.addAttribute("reviewUpdate", reviewDTO);
        return "/review/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute ReviewDTO reviewDTO){
        reviewService.update(reviewDTO);
        return "/review/detail?id=" + reviewDTO.getId();
    }
}
