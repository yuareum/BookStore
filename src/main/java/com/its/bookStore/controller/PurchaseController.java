package com.its.bookStore.controller;

import com.its.bookStore.dto.BookDTO;
import com.its.bookStore.service.BookService;
import com.its.bookStore.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private BookService bookService;
    @GetMapping("/save")
    public String saveForm(@RequestParam("purchaseBookId") Long purchaseBookId, Model model){
        BookDTO bookDTO = bookService.findById(purchaseBookId);
        model.addAttribute("book", bookDTO);
        return "purchase/save";
    }
}
