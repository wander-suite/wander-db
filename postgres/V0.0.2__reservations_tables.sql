CREATE TABLE attachment(
  id SERIAL PRIMARY KEY,
  reservation_id INT,
  place_id INT,
  flight_id INT,
  car_id INT,
  lodging_id INT,
  bus_id INT,
  train_id INT,
  link_to_storage VARCHAR(4000) NOT NULL
);

CREATE TABLE flight(
  id SERIAL PRIMARY KEY,
  reservation_id INT NOT NULL,
  airline VARCHAR(255),
  flight_no VARCHAR(255) NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  confirmation_no VARCHAR(255),
  note TEXT,
  cost DECIMAL(12, 2),
  attachment_id INT,
  CONSTRAINT reservation_id_foreign_key FOREIGN KEY(reservation_id) REFERENCES reservation(id) ON DELETE CASCADE,
  CONSTRAINT attachment_id_foreign_key FOREIGN KEY(attachment_id) REFERENCES attachment(id)
);

CREATE TABLE car(
  id SERIAL PRIMARY KEY,
  reservation_id INT NOT NULL,
  company VARCHAR(255),
  pickup VARCHAR(255) NOT NULL,
  dropoff VARCHAR(255) NOT NULL,
  pickup_time TIMESTAMP NOT NULL,
  dropoff_time TIMESTAMP NOT NULL,
  confirmation_no VARCHAR(255),
  note TEXT,
  cost DECIMAL(12, 2),
  attachment_id INT,
  CONSTRAINT reservation_id_foreign_key FOREIGN KEY(reservation_id) REFERENCES reservation(id) ON DELETE CASCADE,
  CONSTRAINT attachment_id_foreign_key FOREIGN KEY(attachment_id) REFERENCES attachment(id)
);

CREATE TABLE lodging(
  id SERIAL PRIMARY KEY,
  reservation_id INT NOT NULL,
  hotel VARCHAR(255),
  checkin TIMESTAMP NOT NULL,
  checkout TIMESTAMP NOT NULL,
  confirmation_no VARCHAR(255),
  note TEXT,
  cost DECIMAL(12, 2),
  attachment_id INT,
  CONSTRAINT reservation_id_foreign_key FOREIGN KEY(reservation_id) REFERENCES reservation(id) ON DELETE CASCADE,
  CONSTRAINT attachment_id_foreign_key FOREIGN KEY(attachment_id) REFERENCES attachment(id)
);

CREATE TABLE bus(
  id SERIAL PRIMARY KEY,
  reservation_id INT NOT NULL,
  company VARCHAR(255),
  bus_no VARCHAR(255),
  origin VARCHAR(255) NOT NULL,
  destination VARCHAR(255) NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  confirmation_no VARCHAR(255),
  note TEXT,
  cost DECIMAL(12, 2),
  attachment_id INT,
  CONSTRAINT reservation_id_foreign_key FOREIGN KEY(reservation_id) REFERENCES reservation(id) ON DELETE CASCADE,
  CONSTRAINT attachment_id_foreign_key FOREIGN KEY(attachment_id) REFERENCES attachment(id)
);

CREATE TABLE train(
  id SERIAL PRIMARY KEY,
  reservation_id INT NOT NULL,
  company VARCHAR(255),
  train_no VARCHAR(255),
  origin VARCHAR(255) NOT NULL,
  destination VARCHAR(255) NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  confirmation_no VARCHAR(255),
  note TEXT,
  cost DECIMAL(12, 2),
  attachment_id INT,
  CONSTRAINT reservation_id_foreign_key FOREIGN KEY(reservation_id) REFERENCES reservation(id) ON DELETE CASCADE,
  CONSTRAINT attachment_id_foreign_key FOREIGN KEY(attachment_id) REFERENCES attachment(id)
);

ALTER TABLE attachment
  ADD CONSTRAINT reservation_id_foreign_key FOREIGN KEY(reservation_id) REFERENCES reservation(id) ON DELETE CASCADE,
  ADD CONSTRAINT place_id_foreign_key FOREIGN KEY(place_id) REFERENCES place(id) ON DELETE CASCADE,
  ADD CONSTRAINT flight_id_foreign_key FOREIGN KEY(flight_id) REFERENCES flight(id) ON DELETE CASCADE,
  ADD CONSTRAINT car_id_foreign_key FOREIGN KEY(car_id) REFERENCES car(id) ON DELETE CASCADE,
  ADD CONSTRAINT lodging_id_foreign_key FOREIGN KEY(lodging_id) REFERENCES lodging(id) ON DELETE CASCADE,
  ADD CONSTRAINT bus_id_foreign_key FOREIGN KEY(bus_id) REFERENCES bus(id) ON DELETE CASCADE,
  ADD CONSTRAINT train_id_foreign_key FOREIGN KEY(train_id) REFERENCES train(id) ON DELETE CASCADE;