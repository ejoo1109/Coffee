package com.company.mapper;

import java.util.List;

import com.company.domain.fBoardVO;

public interface FboardMapper {
	public List<fBoardVO> fBoardList(); //전체조회
	public fBoardVO fread(int fbno); //게시글 개별조회
	public int finsert(fBoardVO fboard); //게시글 추가
	public int fupdate(fBoardVO fboard); //게시글 수정
	public int fdelete(int fbno); //게시글 삭제
	
}
