CREATE TABLE asset_control (
  asset_id INT NOT NULL,
  control_id INT NOT NULL,
  applicability_notes TEXT,
  PRIMARY KEY (asset_id, control_id),
  CONSTRAINT fk_asset_control_asset
    FOREIGN KEY (asset_id) REFERENCES asset(asset_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_asset_control_control
    FOREIGN KEY (control_id) REFERENCES control(control_id)
    ON DELETE CASCADE
);