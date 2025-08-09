package com.example.demo.vo;

import lombok.Data;

@Data
public class Article {
  private int id;
  private String regDate;
  private String title;
  private int memberId;
}