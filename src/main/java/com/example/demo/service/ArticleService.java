package com.example.demo.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.vo.Article;

@Service
public class ArticleService {
	
	private ArticleRepository articleRepository;
	
	public int modifyArticle(int id, String title, String body, MultipartFile file) {
		Article found = getArticleById(id);
		if(found == null || found.getDelStatus()==1) {
			throw new RuntimeException ("존재하지 않거나 삭제된 글입니다.");
		}
		//이미지 교체 로직
		String newThumbImgFileName = null;
		if(file != null && !file.isEmpty()) {
			// 1) 새 파일 저장
			newThumbImgFileName = saveUpload(file);
			// 2) 기존 파일 있으면 삭제
			if(found.getThumbImg() != null && !found.getThumbImg().isBlank()) {
				deleteUpload(found.getThumbImg());
			}
		}
		return articleRepository.updateArticle(id, title, body, newThumbImgFileName, LocalDateTime.now());
	}

	public String saveUpload(MultipartFile file) {
		// 확장자/용량 검증
		long max = 20 * 1024 * 1024; // 20MB
		if(file.getSize() > max) throw new RuntimeException("파일 용량 초과(최대 20MB)");
		String origin = file.getOriginalFilename();
		String ext = (origin != null && origin.contains(".")) ? origin.substring(origin.lastIndexOf('.') + 1).toLowerCase() : "";
		
		if (!(ext.equals("png")) || (ext.equals("jpg")) || (ext.equals("jpeg"))|| (ext.equals("webp"))) {
			throw new RuntimeException("허용되지 않는 확장자입니다.(png,jpg,jpeg 또는 webp로 올려주세요.)");
		}
		// 3) 저장 파일명 생성
		String newThumbImgFileName = UUID.randomUUID().toString().replace("-", "") + "." + ext;
		Path uploadPath = Paths.get("C:/upload/", newThumbImgFileName);
		try {
			Files.createDirectories(uploadPath.getParent());
			Files.copy(file.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
		} catch(IOException e){
			throw new RuntimeException("파일 저장 실패");
			
		}
		return newThumbImgFileName;// ← 이 값을 DB의 thumbImg에 저장
	}
	
	public void deleteUpload(String fileName) {
		if(fileName == null || fileName.isBlank()) return;
		try {
			Files.deleteIfExists(Paths.get("C:/upload/", fileName));
		}catch(IOException ignored){}
		
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	public Article getArticleById(int id) {
		return articleRepository.getArticleById(id);
	}
	
	
	

	

	

	
	
}
