CREATE DATABASE IF NOT EXISTS springfolio CHARACTER SET utf8mb4;
USE springfolio;

CREATE TABLE article (
  id INT PRIMARY KEY AUTO_INCREMENT,
  regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  title VARCHAR(200) NOT NULL,
  memberId INT NOT NULL
);

INSERT INTO article (title, memberId) VALUES
('제목1', 1), ('제목2', 2), ('제목3', 3);

SELECT * FROM article;

INSERT INTO article (title, memberId) VALUES
('제목4', 4), ('제목5', 5), ('제목6', 6);

SELECT id, regDate, title, memberId
    FROM article
    ORDER BY id DESC