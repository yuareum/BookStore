package com.its.bookStore.service;

import com.its.bookStore.dto.ShoppingCartDTO;
import com.its.bookStore.repository.ShoppingCartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingCartService {
    @Autowired
    private ShoppingCartRepository shoppingCartRepository;
    public List<ShoppingCartDTO> findByMemberId(String shoppingCartMemberId) {
        return shoppingCartRepository.findByMemberId(shoppingCartMemberId);
    }

    public void save(ShoppingCartDTO shoppingCartDTO) {
        shoppingCartRepository.save(shoppingCartDTO);
    }

    public List<ShoppingCartDTO> findAll(Long shoppingCartBookId) {
        return shoppingCartRepository.findAll(shoppingCartBookId);
    }
}
