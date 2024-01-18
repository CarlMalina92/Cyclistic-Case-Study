-- Calculating the number of rides per type

SELECT 
  member_casual,
  COUNT(*) as number_of_trips    
FROM `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
GROUP BY
  member_casual
ORDER BY
  member_casual

-- Analyze the number of trips per bike type and membership type

SELECT
  member_casual,
  rideable_type,
  COUNT(*) as number_of_trips
FROM
  `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
GROUP BY
  member_casual, rideable_type
ORDER BY
  member_casual, number_of_trips

-- Calculate the average ride length per membership type

SELECT
  member_casual,
  ROUND(AVG(TIME_DIFF(CAST(ended_at AS time), CAST(started_at AS time), second) / 60), 2) AS avg_duration_minutes
FROM
  `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
GROUP BY
  member_casual

-- Calculate the number of trips per day of week per member type

SELECT
  member_casual,
  EXTRACT(dayofweek FROM DATE(started_at)) AS day_of_week,
  FORMAT_DATE('%a', DATE(started_at)) as day_abbreviated,
  count(*) as num_trips
FROM
  `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
GROUP BY
  member_casual, day_of_week, day_abbreviated
ORDER BY
  member_casual, day_of_week

-- Calculate the number of trips per month per rider type

SELECT 
  member_casual,
  extract(month FROM DATE(started_at)) AS month,
  FORMAT_DATETIME('%b', DATETIME(started_at)) AS month_abbr,
  count(*) AS num_trips
FROM
  `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
GROUP BY
  member_casual, month, month_abbr
ORDER BY
  member_casual, month

-- Calculate the number of trips per rider tipe throughout the day

SELECT
  member_casual,
  extract(hour FROM DATETIME(started_at)) as hour_of_day,
  count(*) AS num_trips
FROM
  `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
GROUP BY
  member_casual, hour_of_day
ORDER BY
  member_casual, hour_of_day

-- Calculate the top 30 start stations per rider type

SELECT *
FROM ((SELECT
        member_casual,
        start_station_name,
        AVG(end_lat) AS ending_latitude,
        AVG(end_lng) AS ending_longitude,
        count(*) AS num_of_trips
      FROM
        `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
      WHERE
        member_casual = "casual"
      GROUP BY
        member_casual, start_station_name
      ORDER BY
        num_of_trips DESC
      LIMIT 30)

  UNION ALL

  (SELECT
        member_casual,
        start_station_name,
        AVG(end_lat) AS end_latitude,
        AVG(end_lng) AS end_longitude,
        count(*) AS num_of_trips
      FROM
        `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
      WHERE
        member_casual = "member"
      GROUP BY
        member_casual, start_station_name
      ORDER BY
        num_of_trips DESC
      LIMIT 30)
)

-- Calculate the top 30 end stations per rider type

SELECT *
FROM ((SELECT
        member_casual,
        end_station_name,
        AVG(end_lat) AS ending_latitude,
        AVG(end_lng) AS ending_longitude,
        count(*) AS num_of_trips
      FROM
        `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
      WHERE
        member_casual = "casual"
      GROUP BY
        member_casual, end_station_name
      ORDER BY
        num_of_trips DESC
      LIMIT 30)

  UNION ALL

  (SELECT
        member_casual,
        end_station_name,
        AVG(end_lat) AS end_latitude,
        AVG(end_lng) AS end_longitude,
        count(*) AS num_of_trips
      FROM
        `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
      WHERE
        member_casual = "member"
      GROUP BY
        member_casual, end_station_name
      ORDER BY
        num_of_trips DESC
      LIMIT 30)
)


-- Calculate the number of trips per day of week per member type

SELECT
  member_casual,
  #EXTRACT(dayofweek FROM DATE(started_at)) AS day_of_week,
  #FORMAT_DATE('%a', DATE(started_at)) as day_abbreviated,
  FORMAT_DATE("%u", DATE(started_at)) AS day_of_week,
  CASE 
    WHEN CAST(FORMAT_DATE("%u", DATE(started_at)) AS STRING) = "1" THEN 'Mon'
    WHEN CAST(FORMAT_DATE("%u", DATE(started_at)) AS STRING) = "2" THEN 'Tue'
    WHEN CAST(FORMAT_DATE("%u", DATE(started_at)) AS STRING) = "3" THEN 'Wed'
    WHEN CAST(FORMAT_DATE("%u", DATE(started_at)) AS STRING) = "4" THEN 'Thu'
    WHEN CAST(FORMAT_DATE("%u", DATE(started_at)) AS STRING) = "5" THEN 'Fri'
    WHEN CAST(FORMAT_DATE("%u", DATE(started_at)) AS STRING) = "6" THEN 'Sat'
    WHEN CAST(FORMAT_DATE("%u", DATE(started_at)) AS STRING) = "7" THEN 'Sun' END AS day_of_week_abbr,
  count(*) as num_trips
FROM
  `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.combined_data`
GROUP BY
  member_casual, day_of_week, day_of_week_abbr
ORDER BY
  member_casual, day_of_week