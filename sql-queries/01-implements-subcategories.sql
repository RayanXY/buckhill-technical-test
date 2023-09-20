/* UPDATES */
ALTER TABLE categories
ADD COLUMN parent_category_id BIGINT UNSIGNED,
ADD FOREIGN KEY(parent_category_id) REFERENCES categories(id);

/* NEW TABLE */
CREATE TABLE product_subcategory (
	product_id BIGINT UNSIGNED NOT NULL,
  subcategory_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (product_id, subcategory_id),
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (subcategory_id) REFERENCES categories(id)
);
