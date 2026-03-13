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