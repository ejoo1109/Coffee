package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.fBoardVO;
import com.company.mapper.FboardMapper;

@Service
public class FboardServiceImpl implements FboardService {

	@Autowired
	private FboardMapper fmapper;
	
	@Override
	public List<fBoardVO> fBoardList() {
		return fmapper.fBoardList();
	}

	@Override
	public fBoardVO fread(int fbno) {
		return fmapper.fread(fbno);
	}

	@Override
	public boolean finsert(fBoardVO fboard) {
		return fmapper.finsert(fboard)>0?true:false;
	}

	@Override
	public boolean fupdate(fBoardVO fboard) {
		return fmapper.fupdate(fboard)>0?true:false;
	}

	@Override
	public boolean fdelete(int fbno) {
		return fmapper.fdelete(fbno)>0?true:false;
	}

}
