package com.iu.s4.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s4.model.MemberVO;
import com.iu.s4.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Inject
	private MemberServiceImpl memberServiceImpl;

	//join
	@GetMapping(value = "memberJoin")
	public ModelAndView memberJoin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");

		return mv;
	}
	@PostMapping(value = "memberJoin")
	public ModelAndView memberJoin(MemberVO memberVO) throws Exception{
		int result = memberServiceImpl.memberJoin(memberVO);
		ModelAndView mv = new ModelAndView();
		String msg = "memberJoin Fail";
		if (result > 0) {
			mv.setViewName("redirect:../");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "../");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//login


	//update


	//delete


	//pointUpdate
}
