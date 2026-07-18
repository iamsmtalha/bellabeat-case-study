USE bellabeat_case_study;

CREATE OR REPLACE VIEW vw_powerbi_daily_activity AS
SELECT
    user_id,
    activity_date,
    DAYNAME(activity_date) AS day_name,
    WEEKDAY(activity_date) AS weekday_num,
    total_steps,
    total_distance,
    very_active_minutes,
    fairly_active_minutes,
    lightly_active_minutes,
    sedentary_minutes,
    very_active_minutes + fairly_active_minutes + lightly_active_minutes AS active_minutes,
    calories,
    activity_level
FROM daily_activity_clean;

CREATE OR REPLACE VIEW vw_powerbi_daily_activity_sleep AS
SELECT
    user_id,
    activity_date,
    day_name,
    WEEKDAY(activity_date) AS weekday_num,
    total_steps,
    total_distance,
    very_active_minutes,
    fairly_active_minutes,
    lightly_active_minutes,
    sedentary_minutes,
    very_active_minutes + fairly_active_minutes + lightly_active_minutes AS active_minutes,
    calories,
    activity_level,
    total_minutes_asleep,
    ROUND(total_minutes_asleep / 60, 2) AS sleep_hours,
    total_time_in_bed,
    minutes_awake_in_bed
FROM daily_activity_sleep;

CREATE OR REPLACE VIEW vw_powerbi_weekday_summary AS
SELECT
    DAYNAME(activity_date) AS day_name,
    WEEKDAY(activity_date) AS weekday_num,
    ROUND(AVG(total_steps), 0) AS avg_steps,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(sedentary_minutes), 0) AS avg_sedentary_minutes,
    ROUND(AVG(very_active_minutes + fairly_active_minutes + lightly_active_minutes), 0) AS avg_active_minutes
FROM daily_activity_clean
GROUP BY day_name, weekday_num;

CREATE OR REPLACE VIEW vw_powerbi_hourly_steps AS
SELECT
    hour_of_day,
    ROUND(AVG(step_total), 0) AS avg_steps
FROM hourly_steps_clean
GROUP BY hour_of_day;

CREATE OR REPLACE VIEW vw_powerbi_sleep_by_activity AS
SELECT
    activity_level,
    COUNT(*) AS records_with_sleep,
    ROUND(AVG(total_minutes_asleep), 0) AS avg_minutes_asleep,
    ROUND(AVG(total_minutes_asleep) / 60, 2) AS avg_sleep_hours,
    ROUND(AVG(total_steps), 0) AS avg_steps,
    ROUND(AVG(calories), 0) AS avg_calories
FROM daily_activity_sleep
WHERE total_minutes_asleep IS NOT NULL
GROUP BY activity_level;

CREATE OR REPLACE VIEW vw_powerbi_user_summary AS
SELECT
    user_id,
    COUNT(*) AS days_tracked,
    ROUND(AVG(total_steps), 0) AS avg_steps,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(sedentary_minutes), 0) AS avg_sedentary_minutes,
    ROUND(AVG(very_active_minutes + fairly_active_minutes + lightly_active_minutes), 0) AS avg_active_minutes
FROM daily_activity_clean
GROUP BY user_id;

