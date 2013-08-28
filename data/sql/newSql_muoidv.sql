CREATE TABLE pos_sponsor (id INT AUTO_INCREMENT COMMENT 'id identifies pos_sponsor', pos_id INT NOT NULL COMMENT 'id identifies pos', member_id INT NOT NULL COMMENT 'id is of poster', expire_date DATETIME NOT NULL COMMENT 'ngày hết hạn tài trợ', position VARCHAR(255), sort_order INT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pos_id_idx (pos_id), INDEX member_id_idx (member_id), PRIMARY KEY(id)) COMMENT = '' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
ALTER TABLE pos_sponsor ADD CONSTRAINT pos_sponsor_pos_id_pos_id FOREIGN KEY (pos_id) REFERENCES pos(id) ON DELETE CASCADE;
ALTER TABLE pos_sponsor ADD CONSTRAINT pos_sponsor_member_id_member_id FOREIGN KEY (member_id) REFERENCES member(id) ON DELETE CASCADE;