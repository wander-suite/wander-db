CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE trip(
  id serial PRIMARY KEY,
  user_id INT NOT NULL,
  trip_name VARCHAR(255) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  CONSTRAINT user_id_foreign_key FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE trip_access(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  trip_id INT NOT NULL,
  permission VARCHAR(255) NOT NULL,
  CONSTRAINT user_id_foreign_key FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT trip_id_foreign_key FOREIGN KEY(trip_id) REFERENCES trip(id) ON DELETE CASCADE
);

CREATE TABLE place(
  id SERIAL PRIMARY KEY,
  trip_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  link VARCHAR(4000), 
  note TEXT, 
  scheduled_time TIMESTAMP,
  cost DECIMAL(12,2),
  CONSTRAINT trip_id_foreign_key FOREIGN KEY(trip_id) REFERENCES trip(id) ON DELETE CASCADE
);

CREATE TABLE reservation_type(
  id SERIAL PRIMARY KEY,
  reservation VARCHAR(255) NOT NULL
);

INSERT INTO reservation_type(reservation)
VALUES ('flight'),
       ('car'),
       ('lodging'),
       ('bus'),
       ('train'),
       ('attachment');

CREATE TABLE reservation(
  id SERIAL PRIMARY KEY,
  place_id INT NOT NULL,
  type_id INT NOT NULL,
  CONSTRAINT place_id_foreign_key FOREIGN KEY(place_id) REFERENCES place(id) ON DELETE CASCADE,
  CONSTRAINT res_type_id_foreign_key FOREIGN KEY(type_id) REFERENCES reservation_type(id) ON DELETE CASCADE
);

CREATE TABLE note(
  id SERIAL PRIMARY KEY,
  trip_id INT NOT NULL,
  start_date DATE,
  content TEXT NOT NULL,
  CONSTRAINT trip_id_foreign_key FOREIGN KEY(trip_id) REFERENCES trip(id) ON DELETE CASCADE
);

CREATE TABLE checklist(
  id SERIAL PRIMARY KEY,
  trip_id INT NOT NULL,
  title TEXT NOT NULL,
  start_date DATE,
  end_date DATE,
  CONSTRAINT trip_id_foreign_key FOREIGN KEY(trip_id) REFERENCES trip(id) ON DELETE CASCADE
);

CREATE TABLE checklist_item(
  id SERIAL PRIMARY KEY,
  checklist_id INT NOT NULL,
  content TEXT NOT NULL,
  status VARCHAR(255) NOT NULL,
  CONSTRAINT checklist_id_foreign_key FOREIGN KEY(checklist_id) REFERENCES checklist(id) ON DELETE CASCADE
);