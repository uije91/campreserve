package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	//메인화면 이동
	@RequestMapping(value = "/index")
	public String home() {
		return "include/index";
	}
}








