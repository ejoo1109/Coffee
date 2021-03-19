package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.FileAttach;
import com.company.mapper.AttachMapper;
import com.company.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	@Autowired
	private AttachMapper attachmapper;
	
	@Transactional
	@Override //게시글 추가
	public boolean insert(BoardVO board) {
		
		boolean result =  mapper.insert(board)>0?true:false;
		
		//첨부파일이 null이거나 size()가 0이라면 글만 등록
		if(board.getAttachList()==null || board.getAttachList().size()<=0) {
			return result;
		}
		//첨부파일 삽입
		board.getAttachList().forEach(attach -> { 
			attach.setBno(board.getBno());
			attachmapper.insert(attach);
		});
		return result;
	}

	@Override // 게시글 수정
	public boolean update(BoardVO board) {
		attachmapper.delete(board.getBno());//db 파일 삭제, 서버엔 파일삭제 x 
		
		//게시물 수정
		boolean result =  mapper.update(board)>0?true:false;

		//첨부파일이 null이거나 size()가 0이라면 글만 등록
		if(board.getAttachList()==null || board.getAttachList().size()<=0) {
			return result;
		}
		//첨부파일 삽입
		board.getAttachList().forEach(attach -> { 
			attach.setBno(board.getBno());
			attachmapper.insert(attach);
		});
		return result;
	}

	@Transactional
	@Override //게시글 삭제
	public boolean delete(int bno) {
		attachmapper.delete(bno);
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
	
	@Override
	public List<FileAttach> getAttachList(int bno) {
		return mapper.attachList(bno);
	}
}
