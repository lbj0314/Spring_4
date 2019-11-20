package com.iu.s4.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.s4.dao.BoardNoticeDAO;
import com.iu.s4.dao.NoticeFilesDAO;
import com.iu.s4.model.BoardVO;
import com.iu.s4.model.NoticeFilesVO;
import com.iu.s4.util.FileSaver;
import com.iu.s4.util.Pager;

@Service
public class BoardNoticeService implements BoardService {

	@Inject
	private BoardNoticeDAO boardNoticeDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private NoticeFilesDAO noticeFilesDAO;
	
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
	public int boardWrite(BoardVO boardVO, MultipartFile[] file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/notice");
		NoticeFilesVO noticeFilesVO = new NoticeFilesVO();
		int result = boardNoticeDAO.boardWrite(boardVO);
		System.out.println(boardVO.getNum());
//		for(MultipartFile multipartFile:file) {
//			String fileName = fileSaver.save(realPath, multipartFile);
//			noticeFilesVO.setFname(fileName);
//			noticeFilesVO.setOname(multipartFile.getOriginalFilename());
//		}
//		noticeFilesDAO.fileWrite(noticeFilesVO);
		return result;
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
