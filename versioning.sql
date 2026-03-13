CREATE OR REPLACE FUNCTION log_asset_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO asset_history (asset_id, old_name, old_criticality, old_status, changed_at)
    VALUES (OLD.asset_id, OLD.name, OLD.criticality, OLD.status, CURRENT_TIMESTAMP);

    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_asset_update ON asset;

CREATE TRIGGER trg_asset_update
BEFORE UPDATE ON asset
FOR EACH ROW
EXECUTE FUNCTION log_asset_update();