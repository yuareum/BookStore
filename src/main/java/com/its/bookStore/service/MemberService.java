package com.its.bookStore.service;

import com.its.bookStore.dto.MemberDTO;
import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {
    @Autowired
    public MemberRepository memberRepository;
    public boolean save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberFileName = memberProfile.getOriginalFilename();
        memberFileName = System.currentTimeMillis() + "-" + memberFileName;
        memberDTO.setMemberProfileName(memberFileName);
        String savePath = "C:\\spring_img\\" + memberFileName;
        if(!memberProfile.isEmpty()){
            memberProfile.transferTo(new File(savePath));
        }
        int saveResult = memberRepository.save(memberDTO);
        if(saveResult > 0){
            return true;
        }
        else{
            return false;
        }
    }

    public String duplicateCheck(String memberId) {
        String checkResult = memberRepository.duplicateCheck(memberId);
        if(checkResult == null){
            return "ok";
        }
        else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);

    }

    public MemberDTO findByMemberId(String memberId) {
        return memberRepository.findByMemberId(memberId);
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
    private static final int PAGE_LIMIT = 10;
    private static final int BLOCK_LIMIT = 3;
    public List<MemberDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<MemberDTO> pagingList = memberRepository.pagingList(pagingParam);
        return pagingList;
    }
    public PageDTO paging(int page) {
        int memberCount = memberRepository.memberCount(); // 글 갯수 조회
        int maxPage = (int)(Math.ceil((double)memberCount / PAGE_LIMIT));
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

    public boolean delete(Long id) {
        int deleteResult = memberRepository.delete(id);
        if(deleteResult > 0){
            return true;
        }
        else{
            return false;
        }
    }

    public void pointUpdate(MemberDTO memberDTO) {
        memberRepository.pointUpdate(memberDTO);
    }

    public boolean purchaseUpdate(MemberDTO memberDTO) {
        int purchaseUpdateResult = memberRepository.purchaseUpdate(memberDTO);
        if(purchaseUpdateResult > 0){
            return true;
        }
        else{
            return false;
        }
    }
}
