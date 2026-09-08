CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tasks (title, description) VALUES
('Initialize 3-Tier Architecture', 'Set up React frontend, FastAPI backend, and PostgreSQL database'),
('Learn DevOps Concepts', 'Master Docker, Kubernetes, Terraform, CI/CD, and GitOps');
