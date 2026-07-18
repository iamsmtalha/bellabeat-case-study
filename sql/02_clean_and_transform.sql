USE bellabeat_case_study;

DROP TABLE IF EXISTS daily_activity_clean;
CREATE TABLE daily_activity_clean AS
SELECT
    Id AS user_id,
    STR_TO_DATE(ActivityDate, '%m/%d/%Y') AS activity_date,
    TotalSteps AS total_steps,
    TotalDistance AS total_distance,
    VeryActiveMinutes AS very_active_minutes,
    FairlyActiveMinutes AS fairly_active_minutes,
    LightlyActiveMinutes AS lightly_active_minutes,
    SedentaryMinutes AS sedentary_minutes,
    Calories AS calories,
    CASE
        WHEN TotalSteps < 5000 THEN 'Low activity'
        WHEN TotalSteps < 7500 THEN 'Lightly active'
        WHEN TotalSteps < 10000 THEN 'Moderately active'
        ELSE 'Highly active'
    END AS activity_level
FROM daily_activity_raw;

DROP TABLE IF EXISTS sleep_day_clean;
CREATE TABLE sleep_day_clean AS
SELECT
    Id AS user_id,
    DATE(STR_TO_DATE(SleepDay, '%m/%d/%Y %r')) AS sleep_date,
    TotalSleepRecords AS total_sleep_records,
    TotalMinutesAsleep AS total_minutes_asleep,
    TotalTimeInBed AS total_time_in_bed,
    TotalTimeInBed - TotalMinutesAsleep AS minutes_awake_in_bed
FROM (
    SELECT DISTINCT
        Id,
        SleepDay,
        TotalSleepRecords,
        TotalMinutesAsleep,
        TotalTimeInBed
    FROM sleep_day_raw
) deduped_sleep;

DROP TABLE IF EXISTS hourly_steps_clean;
CREATE TABLE hourly_steps_clean AS
SELECT
    Id AS user_id,
    STR_TO_DATE(ActivityHour, '%m/%d/%Y %r') AS activity_hour,
    HOUR(STR_TO_DATE(ActivityHour, '%m/%d/%Y %r')) AS hour_of_day,
    StepTotal AS step_total
FROM hourly_steps_raw;

DROP TABLE IF EXISTS hourly_calories_clean;
CREATE TABLE hourly_calories_clean AS
SELECT
    Id AS user_id,
    STR_TO_DATE(ActivityHour, '%m/%d/%Y %r') AS activity_hour,
    HOUR(STR_TO_DATE(ActivityHour, '%m/%d/%Y %r')) AS hour_of_day,
    Calories AS calories
FROM hourly_calories_raw;

DROP TABLE IF EXISTS hourly_intensities_clean;
CREATE TABLE hourly_intensities_clean AS
SELECT
    Id AS user_id,
    STR_TO_DATE(ActivityHour, '%m/%d/%Y %r') AS activity_hour,
    HOUR(STR_TO_DATE(ActivityHour, '%m/%d/%Y %r')) AS hour_of_day,
    TotalIntensity AS total_intensity,
    AverageIntensity AS average_intensity
FROM hourly_intensities_raw;

DROP TABLE IF EXISTS daily_activity_sleep;
CREATE TABLE daily_activity_sleep AS
SELECT
    a.user_id,
    a.activity_date,
    DAYNAME(a.activity_date) AS day_name,
    a.total_steps,
    a.total_distance,
    a.very_active_minutes,
    a.fairly_active_minutes,
    a.lightly_active_minutes,
    a.sedentary_minutes,
    a.calories,
    a.activity_level,
    s.total_minutes_asleep,
    s.total_time_in_bed,
    s.minutes_awake_in_bed
FROM daily_activity_clean a
LEFT JOIN sleep_day_clean s
    ON a.user_id = s.user_id
    AND a.activity_date = s.sleep_date;
