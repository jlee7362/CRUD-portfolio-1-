package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.service.ArticleService;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ArticleController {

	private final ArticleService articleService;
	private final ArticleRepository articleRepository;

	@RequestMapping("/usr/article/list")
	public String list(Model model) {
		List<Article> articles = articleService.getArticles();
		model.addAttribute("articles", articles);
		return "article/list";
	}

	@RequestMapping("/usr/article/detail")
	public String detail(@RequestParam int id, Model model) {
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		return "article/detail";
	}

	@GetMapping("/usr/article/write")
	public String writeForm() {
		return "article/write";
	}

	@PostMapping("/usr/article/write")	
	public String doWrite(@RequestParam String title,
							@RequestParam int memberId,
							@RequestParam(required = false) MultipartFile file){
		
		articleService.writeArticle(title, memberId, file);
		return "redirect:/usr/article/list";
	}

	@GetMapping("/usr/article/modify")
	public String modifyForm(@RequestParam int id, Model model) {
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		return "article/modify";
	}
	
	@PostMapping("/usr/article/modify")
	public String doModify(@RequestParam int id, 
							@RequestParam String title, 
							@RequestParam(required=false) MultipartFile file) {
		
		articleService.modifyArticle(id, title, file);
		
		return "redirect:/usr/article/detail?id=" + id;
	}

	@RequestMapping("/usr/article/delete")
	public String doDelete(@RequestParam int id) {
		articleRepository.deleteArticle(id);
		return "redirect:/usr/article/list";
	}

}
