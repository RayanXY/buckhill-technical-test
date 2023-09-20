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
	
-- Products Subcategories
INSERT INTO product_subcategory (product_id, subcategory_id) VALUES (1, 4), (1, 7), (2, 6), (2, 11);

-- Users
INSERT INTO users (uuid, first_name, last_name, email, password, avatar, address, is_admin, is_marketing)
VALUES 
	('user_uuid_1', 'Rayan', 'Avelino', 'rayan@mail.com', 'user1', 'avatar_1', '123 St', 0, 0),
	('user_uuid_2', 'Gabriella', 'Lima', 'gabi@mail.com', 'user2', 'avatar_2', '456 St', 0, 0);
	
-- Payments
INSERT INTO payments (uuid, type, details)
VALUES 
  ('pay_uuid_1', 'Credit Card', '{"card_type": "Visa", "last_four": "1234"}'),
  ('pay_uuid_2', 'PayPal', '{"email": "example@example.com"}');
  
-- Orders Statuses
INSERT INTO orders_statuses (uuid, title) VALUES 
  ('os_uuid_1', 'Processing'),
  ('os_uuid_2', 'Shipped'); 
 
-- Orders
 INSERT INTO orders (user_id, payment_id, order_status_id, uuid, products, address, amount, delivery_fee, shipped_at) VALUES 
  (1, 1, 1, 'order_uuid_1', '{"product_id": 1}', '{"street": "123 St.", "city": "Natal", "country": "Brazil"}', 2000.00, 20.00, NULL),
  (2, 2, 2, 'order_uuid_2', '{"product_id": 2}', '{"street": "456 St.", "city": "Riacho de Santana", "country": "Brazil"}', 60.00, 10.00, NOW());
 
 
 
 
 
 
 
 
 
 
 
 