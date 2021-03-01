package com.company.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.PageVO;
import com.company.domain.fBoardVO;
import com.company.service.BoardService;

import lombok.extern.slf4j.Slf4j;

// 1:1 게시판
@Controller
@Slf4j
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/register")
	public void insertGet() {
		log.info("====글 작성 폼 보여주기");
	}
	
	@PostMapping("/register")
	public String registBoard(BoardVO board, RedirectAttributes rttr) {
		log.info("====글 작성 완료"+board);
		service.insert(board);
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public void list(Model model ,Criteria cri) {
		log.info("=== board 전체 리스트 보기");
		List<BoardVO> list = service.list(cri);
		model.addAttribute("list",list);
		//전체 게시물 수 요청
		int total=service.getTotalCnt(cri);
		//pageVO라는 이름으로 PageVO에서 필요한 cri와 total값을 담음
		model.addAttribute("pageVO", new PageVO(cri, total)); 
	}
	
	@GetMapping({"/read","/modify"})
	public void read(int bno, Model model) {
		log.info("==Board 개별조회"+bno);
		log.info("==Board 수정 폼 요청"+bno);
		BoardVO board = service.read(bno);
		model.addAttribute("board", board);
	}
	@PostMapping("/modify")
	public String modify(BoardVO board) {
		log.info("==board 수정요청");
		service.update(board);
		return "redirect:/board/list";
	}
	@GetMapping("/delete")
	public String delete(int bno) {
		log.info("===게시글 삭제요청"+bno);
		boolean result = service.delete(bno);
		if(!result) {
			return "redirect:/board/modify";
		}else {
		return "redirect:/board/list";
		}
	}
}
