package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.http.MediaType;
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

	private final ArticleRepository articleRepository;
	private ArticleService articleService;

	@RequestMapping("/usr/article/list")
	public String showList(Model model) {
		List<Article> articles = articleService.getArticles();
		model.addAttribute("articles", articles);
		return "article/list";
	}
	

	@GetMapping("/usr/article/write")
	public String showWriteForm() {
		return "article/write";
	}

	@PostMapping(value="/usr/article/write", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)	
	public String doWrite(@RequestParam String title, @RequestParam int memberId,
			@RequestParam(value="thumbImgFile", required = false) MultipartFile file) throws IOException {
		String savedName = null;
		
		if (file != null && !file.isEmpty()) {
			// 1) 폴더 보장
			Path uploadDir = Paths.get("C:/upload/"); // 경로를 정해준다.
			Files.createDirectories(uploadDir);
			
			// 2) 원본 확장자 유지
			String original = file.getOriginalFilename();
			String ext = "";
			if (original != null&& original.lastIndexOf('.') != -1) {
				ext = original.substring(original.lastIndexOf('.')); // .png, .jpg...
			}
			// 3) 저장 파일명 생성
			savedName = UUID.randomUUID().toString().replace("-", "")+ext;
			// 잘 돌아가는지 확인.
			System.out.println("upload file = " + original + " -> saved = " + savedName);
			
			// 4) 저장 
			Path target = uploadDir.resolve(savedName);
			Files.copy(file.getInputStream(), target, StandardCopyOption.REPLACE_EXISTING);
		}

		articleRepository.writeArticle(title, memberId, savedName);
		
		return "redirect:/usr/article/list";
	}
	
	// 이미지 경로 체크 메서드
	private String findImageWithAnyExtension(String fileNameWithoutExt) {
		String uploadDir = "C:/upload/";
		String[] extensions = { ".png", ".jpg", ".jpeg", ".gif", ".bmp", ".webp" };

		for (String ext : extensions) {
			File f = new File(uploadDir + fileNameWithoutExt + ext);
			if (f.exists()) {
				return fileNameWithoutExt + ext;
			}
		}
		return null; // 없으면 null
	}

	@GetMapping("/article/list")
	public String articleList(Model model) {
		List<Article> articles = articleRepository.findAll();

		// 확장자 확인 후 덮어쓰기
		for (Article article : articles) {
			String originalName = article.getThumbImg();
			if (originalName != null && !originalName.isEmpty()) {
				String nameWithoutExt = originalName.contains(".")
						? originalName.substring(0, originalName.lastIndexOf("."))
						: originalName;
				String realFileName = findImageWithAnyExtension(nameWithoutExt);
				article.setThumbImg(realFileName);
			}
		}

		model.addAttribute("articles", articles);
		
		
		return "article/list";
	}


	@RequestMapping("/usr/article/detail")
	public String showDetail(Model model, @RequestParam int id) {
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		return "article/detail";
	}

	@GetMapping("/usr/article/modify")
	public String showModifyForm(Model model, @RequestParam int id) {
		Article article = articleService.getArticleById(id);
		if(article == null || article.getDelStatus() == 1) {
			model.addAttribute("msg", "존재하지 않거나 삭제된 글입니다.");
			model.addAttribute("historyBack", true);
			return "common/redirect";
		}
		model.addAttribute("article",article);
		return "article/modify";
	}

	@PostMapping("/usr/article/modify")
	@ResponseBody
	public ResultData<Integer> doModify(@RequestParam int id, @RequestParam String title, @RequestParam String body, @RequestParam(required=false) MultipartFile file) {
		
		int affected = articleService.modifyArticle(id, title, body, file);
		
		return (affected > 0)
				? ResultData.from("S-1", "수정 완료", "id", id)
				: ResultData.from("F-1", "수정 실패");
	}

	@RequestMapping("/usr/article/delete")
	public String doDelete(@RequestParam int id) {
		articleRepository.deleteArticle(id);
		return "redirect:/usr/article/list";
	}


}
