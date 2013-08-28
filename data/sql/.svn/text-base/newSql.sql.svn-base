ALTER TABLE pos_checkin ADD (pos_category_id INT COMMENT 'id identifies category', INDEX pos_category_id_idx (pos_category_id))
ALTER TABLE pos_comment ADD(pos_category_id INT COMMENT 'id identifies category', INDEX pos_category_id_idx (pos_category_id))
ALTER TABLE pos_follow ADD(pos_category_id INT COMMENT 'id identifies category', INDEX pos_category_id_idx (pos_category_id))
ALTER TABLE pos_photo ADD(pos_category_id INT COMMENT 'id identifies category', INDEX pos_category_id_idx (pos_category_id))
ALTER TABLE pos_rent_house ADD(const_price_ranges TINYINT COMMENT 'Khoảng giá trị của giá nhà cho thuê ')
ALTER TABLE pos_checkin ADD CONSTRAINT pos_checkin_pos_category_id_pos_category_id FOREIGN KEY (pos_category_id) REFERENCES pos_category(id) ON DELETE CASCADE
ALTER TABLE pos_comment ADD CONSTRAINT pos_comment_pos_category_id_pos_category_id FOREIGN KEY (pos_category_id) REFERENCES pos_category(id) ON DELETE CASCADE
ALTER TABLE pos_follow ADD CONSTRAINT pos_follow_pos_category_id_pos_category_id FOREIGN KEY (pos_category_id) REFERENCES pos_category(id) ON DELETE CASCADE
ALTER TABLE pos_photo ADD CONSTRAINT pos_photo_pos_category_id_pos_category_id FOREIGN KEY (pos_category_id) REFERENCES pos_category(id) ON DELETE CASCADE;
ALTER TABLE pos ADD (meta TEXT COMMENT 'Chứa các thông tin về title, description, address, tel, website của địa điểm');

/* add file_id for pos_category table */
ALTER TABLE pos_category ADD (file_id INT COMMENT 'File id', INDEX file_id_idx (file_id));
ALTER TABLE pos_category ADD CONSTRAINT pos_category_file_id_file_id FOREIGN KEY (file_id) REFERENCES file(id) ON DELETE CASCADE;

/* add posDeal table */
CREATE TABLE pos_deal (id INT AUTO_INCREMENT COMMENT 'id identifies pos deal', pos_id INT NOT NULL COMMENT 'id identifies pos', price FLOAT(18, 2) COMMENT 'Giá của sản phẩm', original_price FLOAT(18, 2) COMMENT 'Giá gốc của sản phẩm', save VARCHAR(10) COMMENT 'Tiết kiệm sau khi mua chung', num_buyers integer(1) COMMENT 'Số lượng người mua', link_news VARCHAR(200) COMMENT 'link tới trang chi tiết của sản phẩm', source VARCHAR(50) COMMENT 'id identifies category', expire_date DATETIME NOT NULL COMMENT 'ngày hết hạn mua chung', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pos_id_idx (pos_id), PRIMARY KEY(id)) COMMENT = '' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
ALTER TABLE pos_deal ADD CONSTRAINT pos_deal_pos_id_pos_id FOREIGN KEY (pos_id) REFERENCES pos(id) ON DELETE CASCADE;
ALTER TABLE pos_deal add(province VARCHAR(100) COMMENT 'Tình thành');
ALTER TABLE pos_deal add(status TINYINT DEFAULT 1 COMMENT 'còn bán => status = 1, hết hạn => status = 0, cháy hàng =>status = 2');
ALTER TABLE pos_deal add (image_show TEXT COMMENT 'Danh sách link ảnh của sản phẩm, mỗi link cách nhau bởi dấu một dấu ; ');
ALTER TABLE pos_deal add(sort_order INT COMMENT 'Thứ tự ưu tiên vị trí hiển thị của sản phẩm trên website');
ALTER TABLE pos_deal add(address VARCHAR(255) COMMENT 'Địa chỉ cung cấp sản phẩm', lat FLOAT(18, 2) COMMENT 'latitude theo google map', lng FLOAT(18, 2) COMMENT 'longitude theo google map');

/* add sql new 03/07/2011 */
Drop table pos_deal;
CREATE TABLE pos_event_category (id INT AUTO_INCREMENT COMMENT 'id identifies event category', name VARCHAR(100) NOT NULL COMMENT 'name of event category', description TEXT NOT NULL COMMENT 'des of event category ', file_id INT COMMENT 'File id', sort_order TINYINT DEFAULT 10, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX file_id_idx (file_id), PRIMARY KEY(id)) COMMENT = '' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE pos_event (id INT AUTO_INCREMENT COMMENT 'id identifies event', pos_id INT NOT NULL COMMENT 'id is of pos', member_id INT NOT NULL COMMENT 'id is member', pos_event_category_id INT NOT NULL COMMENT 'id is pos event category ', title VARCHAR(255) NOT NULL COMMENT 'title is of event', description TEXT COMMENT 'desc is of event', file_id INT COMMENT 'File id', start_time DATETIME NOT NULL COMMENT 'Ngày bắt đầu sự kiện', end_time DATETIME NOT NULL COMMENT 'Ngày kết thúc sự kiện', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pos_id_idx (pos_id), INDEX member_id_idx (member_id), INDEX file_id_idx (file_id), INDEX pos_event_category_id_idx (pos_event_category_id), PRIMARY KEY(id)) COMMENT = '' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE pos_event_checkin (id INT AUTO_INCREMENT COMMENT 'id identifies pos_checkin', pos_event_id INT NOT NULL COMMENT 'id identifies pos', member_id INT NOT NULL COMMENT 'id is of poster', status TINYINT DEFAULT '0' NOT NULL COMMENT 'status is of pos_checkin', is_public TINYINT DEFAULT '1' NOT NULL COMMENT 'trang thai of pos_checkin', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pos_event_id_idx (pos_event_id), INDEX member_id_idx (member_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE pos_event_comment (id INT AUTO_INCREMENT COMMENT 'id identifies pos_comment', pos_event_id INT NOT NULL COMMENT 'id identifies pos', content TEXT NOT NULL COMMENT 'content is of pos_comment', member_id INT NOT NULL COMMENT 'id is of poster', claim_status TINYINT COMMENT 'claim_status is of pos_comment', status TINYINT DEFAULT '0' NOT NULL COMMENT 'status is of pos_comment', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pos_event_id_idx (pos_event_id), INDEX member_id_idx (member_id), PRIMARY KEY(id)) COMMENT = '' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE pos_event_follow (id INT AUTO_INCREMENT COMMENT 'id identifies pos_follow', pos_event_id INT NOT NULL, member_id INT NOT NULL COMMENT 'id is of poster', status TINYINT DEFAULT '0' NOT NULL COMMENT 'status is of pos_follow', is_public TINYINT DEFAULT '1' NOT NULL COMMENT 'trang thai of pos_checkin', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pos_event_id_idx (pos_event_id), INDEX member_id_idx (member_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE pos_event_photo (id INT AUTO_INCREMENT COMMENT 'id identifies pos_photo', member_id INT NOT NULL COMMENT 'id is of poster', pos_event_id INT NOT NULL, file_id INT NOT NULL COMMENT 'File id', claim_status TINYINT COMMENT 'claim_status is of pos_photo', status TINYINT DEFAULT '0' NOT NULL, is_public TINYINT DEFAULT '1' NOT NULL, description TEXT COMMENT 'desc is of pos photo', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pos_event_id_idx (pos_event_id), INDEX member_id_idx (member_id), INDEX file_id_idx (file_id), PRIMARY KEY(id)) ENGINE = INNODB;

/* add code for posEventCategory table */
ALTER TABLE pos_event_category add(code VARCHAR(100) COMMENT 'code of pos event category' UNIQUE);

/* add file into posEvent Table */
ALTER TABLE pos_event add(lat FLOAT(18, 2) COMMENT 'latitude theo google map', lng FLOAT(18, 2) COMMENT 'longitude theo google map',website VARCHAR(255) NOT NULL COMMENT 'website of event', is_public TINYINT DEFAULT '1' NOT NULL, meta TEXT COMMENT 'Chứa các thông tin về title, description, address, tel, website của địa điểm', del_flag TINYINT DEFAULT 0 COMMENT 'Xóa : = 1', rank INT DEFAULT 0 COMMENT 'Xếp hạng sự kiện');

/* add file into PosEventComment Table */
ALTER TABLE pos_event_comment add( file_id INT COMMENT 'File id', website VARCHAR(255) COMMENT 'website is of pos');

/* add file into Posomment Table */
ALTER TABLE pos_comment add(file_id INT COMMENT 'File id', website VARCHAR(255) COMMENT 'website is of pos');