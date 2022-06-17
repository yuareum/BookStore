package com.its.bookStore.controller;

import com.its.bookStore.dto.BookDTO;
import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.dto.PurchaseDTO;
import com.its.bookStore.service.BookService;
import com.its.bookStore.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

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
    @PostMapping("/save")
    public String save(@ModelAttribute PurchaseDTO purchaseDTO){
        boolean saveResult = purchaseService.save(purchaseDTO);
        if(saveResult){
            return "redirect:/purchase/findByMemberId?purchaseMemberId=" + purchaseDTO.getPurchaseMemberId();
        }
        else{
            return "purchaseFail";
        }

    }
    @GetMapping("/findByMemberId")
    public String findByMemberId(@RequestParam("purchaseMemberId") String purchaseMemberId, Model model){
        List<PurchaseDTO> purchaseDTOList = purchaseService.findByMemberId(purchaseMemberId);
        model.addAttribute("purchaseList", purchaseDTOList);
        return "purchase/purchaseList";
    }

    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model){
        List<PurchaseDTO> purchaseDTOList = purchaseService.findAll(page);
        PageDTO paging = purchaseService.paging(page);
        model.addAttribute("purchaseList", purchaseDTOList);
        model.addAttribute("paging", paging);
        return "purchase/list";
    }

    @PostMapping("/check")
    public @ResponseBody int purchaseCheck(@ModelAttribute PurchaseDTO purchaseDTO){
        int purchaseCheck = purchaseService.purchaseCheck(purchaseDTO);
        return purchaseCheck;
    }

    @GetMapping("detail")
    public String detail (@RequestParam("id") Long id, Model model){
        PurchaseDTO purchaseDTO = purchaseService.findById(id);
        model.addAttribute("purchase",purchaseDTO);
        return "purchase/detail";
    }
}
