package com.iu.s4.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.s4.model.BoardVO;
import com.iu.s4.model.MemberVO;

@Component
public class UpdateInterceptor extends HandlerInterceptorAdapter {

//	Controller 종료 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//id
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		//writer
		Map<String, Object> map = modelAndView.getModel();
		BoardVO boardVO = (BoardVO)map.get("vo");
		String board = (String)map.get("board");
		
		if (!memberVO.getId().equals(boardVO.getWriter())) {
			modelAndView.addObject("msg", "권한이 없습니다.");
			modelAndView.addObject("path", board+"List");
			modelAndView.setViewName("common/common_result");
		}
	}
}
