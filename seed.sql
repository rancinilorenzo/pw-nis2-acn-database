INSERT INTO organization (name, sector)
VALUES ('ACME Health Services', 'Healthcare');

INSERT INTO contact (organization_id, full_name, email, phone, role_title)
VALUES
(1, 'Mario Rossi', 'mario.rossi@acme.local', '+39-0744-100001', 'IT Manager'),
(1, 'Lucia Bianchi', 'lucia.bianchi@acme.local', '+39-0744-100002', 'Security Officer'),
(1, 'Paolo Verdi', 'paolo.verdi@acme.local', '+39-0744-100003', 'Infrastructure Administrator'),
(1, 'Sara Neri', 'sara.neri@acme.local', '+39-0744-100004', 'Service Manager');

INSERT INTO provider (organization_id, name, provider_type, service_scope)
VALUES
(1, 'CloudItalia', 'CLOUD', 'Virtual infrastructure hosting'),
(1, 'FiberNet', 'ISP', 'Internet connectivity'),
(1, 'SecureOps', 'MAINTAINER', 'Security monitoring and maintenance');

INSERT INTO asset (organization_id, name, asset_type, criticality, status, location, description)
VALUES
(1, 'FW-EDGE-01', 'FIREWALL', 'CRITICAL', 'ACTIVE', 'Primary Datacenter', 'Perimeter firewall'),
(1, 'SRV-DB-01', 'DATABASE_SERVER', 'CRITICAL', 'ACTIVE', 'Primary Datacenter', 'PostgreSQL production server'),
(1, 'VM-APP-01', 'APPLICATION_SERVER', 'HIGH', 'ACTIVE', 'Primary Datacenter', 'Application virtual machine'),
(1, 'RTR-BRANCH-01', 'ROUTER', 'MEDIUM', 'ACTIVE', 'Branch Office', 'Branch connectivity router'),
(1, 'BKP-NAS-01', 'STORAGE', 'HIGH', 'MAINTENANCE', 'Secondary Site', 'Backup storage appliance');

INSERT INTO service (organization_id, name, criticality, status, description)
VALUES
(1, 'Electronic Health Record', 'CRITICAL', 'ACTIVE', 'Clinical data management platform'),
(1, 'Corporate Email', 'HIGH', 'ACTIVE', 'Internal and external email service'),
(1, 'Remote VPN Access', 'HIGH', 'ACTIVE', 'Secure remote access for staff');

INSERT INTO service_asset (service_id, asset_id)
VALUES
(1, 2),
(1, 3),
(2, 3),
(3, 1),
(3, 4);

INSERT INTO service_dependency (service_id, provider_id, dependency_type, notes)
VALUES
(1, 1, 'HOSTING', 'Hosted virtual infrastructure for medical platform'),
(2, 2, 'CONNECTIVITY', 'Internet access required for mail flow'),
(3, 2, 'CONNECTIVITY', 'ISP connectivity for VPN access'),
(3, 3, 'SECURITY', 'Managed monitoring for VPN security events');

INSERT INTO responsibility (contact_id, asset_id, service_id, responsibility_role)
VALUES
(1, 1, NULL, 'ASSET_OWNER'),
(3, 2, NULL, 'TECHNICAL_CONTACT'),
(2, NULL, 3, 'SECURITY_CONTACT'),
(4, NULL, 1, 'SERVICE_OWNER'),
(4, NULL, 2, 'SERVICE_OWNER');