package com.its.bookStore.controller;

import com.its.bookStore.dto.BookDTO;
import com.its.bookStore.dto.MemberDTO;
import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.service.BookService;
import com.its.bookStore.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/save")
    public String saveForm(){
        return "/book/save";
    }

    @PostMapping("/save")
    public String save(BookDTO bookDTO) throws IOException {
        boolean saveResult = bookService.save(bookDTO);
        if(saveResult){
            return "redirect:/book/findAll";
        }
        else{
            return "saveFail";
        }
    }
    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model){
        List<BookDTO> bookList = bookService.findAll(page);
        PageDTO paging = bookService.paging(page);
        model.addAttribute("bookList", bookList);
        model.addAttribute("paging", paging);
        return "book/list";
    }
}
