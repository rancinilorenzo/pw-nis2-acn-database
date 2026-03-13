CREATE OR REPLACE VIEW vw_acn_profile_export AS
SELECT
    o.name AS organization_name,
    s.name AS service_name,
    s.criticality AS service_criticality,
    s.status AS service_status,
    a.name AS asset_name,
    a.asset_type,
    a.criticality AS asset_criticality,
    a.status AS asset_status,
    p.name AS provider_name,
    p.provider_type,
    sd.dependency_type,
    c.full_name AS contact_name,
    c.email AS contact_email,
    r.responsibility_role
FROM organization o
LEFT JOIN service s
    ON o.organization_id = s.organization_id
LEFT JOIN service_asset sa
    ON s.service_id = sa.service_id
LEFT JOIN asset a
    ON sa.asset_id = a.asset_id
LEFT JOIN service_dependency sd
    ON s.service_id = sd.service_id
LEFT JOIN provider p
    ON sd.provider_id = p.provider_id
LEFT JOIN responsibility r
    ON s.service_id = r.service_id
LEFT JOIN contact c
    ON r.contact_id = c.contact_id
ORDER BY o.name, s.name, a.name;