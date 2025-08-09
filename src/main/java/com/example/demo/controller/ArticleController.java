package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.vo.Article;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ArticleController {

    private final ArticleRepository articleRepository;

    @RequestMapping("/usr/article/list")
    public String showList(Model model) {
        List<Article> articles = articleRepository.getArticles();
        model.addAttribute("articles", articles);
        return "article/list";
    }
    @RequestMapping("/usr/article/detail")
    public String showDetail(Model model, @RequestParam int id) {
    	Article article = articleRepository.getArticleById(id);
    	model.addAttribute("article",article);
    	return "article/detail";
    }
    
    @RequestMapping(value = "/usr/article/modify", method = RequestMethod.GET)
    public String showModifyForm(Model model, @RequestParam int id) {
    	Article article = articleRepository.getArticleById(id);
    	model.addAttribute("article",article);
    	return "article/modify";
    }
    
    @RequestMapping(value = "/usr/article/modify", method = RequestMethod.POST)
    public String doModify(@RequestParam int id, @RequestParam String title) {
    	articleRepository.modifyArticle(id, title);
    	return "redirect:/usr/article/detail?id="+id;
    }
    
    @RequestMapping("/usr/article/delete")
    public String doDelete(@RequestParam int id) {
    	articleRepository.deleteArticle(id);
    	return "redirect:/usr/article/list";
    }
    
    @RequestMapping(value = "/usr/article/write", method = RequestMethod.GET)
    public String showWriteForm() {
        return "article/write";
    }

    @RequestMapping(value = "/usr/article/write", method = RequestMethod.POST)
    public String doWrite(@RequestParam String title, @RequestParam int memberId) {
        articleRepository.writeArticle(title, memberId);
        return "redirect:/usr/article/list";
    }
    
    
}