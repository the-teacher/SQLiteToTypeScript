CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY,
  login TEXT NOT NULL,
  phone TEXT NOT NULL,
  premium BOOLEAN NOT NULL CHECK (premium IN (0, 1)),
  balance NUMERIC DEFAULT 0.00 NOT NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  tags TEXT DEFAULT '[]',
  preferences TEXT DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS orders (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  order_date DATETIME NOT NULL,
  amount NUMERIC NOT NULL,
  status TEXT CHECK (status IN ('pending', 'completed', 'canceled')) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  price NUMERIC NOT NULL,
  category TEXT NOT NULL,
  stock INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS order_items (
  id INTEGER PRIMARY KEY,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  total_price NUMERIC NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
);

INSERT INTO users (login, phone, premium, balance, createdAt, updatedAt, tags, preferences) VALUES
('john_doe', '1234567890', 1, 100.00, '2024-12-25 10:00:00', '2024-12-25 10:00:00', '["sports", "books"]', '{"theme":"dark"}'),
('jane_smith', '0987654321', 0, 50.00, '2024-12-25 11:00:00', '2024-12-25 11:00:00', '["travel"]', '{"notifications":true}'),
('alice_wonder', '5555555555', 1, 200.00, '2024-12-25 12:00:00', '2024-12-25 12:00:00', '[]', '{}'),
('bob_builder', '3333333333', 0, 75.50, '2024-12-25 13:00:00', '2024-12-25 13:00:00', '["tools", "diy"]', '{"currency":"usd"}'),
('eva_green', '7777777777', 1, 300.00, '2024-12-25 14:00:00', '2024-12-25 14:00:00', '["fashion"]', '{"locale":"en"}');

INSERT INTO products (name, price, category, stock) VALUES
('Laptop', 1000.00, 'electronics', 5),
('Headphones', 50.00, 'electronics', 20),
('Chair', 150.00, 'furniture', 10),
('Table', 200.00, 'furniture', 8),
('Shoes', 80.00, 'fashion', 15),
('T-shirt', 20.00, 'fashion', 30),
('Book', 15.00, 'books', 50),
('Pen', 2.00, 'stationery', 100);

INSERT INTO orders (user_id, order_date, amount, status) VALUES
(1, '2024-12-24 09:00:00', 1050.00, 'completed'),
(2, '2024-12-24 10:00:00', 70.00, 'completed'),
(3, '2024-12-24 11:00:00', 200.00, 'pending'),
(4, '2024-12-24 12:00:00', 15.00, 'completed'),
(5, '2024-12-24 13:00:00', 300.00, 'canceled');

INSERT INTO order_items (order_id, product_id, quantity, total_price) VALUES
(1, 1, 1, 1000.00),
(1, 2, 1, 50.00),
(2, 5, 1, 80.00),
(2, 6, 2, 40.00),
(3, 3, 1, 150.00),
(4, 7, 1, 15.00),
(5, 4, 1, 200.00);
