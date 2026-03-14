-- QUERY 1: Asset critici
SELECT asset_id, name, asset_type, criticality, status, location
FROM asset
WHERE criticality IN ('HIGH', 'CRITICAL')
ORDER BY criticality DESC, name;


-- QUERY 2: Servizi attivi
SELECT service_id, name, criticality, status, description
FROM service
WHERE status = 'ACTIVE'
ORDER BY name;


-- QUERY 3: Servizi con asset associati
SELECT 
    s.name AS service_name,
    a.name AS asset_name,
    a.asset_type,
    a.criticality
FROM service s
JOIN service_asset sa ON s.service_id = sa.service_id
JOIN asset a ON sa.asset_id = a.asset_id
ORDER BY s.name, a.name;


-- QUERY 4: Servizi con dipendenze esterne
SELECT
    s.name AS service_name,
    p.name AS provider_name,
    p.provider_type,
    sd.dependency_type,
    sd.notes
FROM service s
JOIN service_dependency sd ON s.service_id = sd.service_id
JOIN provider p ON sd.provider_id = p.provider_id
ORDER BY s.name, p.name;


-- QUERY 5: Punti di contatto e responsabilità
SELECT
    c.full_name,
    c.email,
    c.role_title,
    r.responsibility_role,
    a.name AS asset_name,
    s.name AS service_name
FROM responsibility r
JOIN contact c ON r.contact_id = c.contact_id
LEFT JOIN asset a ON r.asset_id = a.asset_id
LEFT JOIN service s ON r.service_id = s.service_id
ORDER BY c.full_name;


-- QUERY 6: Vista completa utile per report
SELECT
    s.name AS service_name,
    s.criticality AS service_criticality,
    a.name AS asset_name,
    a.asset_type,
    a.criticality AS asset_criticality,
    p.name AS provider_name,
    p.provider_type,
    c.full_name AS contact_name,
    c.email,
    r.responsibility_role
FROM service s
LEFT JOIN service_asset sa ON s.service_id = sa.service_id
LEFT JOIN asset a ON sa.asset_id = a.asset_id
LEFT JOIN service_dependency sd ON s.service_id = sd.service_id
LEFT JOIN provider p ON sd.provider_id = p.provider_id
LEFT JOIN responsibility r ON s.service_id = r.service_id
LEFT JOIN contact c ON r.contact_id = c.contact_id
ORDER BY s.name, a.name;


-- QUERY 7: Controlli inclusi nel profilo target
SELECT
    p.profile_name,
    c.code AS control_code,
    c.name AS control_name,
    c.control_type
FROM profile p
JOIN profile_control pc ON p.profile_id = pc.profile_id
JOIN control c ON pc.control_id = c.control_id
WHERE p.profile_type = 'TARGET'
ORDER BY p.profile_name, c.code;


-- QUERY 8: Stato dei controlli nel profilo attuale
SELECT
    p.profile_name,
    c.code AS control_code,
    c.name AS control_name,
    pc.implementation_level,
    pc.maturity_level,
    pc.notes
FROM profile p
JOIN profile_control pc ON p.profile_id = pc.profile_id
JOIN control c ON pc.control_id = c.control_id
WHERE p.profile_type = 'CURRENT'
ORDER BY c.code;


-- QUERY 9: Controlli associati agli asset
SELECT
    a.name AS asset_name,
    a.asset_type,
    c.code AS control_code,
    c.name AS control_name,
    ac.applicability_notes
FROM asset a
JOIN asset_control ac ON a.asset_id = ac.asset_id
JOIN control c ON ac.control_id = c.control_id
ORDER BY a.name, c.code;


-- QUERY 10: Mapping completo controllo, subcategory e asset
SELECT
    c.code AS control_code,
    c.name AS control_name,
    s.code AS subcategory_code,
    s.title AS subcategory_title,
    a.name AS asset_name
FROM control c
JOIN control_subcategory cs ON c.control_id = cs.control_id
JOIN subcategory s ON cs.subcategory_id = s.subcategory_id
LEFT JOIN asset_control ac ON c.control_id = ac.control_id
LEFT JOIN asset a ON ac.asset_id = a.asset_id
ORDER BY c.code, s.code, a.name;