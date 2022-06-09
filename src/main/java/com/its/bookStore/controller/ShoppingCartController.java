package com.its.bookStore.controller;

import com.its.bookStore.dto.ShoppingCartDTO;
import com.its.bookStore.service.ShoppingCartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
    @Autowired
    private ShoppingCartService shoppingCartService;

    @PostMapping("/save")
    public @ResponseBody List<ShoppingCartDTO> save(@ModelAttribute ShoppingCartDTO shoppingCartDTO){
        shoppingCartService.save(shoppingCartDTO);
        List<ShoppingCartDTO> shoppingCartDTOList = shoppingCartService.findAll(shoppingCartDTO.getShoppingCartBookId());
        return shoppingCartDTOList;
    }

    @GetMapping ("/findByMemberId")
    public String shoppingCartList(@RequestParam("shoppingCartMemberId") String shoppingCartMemberId, Model model){
        List<ShoppingCartDTO> shoppingCartDTOList = shoppingCartService.findByMemberId(shoppingCartMemberId);
        model.addAttribute("shoppingCartList", shoppingCartDTOList);
        return "shoppingCart/shoppingCartList";
    }

    @PostMapping("/delete")
    public @ResponseBody String delete(@RequestParam("id") Long id){
        shoppingCartService.delete(id);
        return "delete";
    }
}
