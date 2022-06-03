package com.its.bookStore.service;

import com.its.bookStore.dto.MemberDTO;
import com.its.bookStore.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

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
}
