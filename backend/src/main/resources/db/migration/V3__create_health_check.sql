CREATE TYPE hc_protocol AS ENUM ('HTTP', 'HTTPS', 'TCP');
CREATE TYPE hc_status AS ENUM ('HEALTHY', 'UNHEALTHY', 'UNKNOWN');

CREATE TABLE health_checks (
                               id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                               record_id UUID NOT NULL REFERENCES records(id) ON DELETE CASCADE,
                               endpoint VARCHAR(500) NOT NULL,
                               protocol hc_protocol NOT NULL DEFAULT 'HTTP',
                               interval_seconds INTEGER NOT NULL DEFAULT 30,
                               last_checked TIMESTAMP,
                               status hc_status NOT NULL DEFAULT 'UNKNOWN',
                               created_at TIMESTAMP DEFAULT now()
);