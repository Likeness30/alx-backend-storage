-- This script creates a table `users` with the following requirements
-- attributes
    -- `id`: integer, auto increment, not null
    -- `email`: string (255 characters), not null, unique
    -- `name`: string (255)

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255)
);
