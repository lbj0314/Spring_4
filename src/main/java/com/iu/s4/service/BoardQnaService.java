package com.iu.s4.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.s4.dao.BoardQnaDAO;
import com.iu.s4.model.BoardQnaVO;
import com.iu.s4.model.BoardVO;
import com.iu.s4.util.Pager;

@Service
public class BoardQnaService implements BoardService {
	
	@Inject
	private BoardQnaDAO boardQnaDAO;
	
	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePager(boardQnaDAO.boardCount(pager));
		return boardQnaDAO.boardList(pager);
	}

	@Override
	public BoardVO boardSelect(BoardVO boardVO) throws Exception {
		boardVO.getNum();
		return boardQnaDAO.boardSelect(boardVO);
	}

	@Override
	public int boardWrite(BoardVO boardVO) throws Exception {
		return boardQnaDAO.boardWrite(boardVO);
	}

	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		return boardQnaDAO.boardUpdate(boardVO);
	}

	@Override
	public int boardDelete(BoardVO boardVO) throws Exception {
		boardVO.getNum();
		return boardQnaDAO.boardDelete(boardVO);
	}

	public int boardReply(BoardVO boardVO) throws Exception {
		BoardQnaVO parent = (BoardQnaVO)boardQnaDAO.boardSelect(boardVO);
		int result = boardQnaDAO.boardReplyUpdate(parent);

		return boardQnaDAO.boardReply(boardVO);
	}
	
}
