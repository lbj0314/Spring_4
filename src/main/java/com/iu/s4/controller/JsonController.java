package com.iu.s4.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s4.model.BoardVO;
import com.iu.s4.service.BoardNoticeService;
import com.iu.s4.util.Pager;

//리턴 되는 데이터는 response에 담아서 요청한 곳으로 바로 보냄
@RestController
public class JsonController {
	
	@Inject
	private BoardNoticeService boardNoticeService;
	
	@GetMapping("/getJson3")
	public List<BoardVO> getJson3(Pager pager) throws Exception{
		List<BoardVO> list = boardNoticeService.boardList(pager);
		
		return list;
	}
	
	@GetMapping("/getJson2")

	public BoardVO getJson2(BoardVO boardVO) throws Exception{
//		ModelAndView mv = new ModelAndView();
		boardVO = boardNoticeService.boardSelect(boardVO);
//		String title = boardVO.getTitle();
//		String writer = boardVO.getWriter();
//		String contents = boardVO.getContents();
		
//		String jmsg = "{\"title\":\""+title+"\",\"writer\":\""+writer+"\",\"contents\":\""+contents+"\"}";
//		mv.addObject("result", jmsg);
//		mv.setViewName("common/common_ajaxResult");

		
		return boardVO;
	}
	
	
	@GetMapping("/getJson1")
	public ModelAndView getJson1() throws Exception{
		//name = momo, age = 23
		String jmsg = "{\"name\":\"momo\",\"age\":23}";
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", jmsg);
		mv.setViewName("common/common_ajaxResult");
		return mv;
	}
	
}
