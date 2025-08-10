package com.example.demo.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleRepository {
  List<Article> getArticles();

  Article getArticleById(@Param("id") int id);
  
  void writeArticle(@Param("title") String title,@Param("memberId") int memberId, @Param("thumbImg") String thumbImg);

  void modifyArticle(@Param("id")int id, @Param("title")String title);

  void deleteArticle(@Param("id")int id);

  List<Article> findAll();

  int updateArticle(@Param("id")int id, @Param("title") String title, @Param("body")String body, @Param("thumbImg") String thumbImg, @Param("updateDate")LocalDateTime updateDate);


  
  
}