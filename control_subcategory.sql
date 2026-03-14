CREATE TABLE control_subcategory (
  control_id INT NOT NULL,
  subcategory_id INT NOT NULL,
  PRIMARY KEY (control_id, subcategory_id),
  CONSTRAINT fk_control_subcategory_control
    FOREIGN KEY (control_id) REFERENCES control(control_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_control_subcategory_subcategory
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
    ON DELETE CASCADE
);