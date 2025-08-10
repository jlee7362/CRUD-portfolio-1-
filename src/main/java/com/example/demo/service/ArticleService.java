package com.example.demo.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.vo.Article;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class ArticleService {
	
	private final ArticleRepository articleRepository;
	
	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}
	
	public Article getArticleById(int id) {
		return articleRepository.getArticleById(id);
	}
	

	public void writeArticle(String title, int memberId, MultipartFile file) {
		String thumbImg = null;
		if(file != null && !file.isEmpty()){
			thumbImg = saveUpload(file);
		}
		articleRepository.writeArticle(title, memberId, thumbImg);
				
	}
	
	
	public int modifyArticle(int id, String title, MultipartFile file) {

		String thumbImg = null;
		if(file != null && !file.isEmpty()) {
			thumbImg = saveUpload(file);
		}
		return articleRepository.updateArticle(id, title, thumbImg);
	}
	
	public int deleteArticle(int id) {
        return articleRepository.deleteArticle(id);
    }

	//Util
	
	public String saveUpload(MultipartFile file) {
		// 확장자/용량 검증
		long max = 20L * 1024 * 1024; // 20MB
		if(file.getSize() > max) throw new RuntimeException("파일 용량 초과(최대 20MB)");
		
		String origin = file.getOriginalFilename();
		String ext = (origin != null && origin.contains(".")) 
				? origin.substring(origin.lastIndexOf('.') + 1).toLowerCase() 
				: "";
		
		if (!(ext.equals("png")) || (ext.equals("jpg")) || (ext.equals("jpeg"))|| (ext.equals("webp"))) {
			throw new RuntimeException("허용되지 않는 확장자");
		}
		// 3) 저장 파일명 생성
		String newFileName = UUID.randomUUID().toString().replace("-", "") + "." + ext;
		Path uploadPath = Paths.get("C:/upload/", newFileName);
		try {
			Files.createDirectories(uploadPath.getParent());
			Files.copy(file.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
		} catch(IOException e){
			throw new RuntimeException("파일 저장 실패");
			
		}
		return newFileName;// ← 이 값을 DB의 thumbImg에 저장
	}

}
