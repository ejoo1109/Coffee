package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override //게시글 추가
	public boolean insert(BoardVO board) {
		
		return mapper.insert(board)>0?true:false;
	}

	@Override // 게시글 수정
	public boolean update(BoardVO board) {
		
		return mapper.update(board)>0?true:false;
	}

	@Override //게시글 삭제
	public boolean delete(int bno) {
		
		return mapper.delete(bno)>0?true:false;
	}

	@Override //개별조회
	public BoardVO read(int bno) {
		
		return mapper.read(bno);
	}

	@Override //전체조회
	public List<BoardVO> list(Criteria cri) {
		
		return mapper.list(cri);
	}

	@Override
	public int getTotalCnt(Criteria cri) {
		
		return mapper.totalCnt(cri);
	}

}
