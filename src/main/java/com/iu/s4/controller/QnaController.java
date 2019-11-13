package com.iu.s4.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s4.model.BoardVO;
import com.iu.s4.service.BoardQnaService;
import com.iu.s4.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Inject
	private BoardQnaService boardQnaService;
	
	//list
	@RequestMapping(value = "qnaList")
	public ModelAndView boardList(Pager pager) throws Exception{
		List<BoardVO> list = boardQnaService.boardList(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", list);
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	//select One
	
	//write
	
	//update
	
	//delete
	
	//reply
}