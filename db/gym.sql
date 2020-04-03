DROP TABLE bookings;
DROP TABLE fitness_classes;
DROP TABLE members;


CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  membership VARCHAR(255)
);

CREATE TABLE fitness_classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  class_date DATE,
  start_time TIME,
  end_time TIME
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  fitness_class_id  INT REFERENCES fitness_classes(id),
  member_id INT REFERENCES members(id)
);
