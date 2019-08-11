package com.tommy.ninjaGold;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	ArrayList<String> history = new ArrayList<String>();
	int randomNum = 0;
	int total = 0;
	String output = "";
	int flag;
	
	private int randomNumGen(int min, int max) {
		int range = (max - min) + 1;
		return (int)(Math.random() * range) + min;
	}
	
	@RequestMapping("") 
	public String indexRedirect1() {
		return "redirect:/gold";
	}
	
	@RequestMapping("/")
	public String indexRedirect2() {
		return "redirect:/gold";
	}
	
	@RequestMapping("/restart")
	public String restart(HttpSession session) {
		this.history.clear();
		this.total = 0;
		return "redirect:/gold";
	}

	@RequestMapping("/gold")
	public String indexPage(HttpSession session) {
		session.setAttribute("history", this.history);
		if(this.total < 0) {
			this.total = 0;
			session.setAttribute("total", 0);
		} else {
		session.setAttribute("total", this.total);
		}
		return "index.jsp";
	}
	
	@RequestMapping(value="/processMoney", method=RequestMethod.POST)
	public String formAction(@RequestParam(value="building") String building, HttpSession session) {
		System.out.println("Building Selected ->>>>>>> " + building);
		
		if(building.equals("farm")) {
			this.randomNum = randomNumGen(10, 20);
			this.total += this.randomNum;
			session.setAttribute("total", total);
			this.output = "Earned " + this.randomNum + " gold from the farm!";
			history.add(this.output);
		}
		if(building.equals("cave")) {
			this.randomNum = randomNumGen(5, 10);
			this.total += this.randomNum;
			session.setAttribute("total", total);
			this.output = "Earned " + this.randomNum + " gold from the cave!";
			history.add(this.output);
		}
		if(building.equals("house")) {
			this.randomNum = randomNumGen(5, 10);
			this.total += this.randomNum;
			session.setAttribute("total", total);
			this.output = "Earned " + this.randomNum + " gold from the house!";
			history.add(this.output);
		}
		if(building.equals("casino")) {
			flag = randomNumGen(0, 1);
			this.randomNum = randomNumGen(1, 50);
			if(flag == 1) {
				this.total += this.randomNum;
				this.output = "Entered a casino and won " + this.randomNum + "!";
			}
			else {
				this.total -= this.randomNum;
				this.output = "Entered a casino and lost " + this.randomNum + " gold... Ouch..";
			}
				history.add(this.output);
		}
		
		return "redirect:/gold";
	}
}