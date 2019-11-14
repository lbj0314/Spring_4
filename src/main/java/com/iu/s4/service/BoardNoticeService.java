package com.iu.s4.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.s4.dao.BoardNoticeDAO;
import com.iu.s4.model.BoardVO;
import com.iu.s4.util.Pager;

@Service
public class BoardNoticeService implements BoardService {

	@Inject
	private BoardNoticeDAO boardNoticeDAO;
	
	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePager(boardNoticeDAO.boardCount(pager));
		return boardNoticeDAO.boardList(pager);
	}

	@Override
	public BoardVO boardSelect(BoardVO boardVO) throws Exception {
		boardVO.getNum();
		return boardNoticeDAO.boardSelect(boardVO);
	}

	@Override
	public int boardWrite(BoardVO boardVO) throws Exception {
		return boardNoticeDAO.boardWrite(boardVO);
	}

	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		return boardNoticeDAO.boardUpdate(boardVO);
	}

	@Override
	public int boardDelete(BoardVO boardVO) throws Exception {
		boardVO.getNum();
		return boardNoticeDAO.boardDelete(boardVO);
	}

}
