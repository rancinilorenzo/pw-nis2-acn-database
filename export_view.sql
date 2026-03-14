CREATE OR REPLACE VIEW vw_acn_profile_export AS
SELECT
    o.name AS organization_name,
    pfo.profile_name,
    pfo.profile_type,
    s.name AS service_name,
    s.criticality AS service_criticality,
    s.status AS service_status,
    a.name AS asset_name,
    a.asset_type,
    a.criticality AS asset_criticality,
    a.status AS asset_status,
    pr.name AS provider_name,
    pr.provider_type,
    sd.dependency_type,
    c.full_name AS contact_name,
    c.email AS contact_email,
    r.responsibility_role,
    ctr.code AS control_code,
    ctr.name AS control_name,
    ctr.control_type,
    pc.implementation_level,
    pc.maturity_level,
    sc.code AS subcategory_code,
    sc.title AS subcategory_title
FROM organization o
LEFT JOIN service s
    ON o.organization_id = s.organization_id
LEFT JOIN service_asset sa
    ON s.service_id = sa.service_id
LEFT JOIN asset a
    ON sa.asset_id = a.asset_id
LEFT JOIN service_dependency sd
    ON s.service_id = sd.service_id
LEFT JOIN provider pr
    ON sd.provider_id = pr.provider_id
LEFT JOIN responsibility r
    ON s.service_id = r.service_id
LEFT JOIN contact c
    ON r.contact_id = c.contact_id
LEFT JOIN profile pfo
    ON o.organization_id = pfo.organization_id
LEFT JOIN profile_control pc
    ON pfo.profile_id = pc.profile_id
LEFT JOIN control ctr
    ON pc.control_id = ctr.control_id
LEFT JOIN control_subcategory cs
    ON ctr.control_id = cs.control_id
LEFT JOIN subcategory sc
    ON cs.subcategory_id = sc.subcategory_id
LEFT JOIN asset_control ac
    ON a.asset_id = ac.asset_id
   AND ctr.control_id = ac.control_id
ORDER BY
    o.name,
    pfo.profile_type,
    pfo.profile_name,
    s.name,
    a.name,
    ctr.code,
    sc.code;