package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

public interface BoardService {
	//게시글 작성
	public boolean insert(BoardVO board);
	//게시글 수정
	public boolean update(BoardVO board);
	//게시글 삭제
	public boolean delete(int bno);
	//게시글 조회
	public BoardVO read(int bno);
	//전체 조회
	public List<BoardVO> list(Criteria cri);
	//전체 게시물 수
	public int getTotalCnt(Criteria cri);
}
