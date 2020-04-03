DROP TABLE bookings;
DROP TABLE fitness_classes;
DROP TABLE members;


CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  membership VARCHAR(255)
);

CREATE TABLE fitness_classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  class_day VARCHAR(255),
  start_time VARCHAR(255),
  end_time VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  fitness_class_id  INT REFERENCES fitness_classes(id),
  member_id INT REFERENCES members(id)
);
