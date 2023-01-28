select count(*) from yellow_taxi_trips 
where date_trunc('day', lpep_pickup_datetime) = '2019-01-15' 
	and date_trunc('day', lpep_dropoff_datetime) = '2019-01-15' 
limit 5;

select date_trunc('day', lpep_pickup_datetime) as pickup_day, max(trip_distance) as max_trip_distance
from yellow_taxi_trips
group by pickup_day
order by max_trip_distance desc
limit 1;

select passenger_count, count(*)
from yellow_taxi_trips
where date_trunc('day', lpep_pickup_datetime) = '2019-01-01' and passenger_count IN (2,3)
group by passenger_count;

select zdo."LocationID", zdo."Borough", zdo."Zone", max(tip_amount) as max_tip_amount
from yellow_taxi_trips  t
join zones zdo on t."DOLocationID" = zdo."LocationID"
join zones zpu on t."PULocationID" = zpu."LocationID"
where zpu."Zone" = 'Astoria'
group by zdo."LocationID", zdo."Borough", zdo."Zone"
order by max_tip_amount desc
limit 1;
