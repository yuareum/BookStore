package com.its.bookStore.repository;

import com.its.bookStore.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MemberRepository {

    @Autowired
    public SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save", memberDTO);
    }

    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicateCheck", memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public MemberDTO findByMemberId(String memberId) {
        return sql.selectOne("Member.findByMemberId", memberId);
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }
    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }

    public List<MemberDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Member.pagingList", pagingParam);
    }

    public int memberCount() {
        return sql.selectOne("Member.count");
    }

    public int delete(Long id) {
        return sql.delete("Member.delete",id);
    }
}
