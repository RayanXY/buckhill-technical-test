/* SEEDING */
-- Categories
INSERT INTO categories (uuid, title, slug)
VALUES ('category_uuid_1', 'Food', 'food'), ('category_uuid_2', 'Vitamins', 'vitamins');

-- Subcategories
INSERT INTO categories (uuid, title, slug, parent_category_id)
VALUES
	('subcategory_uuid_1', 'Dog', 'dog', 1), ('subcategory_uuid_2', 'Cat', 'cat', 1),
	('subcategory_uuid_3', 'Dog', 'dog', 2), ('subcategory_uuid_4', 'Cat', 'cat', 2);
	
-- Subcategories
INSERT INTO categories (uuid, title, slug, parent_category_id)
VALUES
	('subcategory_uuid_5', 'Dry Food', 'dry_food', 4), ('subcategory_uuid_6', 'Wet Food', 'wet_food', 4),
	('subcategory_uuid_7', 'Puppy Food', 'puppy_food', 4), ('subcategory_uuid_8', 'Adult Food', 'adult_food', 4),
	('subcategory_uuid_9', 'Dry Vitamins', 'dry_vitamins', 6), ('subcategory_uuid_10', 'Wet Vitamins', 'wet_vitamins', 6),
	('subcategory_uuid_11', 'Puppy Vitamins', 'puppy_vitamins', 6), ('subcategory_uuid_12', 'Adult Vitamins', 'adult_vitamins', 6);
	
-- Products
INSERT INTO products (category_id, uuid, title, price, description, metadata)
VALUES 
	(1, 'product_uuid_1', 'Product X', 30.00, 'Cat Premium Food', '{"weight": "3 kg"}'),
	(2, 'product_uuid_2', 'Product Y', 30.00, 'Cat Premium Vitamin', '{"weight": "0.5 kg"}');
	
-- Relation Table
INSERT INTO product_subcategory (product_id, subcategory_id) VALUES (1, 4), (2, 6);
INSERT INTO product_subcategory (product_id, subcategory_id) VALUES (1, 7), (2, 11);
