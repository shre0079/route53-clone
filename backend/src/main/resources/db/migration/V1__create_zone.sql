CREATE TABLE users (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password_hash VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE zones (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       name VARCHAR(253) UNIQUE NOT NULL,
                       description TEXT,
                       owner_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
                       created_at TIMESTAMP DEFAULT now()
);