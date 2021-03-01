package com.company.service;

import java.util.List;

import com.company.domain.fBoardVO;

public interface FboardService {
	public List<fBoardVO> fBoardList(); //전체조회
	public fBoardVO fread(int fbno); //게시글 
	public boolean finsert(fBoardVO fboard); //게시글 추가
	public boolean fupdate(fBoardVO fboard); //게시글 수정
	public boolean fdelete(int fbno); //게시글 삭제
}
