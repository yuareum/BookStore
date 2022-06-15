package com.its.bookStore.controller;

import com.its.bookStore.dto.MemberDTO;
import com.its.bookStore.dto.PageDTO;
import com.its.bookStore.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "member/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        boolean saveResult = memberService.save(memberDTO);
        if(saveResult){
            return "member/login";
        }
        else{
            return "saveFall";
        }
    }
    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult;
    }

    @GetMapping("/login")
    public String loginForm(){
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        MemberDTO loginMember = memberService.login(memberDTO);
        if(loginMember != null){
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            session.setAttribute("loginPassword", loginMember.getMemberPassword());
            session.setAttribute("loginMobile", loginMember.getMemberMobile());
            session.setAttribute("loginAmount", loginMember.getAmount());
            return "redirect:/";
        }
        else{
            return "member/login";
        }
    }
    @GetMapping("/admin")
    public String admin(@RequestParam("memberId") String memberId, Model model) {
        MemberDTO loginMember = memberService.findByMemberId(memberId);
        model.addAttribute("admin", loginMember);
        if("admin".equals(loginMember.getMemberId())){
            return "member/admin";
        }
        else{
            return "redirect:/member/findAll";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }

    @GetMapping("/myPage")
    public String myPage(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/myPage";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model,HttpSession session){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("updateMember", memberDTO);
        if(session.getAttribute("loginMobile") != memberDTO.getMemberMobile()){
            session.removeAttribute("loginMobile");
            session.setAttribute("loginMobile",  memberDTO.getMemberMobile());
        }
        return "member/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO,HttpSession session){
        memberService.update(memberDTO);
        session.setAttribute("loginMobile", memberDTO.getMemberMobile());
        return "redirect:/member/myPage?id=" + memberDTO.getId();
    }
    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<MemberDTO> memberList = memberService.pagingList(page);
        PageDTO paging = memberService.paging(page);
        model.addAttribute("memberList", memberList);
        model.addAttribute("paging", paging);
        return "member/memberList";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        boolean deleteResult = memberService.delete(id);
        if(deleteResult){
            return "redirect:/member/findAll";
        }
        else{
            return "deleteFail";
        }
    }
    @GetMapping("/withdrawal")
    public String withdrawalForm(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/withdrawal";
    }
    @PostMapping("/withdrawal")
    public String withdrawal(@RequestParam("id") Long id, HttpSession session){
        boolean deleteResult = memberService.delete(id);
        if(deleteResult){
            session.invalidate();
            return "index";
        }
        else{
            return "deleteFail";
        }
    }
}
