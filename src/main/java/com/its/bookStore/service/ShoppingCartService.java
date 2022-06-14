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

    public int save(ShoppingCartDTO shoppingCartDTO) {
        int shoppingCartResult = shoppingCartRepository.save(shoppingCartDTO);
        if(shoppingCartResult>0){
            return 1;
        }
        else {
            return 0;
        }
    }

    public List<ShoppingCartDTO> findAll(Long shoppingCartBookId, int page) {
        return shoppingCartRepository.findAll(shoppingCartBookId);
    }
    public void delete(Long id) {
        shoppingCartRepository.delete(id);
    }

    public boolean shoppingCartCheck(ShoppingCartDTO shoppingCartDTO) {
        ShoppingCartDTO shoppingCart = shoppingCartRepository.shoppingCartCheck(shoppingCartDTO);
        if(shoppingCart == null){
            return true;
        }
        else{
            return false;
        }
    }
}
