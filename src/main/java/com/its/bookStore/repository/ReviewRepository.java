package com.its.bookStore.repository;

import com.its.bookStore.dto.ReviewDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(ReviewDTO reviewDTO) {
        return sql.insert("Review.save", reviewDTO);
    }

    public List<ReviewDTO> findAll(Long bookId){
        return sql.selectList("Review.findAll", bookId);
    }

    public ReviewDTO findById(Long id) {
        return sql.selectOne("Review.findById",id);
    }
}
