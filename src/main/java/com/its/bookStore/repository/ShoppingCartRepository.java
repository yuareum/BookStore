package com.its.bookStore.repository;

import com.its.bookStore.dto.ShoppingCartDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShoppingCartRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<ShoppingCartDTO> findByMemberId(String shoppingCartMemberId) {
        return sql.selectList("ShoppingCart.findByMemberId", shoppingCartMemberId);
    }

    public int save(ShoppingCartDTO shoppingCartDTO) {
        return sql.insert("ShoppingCart.save", shoppingCartDTO);
    }

    public List<ShoppingCartDTO> findAll(Long shoppingCartBookId) {
        return sql.selectList("ShoppingCart.findAll", shoppingCartBookId);
    }

    public void delete(Long id) {
        sql.delete("ShoppingCart.delete", id);
    }

    public ShoppingCartDTO shoppingCartCheck(ShoppingCartDTO shoppingCartDTO) {
        return sql.selectOne("ShoppingCart.check", shoppingCartDTO);
    }
}
