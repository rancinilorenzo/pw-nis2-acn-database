CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
    sector VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE contact (
    contact_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(30),
    role_title VARCHAR(100),
    CONSTRAINT fk_contact_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON DELETE CASCADE
);

CREATE TABLE provider (
    provider_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    provider_type VARCHAR(50) NOT NULL,
    service_scope VARCHAR(150),
    CONSTRAINT fk_provider_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_provider_type
        CHECK (provider_type IN ('CLOUD', 'ISP', 'MAINTAINER', 'PARTNER'))
);

CREATE TABLE asset (
    asset_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    asset_type VARCHAR(50) NOT NULL,
    criticality VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    location VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_asset_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_asset_criticality
        CHECK (criticality IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),
    CONSTRAINT chk_asset_status
        CHECK (status IN ('ACTIVE', 'INACTIVE', 'MAINTENANCE'))
);

CREATE TABLE service (
    service_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    criticality VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_service_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_service_criticality
        CHECK (criticality IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),
    CONSTRAINT chk_service_status
        CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

CREATE TABLE service_asset (
    service_id INT NOT NULL,
    asset_id INT NOT NULL,
    PRIMARY KEY (service_id, asset_id),
    CONSTRAINT fk_service_asset_service
        FOREIGN KEY (service_id)
        REFERENCES service(service_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_service_asset_asset
        FOREIGN KEY (asset_id)
        REFERENCES asset(asset_id)
        ON DELETE CASCADE
);

CREATE TABLE service_dependency (
    dependency_id SERIAL PRIMARY KEY,
    service_id INT NOT NULL,
    provider_id INT NOT NULL,
    dependency_type VARCHAR(50) NOT NULL,
    notes TEXT,
    CONSTRAINT fk_dependency_service
        FOREIGN KEY (service_id)
        REFERENCES service(service_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dependency_provider
        FOREIGN KEY (provider_id)
        REFERENCES provider(provider_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_dependency_type
        CHECK (dependency_type IN ('HOSTING', 'CONNECTIVITY', 'MAINTENANCE', 'SECURITY', 'SOFTWARE'))
);

CREATE TABLE responsibility (
    responsibility_id SERIAL PRIMARY KEY,
    contact_id INT NOT NULL,
    asset_id INT,
    service_id INT,
    responsibility_role VARCHAR(50) NOT NULL,
    CONSTRAINT fk_responsibility_contact
        FOREIGN KEY (contact_id)
        REFERENCES contact(contact_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_responsibility_asset
        FOREIGN KEY (asset_id)
        REFERENCES asset(asset_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_responsibility_service
        FOREIGN KEY (service_id)
        REFERENCES service(service_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_responsibility_role
        CHECK (responsibility_role IN ('ASSET_OWNER', 'SERVICE_OWNER', 'TECHNICAL_CONTACT', 'SECURITY_CONTACT')),
    CONSTRAINT chk_asset_or_service
        CHECK (
            (asset_id IS NOT NULL AND service_id IS NULL)
            OR
            (asset_id IS NULL AND service_id IS NOT NULL)
        )
);

CREATE TABLE asset_history (
    history_id SERIAL PRIMARY KEY,
    asset_id INT NOT NULL,
    old_name VARCHAR(150),
    old_criticality VARCHAR(20),
    old_status VARCHAR(20),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_history_asset
        FOREIGN KEY (asset_id)
        REFERENCES asset(asset_id)
        ON DELETE CASCADE
);

CREATE INDEX idx_asset_criticality ON asset(criticality);
CREATE INDEX idx_service_criticality ON service(criticality);
CREATE INDEX idx_provider_type ON provider(provider_type);
CREATE INDEX idx_dependency_service ON service_dependency(service_id);