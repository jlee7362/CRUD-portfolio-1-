DROP DATABASE IF EXISTS springfolio;
CREATE DATABASE springfolio;
USE springfolio;

CREATE TABLE article (
  id INT PRIMARY KEY AUTO_INCREMENT,
  regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  title VARCHAR(200) NOT NULL,
  memberId INT NOT NULL
);

ALTER TABLE article
ADD thumbImg VARCHAR(255) DEFAULT NULL;

INSERT INTO article (title, memberId) VALUES
('제목1', 1), ('제목2', 2), ('제목3', 3);

SELECT * FROM article;


SELECT id, regDate, title, memberId
    FROM article
    ORDER BY id DESC