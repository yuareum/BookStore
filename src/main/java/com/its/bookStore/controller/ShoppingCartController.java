package com.its.bookStore.controller;
import com.its.bookStore.dto.ShoppingCartDTO;
import com.its.bookStore.service.ShoppingCartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
    @Autowired
    private ShoppingCartService shoppingCartService;

    @PostMapping("/save")
    public @ResponseBody int save(@ModelAttribute ShoppingCartDTO shoppingCartDTO){
        int shoppingCartCheck = shoppingCartService.shoppingCartCheck(shoppingCartDTO);
        if(shoppingCartCheck == 1){
            int saveResult = shoppingCartService.save(shoppingCartDTO);
            return saveResult;
        }
        else {
            return 0;
        }
    }

    @GetMapping ("/findByMemberId")
    public String shoppingCartList(@RequestParam("shoppingCartMemberId") String shoppingCartMemberId, Model model){
        List<ShoppingCartDTO> shoppingCartDTOList = shoppingCartService.findByMemberId(shoppingCartMemberId);
        if(shoppingCartMemberId == "admin"){
            return "index";
        }
        else {
            model.addAttribute("shoppingCartList", shoppingCartDTOList);
            return "shoppingCart/list";
        }
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, HttpSession session){
        shoppingCartService.delete(id);
        String loginMemberId = (String) session.getAttribute("loginMemberId");
        return "redirect:/shoppingCart/findByMemberId?shoppingCartMemberId="+ loginMemberId;
    }
}
