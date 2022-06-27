package com.its.bookStore.controller;

import com.its.bookStore.dto.BookDTO;
import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.dto.ReviewDTO;
import com.its.bookStore.service.BookService;
import com.its.bookStore.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
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
        return "book/save";
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
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model){
        BookDTO bookDTO = bookService.findById(id);
        model.addAttribute("book", bookDTO);
        List<ReviewDTO> reviewDTOList = reviewService.findAll(id);
        model.addAttribute("reviewList", reviewDTOList);
        return "book/detail";
    }

    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType,
                         @RequestParam("q") String q, Model model) {
        List<BookDTO> searchList = bookService.search(searchType, q);
        model.addAttribute("searchList", searchList);
        return "book/searchList";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BookDTO bookDTO = bookService.findById(id);
        model.addAttribute("updateBook", bookDTO);
        return "book/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute BookDTO bookDTO) throws IOException {
        bookService.update(bookDTO);
        return "redirect:/book/detail?id=" + bookDTO.getId();
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        bookService.delete(id);
        return "redirect:/book/findAll";
    }

    @PostMapping("/bookCountsUpdate")
    public @ResponseBody int bookCountsUpdate(@ModelAttribute BookDTO bookDTO){
        int bookCountsUpdateResult =bookService.bookCountsUpdate(bookDTO);
        return bookCountsUpdateResult;
    }

}
