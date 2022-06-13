package com.its.bookStore.repository;

import com.its.bookStore.dto.PurchaseDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PurchaseRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(PurchaseDTO purchaseDTO) {
        return sql.insert("Purchase.save", purchaseDTO);
    }

    public List<PurchaseDTO> findByMemberId(String purchaseMemberId) {
        return sql.selectList("Purchase.findByMemberId", purchaseMemberId);
    }

    public List<PurchaseDTO> findAll(Map<String, Integer> pagingParam) {
        return sql.selectList("Purchase.findAll", pagingParam);
    }

    public int purchaseCount() {
        return sql.selectOne("Purchase.count");
    }
}
