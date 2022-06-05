package com.its.bookStore.service;

import com.its.bookStore.dto.BookDTO;
import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;
    public boolean save(BookDTO bookDTO) throws IOException {
        MultipartFile bookFile = bookDTO.getBookFile();
        String bookFileName = bookFile.getOriginalFilename();
        bookFileName = System.currentTimeMillis() + "-" + bookFileName;
        bookDTO.setBookFileName(bookFileName);
        String savePath = "C:\\spring_img\\" + bookFileName;
        if(!bookFile.isEmpty()){
            bookFile.transferTo(new File(savePath));
        }
        int saveResult = bookRepository.save(bookDTO);
        if(saveResult > 0){
            return true;
        }
        else {
            return false;
        }
    }
    private static final int PAGE_LIMIT = 5;
    private static final int BLOCK_LIMIT = 5;
    public List<BookDTO> findAll(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BookDTO> bookList = bookRepository.findAll(pagingParam);
        return bookList;
    }

    public PageDTO paging(int page) {
        int bookCount = bookRepository.bookCount();
        int maxPage = (int)(Math.ceil((double)bookCount / PAGE_LIMIT));
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

    public BookDTO findById(Long id) {
        BookDTO bookDTO = bookRepository.findById(id);
        return bookDTO;
    }
}
