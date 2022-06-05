package com.its.bookStore.repository;

import com.its.bookStore.dto.BookDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(BookDTO bookDTO) {
        return sql.insert("Book.save", bookDTO);
    }

    public List<BookDTO> findAll(Map<String, Integer> pagingParam) {
        return sql.selectList("Book.bookList", pagingParam);
    }

    public BookDTO findById(Long id) {
        return sql.selectOne("Book.findById", id);
    }

    public int bookCount() {
        return sql.selectOne("Book.count");
    }
}
