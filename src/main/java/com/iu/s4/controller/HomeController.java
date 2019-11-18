package com.iu.s4.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		String year = "";
		String birth = "";




		return "index";
	}

	//	@GetMapping(value = "/testAjax")
	//	public void testAjax(Model model, int num) throws Exception {
	//		Random random = new Random();
	//		num = random.nextInt(num);
	//		model.addAttribute("num", num);
	//	}
	@PostMapping(value = "/testAjax")
	public void testAjax(Model model, int num) throws Exception {
		Random random = new Random();
		num = random.nextInt(num);
		model.addAttribute("num", num);
	}
	@GetMapping(value = "/selectAnimal")
	public void selectAnimal(Model model, String kind) throws Exception {
		if (kind.equals("dog")) {
//			model.addAttribute("animal", "시바");
//			model.addAttribute("animal2", "골든 리트리버");
//			model.addAttribute("animal3", "웰시코기");
			String [] animal = {"시바", "골든 리트리버", "웰시코기"};
			model.addAttribute("animal", animal);
		}else if (kind.equals("cat")) {
//			model.addAttribute("animal", "페르시안");
//			model.addAttribute("animal2", "노르웨이숲");
//			model.addAttribute("animal3", "뱅갈");
			String [] animal = {"페르시안", "노르웨이숲", "뱅갈"};
			model.addAttribute("animal", animal);
		}else if(kind.equals("bird")) {
//			model.addAttribute("animal", "멧비둘기");
//			model.addAttribute("animal2", "황조롱이");
//			model.addAttribute("animal3", "수리부엉이");
			String [] animal = {"멧비둘기", "황조롱이", "수리부엉이"};
			model.addAttribute("animal", animal);
		}
	}
}
