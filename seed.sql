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

INSERT INTO subcategory (code, title, description)
VALUES
('ID.AM-1', 'Inventario degli asset fisici', 'Gli asset fisici dell’organizzazione sono identificati e inventariati.'),
('ID.AM-2', 'Inventario di software e piattaforme', 'Le piattaforme software e applicative sono censite e mantenute aggiornate.'),
('PR.AC-1', 'Gestione delle identità e credenziali', 'Le identità e le credenziali sono gestite in modo controllato.'),
('DE.CM-1', 'Monitoraggio continuo', 'La rete e i sistemi sono monitorati per individuare eventi di cybersecurity.'),
('RC.RP-1', 'Pianificazione del ripristino', 'Le attività di ripristino sono pianificate e supportate da procedure definite.');

INSERT INTO control (code, name, description, control_type)
VALUES
('CTRL-001', 'Inventario centralizzato degli asset', 'Mantenimento di un registro aggiornato degli asset fisici e logici.', 'ORGANIZZATIVO'),
('CTRL-002', 'Censimento dei servizi digitali', 'Tracciamento dei servizi erogati e delle rispettive dipendenze.', 'ORGANIZZATIVO'),
('CTRL-003', 'Gestione autenticazione amministrativa', 'Applicazione di credenziali controllate e accessi amministrativi protetti.', 'TECNICO'),
('CTRL-004', 'Raccolta e revisione dei log', 'Acquisizione e controllo periodico dei log di sistema e di rete.', 'TECNICO'),
('CTRL-005', 'Procedure di backup e ripristino', 'Definizione di backup periodici e procedure di recovery.', 'PROCEDURALE');

INSERT INTO control_subcategory (control_id, subcategory_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO profile (organization_id, profile_name, profile_type, description)
VALUES
(1, 'Profilo Target 2025', 'TARGET', 'Profilo obiettivo definito sulla base dei controlli ritenuti necessari.'),
(1, 'Profilo Attuale 2025', 'CURRENT', 'Profilo rilevato sullo stato corrente di implementazione dei controlli.');

INSERT INTO profile_control (profile_id, control_id, implementation_level, maturity_level, notes)
VALUES
(1, 1, NULL, NULL, 'Controllo previsto nel profilo target.'),
(1, 2, NULL, NULL, 'Controllo previsto nel profilo target.'),
(1, 3, NULL, NULL, 'Controllo previsto nel profilo target.'),
(1, 4, NULL, NULL, 'Controllo previsto nel profilo target.'),
(1, 5, NULL, NULL, 'Controllo previsto nel profilo target.');

INSERT INTO profile_control (profile_id, control_id, implementation_level, maturity_level, notes)
VALUES
(2, 1, 'HIGH', 'DEFINED', 'Registro asset presente e aggiornato con buona regolarità.'),
(2, 2, 'MEDIUM', 'MANAGED', 'Servizi censiti ma con aggiornamento non sempre tempestivo.'),
(2, 3, 'MEDIUM', 'BASIC', 'Autenticazione amministrativa presente ma migliorabile.'),
(2, 4, 'LOW', 'INITIAL', 'Monitoraggio log parziale e non uniforme su tutti gli asset.'),
(2, 5, 'MEDIUM', 'MANAGED', 'Backup presenti, procedure di ripristino solo parzialmente formalizzate.');

INSERT INTO asset_control (asset_id, control_id, applicability_notes)
VALUES
(1, 1, 'Firewall incluso nel registro centralizzato degli asset.'),
(1, 3, 'Firewall soggetto a controllo sugli accessi amministrativi.'),
(1, 4, 'Firewall soggetto a monitoraggio e raccolta log.'),
(2, 1, 'Database server incluso nel registro centralizzato degli asset.'),
(2, 4, 'Database server soggetto a monitoraggio e revisione dei log.'),
(2, 5, 'Database server soggetto a backup e procedure di ripristino.'),
(3, 1, 'Application server incluso nel registro centralizzato degli asset.'),
(3, 2, 'Application server associato al censimento dei servizi digitali.'),
(4, 1, 'Router incluso nel registro centralizzato degli asset.'),
(4, 4, 'Router soggetto a monitoraggio continuo.'),
(5, 1, 'Storage appliance inclusa nel registro centralizzato degli asset.'),
(5, 5, 'Storage appliance coinvolta nelle procedure di backup e ripristino.');