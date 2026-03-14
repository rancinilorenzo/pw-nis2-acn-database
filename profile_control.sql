CREATE TABLE profile_control (
  profile_id INT NOT NULL,
  control_id INT NOT NULL,
  implementation_level VARCHAR(50),
  maturity_level VARCHAR(50),
  notes TEXT,
  PRIMARY KEY (profile_id, control_id),
  CONSTRAINT fk_profile_control_profile
    FOREIGN KEY (profile_id) REFERENCES profile(profile_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_profile_control_control
    FOREIGN KEY (control_id) REFERENCES control(control_id)
    ON DELETE CASCADE
);