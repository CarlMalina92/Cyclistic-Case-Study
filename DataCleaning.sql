# Data cleaning in SQL

# Combine the data from each month into one table that can be used for analysis

SELECT *
FROM (
  (SELECT 
        *
      FROM
        `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202301-divvy-tripdata`
    )
    
  UNION ALL

    (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202302-divvy-tripdata`
    )

  UNION ALL

    (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202303-divvy-tripdata`
    )

    UNION ALL

    (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202304-divvy-tripdata`
    )

  UNION ALL

  (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202305-divvy-tripdata`
    )

  UNION ALL

  (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202306-divvy-tripdata`
    )

  UNION ALL

  (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202307-divvy-tripdata`
    )

  UNION ALL

  (SELECT
    *
  FROM
    `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202308-divvy-tripdata`
    )

  UNION ALL

(SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202309-divvy-tripdata`
    )

  UNION ALL

  (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202310-divvy-tripdata`
    )

  UNION ALL

  (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202311-divvy-tripdata`
    )

  UNION ALL

  (SELECT
      *
    FROM
      `my-project-2023-10-13-401906.Cyclist_Montly_Data_2023.202312-divvy-tripdata`
    )
  ) 

WHERE
  ride_id is not NULL
  AND rideable_type is not NULL
  AND started_at is not NULL
  AND ended_at is not NULL
  AND start_station_name is not NULL
  AND start_station_id is not NULL
  AND end_station_name is not NULL
  AND end_station_id is not NULL
  AND start_lat is not NULL
  AND start_lng is not NULL
  AND end_lat is not NULL
  AND end_lng is not NULL
  AND member_casual is not NULL

ORDER BY
  started_at

-- The resulting table was saved as a separate table and used for analysis