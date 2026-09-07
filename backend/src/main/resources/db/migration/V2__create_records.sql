CREATE TYPE record_type AS ENUM ('A', 'CNAME', 'MX', 'TXT', 'NS');

CREATE TABLE records (
                         id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         zone_id UUID NOT NULL REFERENCES zones(id) ON DELETE CASCADE,
                         name VARCHAR(253) NOT NULL,
                         type record_type NOT NULL,
                         value TEXT NOT NULL,
                         ttl INTEGER NOT NULL DEFAULT 300,
                         priority INTEGER,
                         healthy BOOLEAN DEFAULT true,
                         created_at TIMESTAMP DEFAULT now()
);