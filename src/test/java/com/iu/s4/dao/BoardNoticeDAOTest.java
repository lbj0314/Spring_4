package com.iu.s4.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.iu.s4.TestAbstractCase;
import com.iu.s4.model.BoardVO;

public class BoardNoticeDAOTest extends TestAbstractCase {
	
	@Inject
	private BoardNoticeDAO boardNoticeDAO;
	
	//@Test
	public void boardWriteTest() throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("hello");
		boardVO.setWriter("world");
		boardVO.setContents("spring");
		int result = boardNoticeDAO.boardWrite(boardVO);
		
		assertEquals(1, result);
	}
	
	@Test
	public void boardUpdateTest() throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("test66666");
		boardVO.setContents("teset66666");
		boardVO.setNum(241);
		int result = boardNoticeDAO.boardUpdate(boardVO);
		
		assertEquals(1, result);
	}
}
