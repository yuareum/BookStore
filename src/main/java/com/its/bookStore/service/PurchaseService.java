package com.its.bookStore.service;

import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.dto.PurchaseDTO;
import com.its.bookStore.repository.BookRepository;
import com.its.bookStore.repository.PurchaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PurchaseService {
    @Autowired
    private PurchaseRepository purchaseRepository;
    public boolean save(PurchaseDTO purchaseDTO) {
        int saveResult = purchaseRepository.save(purchaseDTO);
        if(saveResult > 0){
            return true;
        }
        else {
            return false;
        }
    }

    public List<PurchaseDTO> findByMemberId(String purchaseMemberId) {
        return purchaseRepository.findByMemberId(purchaseMemberId);
    }
    private static final int PAGE_LIMIT = 5;
    private static final int BLOCK_LIMIT = 3;
    public List<PurchaseDTO> findAll(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<PurchaseDTO> purchaseList = purchaseRepository.findAll(pagingParam);
        return purchaseList;
    }

    public PageDTO paging(int page) {
        int purchaseCount = purchaseRepository.purchaseCount();
        int maxPage = (int)(Math.ceil((double)purchaseCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
