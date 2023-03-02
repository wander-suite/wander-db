ALTER TABLE attachment
ADD CONSTRAINT only_one_column_is_not_null
CHECK
( 
  (reservation_id IS NOT NULL)::integer + (place_id IS NOT NULL)::integer + (flight_id IS NOT NULL)::integer + (car_id IS NOT NULL)::integer + (lodging_id IS NOT NULL)::integer + (bus_id IS NOT NULL)::integer + (train_id IS NOT NULL)::integer = 1 
);
