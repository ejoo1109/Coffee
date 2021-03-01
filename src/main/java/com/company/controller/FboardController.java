package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.fBoardVO;
import com.company.service.FboardService;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Slf4j
@RequestMapping("/fBoard/*")
public class FboardController {

	@Autowired
	private FboardService fservice;
	
	@GetMapping("/fBoardWriter")
	public void insertdGet() {
		log.info("===fboard 글작성 폼 보여주기");
	}
	@PostMapping("/fBoardWriter")
	public String boardPost(fBoardVO fboard,RedirectAttributes rttr) {
		log.info("==fBoardWriteradd 작성완료"+fboard);
		fservice.finsert(fboard);
		return "redirect:/fBoard/fBoardlist";
	}

	@GetMapping("/fBoardlist")
	public void list(Model model) {
		log.info("=== fboard 전체 리스트 보기");
		List<fBoardVO> list = fservice.fBoardList();
		model.addAttribute("list",list);
		
	}
	
	@GetMapping({"/fread","/fmodify"})
	public void fread(int fbno, Model model) {
		log.info("==fBoard 개별조회"+fbno);
		log.info("==fBoard 수정 폼 요청"+fbno);
		fBoardVO fboard = fservice.fread(fbno);
		model.addAttribute("fboard",fboard);
	}

	@PostMapping("/fmodify")
	public String fmodify(fBoardVO fboard) {
		log.info("==fBoard 수정요청");
		fservice.fupdate(fboard);
		return "redirect:/fBoard/fBoardlist";
	}
	
	@GetMapping("/fdelete")
	public String fdelete(int fbno) {
		log.info("==fBoard 삭제요청"+fbno);
		boolean result = fservice.fdelete(fbno);
		if(!result) {
			return "redirect:/fBoard/fmodify";
		}else {
		return "redirect:/fBoard/fBoardlist";
		}
	}
	
}
