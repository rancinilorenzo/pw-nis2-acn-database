CREATE TABLE profile (
    profile_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    profile_name VARCHAR(150) NOT NULL,
    profile_type VARCHAR(20) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_profile_organization
        FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_profile_type
        CHECK (profile_type IN ('TARGET', 'CURRENT'))
);