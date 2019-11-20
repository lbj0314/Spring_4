package com.iu.s4.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s4.model.BoardNoticeVO;
import com.iu.s4.model.BoardVO;
import com.iu.s4.service.BoardNoticeService;
import com.iu.s4.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {
	
	@Inject
	private BoardNoticeService boardNoticeService;
	
	//list
	@RequestMapping(value = "noticeList")
	public ModelAndView boardList(Pager pager) throws Exception {
		List<BoardVO> list = boardNoticeService.boardList(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", list);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardList");
		
		return mv;
	}

	//select One
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView boardSelect(BoardVO boardVO) throws Exception{
		boardVO = boardNoticeService.boardSelect(boardVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", boardVO);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardSelect");
		return mv;
	}
	//write
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public ModelAndView boardWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "notice");
		mv.setViewName("board/boardWrite");
		return mv;
		
	}
	@RequestMapping(value="noticeWrite", method = RequestMethod.POST)
	public ModelAndView boardWrite(BoardVO boardVO, MultipartFile[] file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = boardNoticeService.boardWrite(boardVO, file, session);
		String msg = "Write Fail";
		
		if (result > 0) {
			mv.setViewName("redirect:./noticeList");
//			msg = "Write Success";
		}else {
		mv.addObject("msg", msg);
		mv.addObject("path", "./noticeList");
		mv.setViewName("common/common_result");
		}
		return mv;
	}
	
	//update
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView boardUpdate2(BoardVO boardVO) throws Exception{
		boardVO = boardNoticeService.boardSelect(boardVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", boardVO);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public ModelAndView boardUpdate(BoardVO boardVO) throws Exception{
		int result = boardNoticeService.boardUpdate(boardVO);
		ModelAndView mv = new ModelAndView();
		String msg = "Update Fail";
		System.out.println(result);
		if (result > 0) {
			mv.setViewName("redirect:./noticeList");
//			msg = "Update Success";
		}else {
		mv.addObject("msg", msg);
		mv.addObject("path", "./noticeList");
		mv.setViewName("common/common_result");
		}
		return mv;
		
		
	}
	
	
	//delete
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public ModelAndView boardDelete(BoardVO boardVO) throws Exception{
		int result = boardNoticeService.boardDelete(boardVO);
		ModelAndView mv = new ModelAndView();
		String msg = "Delete Fail";
		if (result > 0) {
			mv.setViewName("redirect:./noticeList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "./noticeList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	
}
