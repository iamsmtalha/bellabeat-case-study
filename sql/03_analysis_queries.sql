USE bellabeat_case_study;

-- Dataset coverage
SELECT
    COUNT(*) AS daily_records,
    COUNT(DISTINCT user_id) AS users,
    MIN(activity_date) AS first_date,
    MAX(activity_date) AS last_date
FROM daily_activity_clean;

-- Main daily activity summary
SELECT
    ROUND(AVG(total_steps), 0) AS avg_daily_steps,
    ROUND(AVG(calories), 0) AS avg_daily_calories,
    ROUND(AVG(sedentary_minutes), 0) AS avg_sedentary_minutes,
    ROUND(AVG(very_active_minutes + fairly_active_minutes + lightly_active_minutes), 0) AS avg_active_minutes
FROM daily_activity_clean;

-- User activity level distribution
SELECT
    activity_level,
    COUNT(*) AS days,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_of_days
FROM daily_activity_clean
GROUP BY activity_level
ORDER BY days DESC;

-- Average behavior by weekday
SELECT
    DAYNAME(activity_date) AS day_name,
    WEEKDAY(activity_date) AS weekday_num,
    ROUND(AVG(total_steps), 0) AS avg_steps,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(sedentary_minutes), 0) AS avg_sedentary_minutes
FROM daily_activity_clean
GROUP BY day_name, weekday_num
ORDER BY weekday_num;

-- Hourly activity pattern
SELECT
    hour_of_day,
    ROUND(AVG(step_total), 0) AS avg_steps
FROM hourly_steps_clean
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- Sleep and activity relationship
SELECT
    activity_level,
    COUNT(*) AS records_with_sleep,
    ROUND(AVG(total_minutes_asleep), 0) AS avg_minutes_asleep,
    ROUND(AVG(total_steps), 0) AS avg_steps,
    ROUND(AVG(calories), 0) AS avg_calories
FROM daily_activity_sleep
WHERE total_minutes_asleep IS NOT NULL
GROUP BY activity_level
ORDER BY avg_steps;

-- Device usage consistency by user
SELECT
    user_id,
    COUNT(*) AS days_tracked,
    ROUND(AVG(total_steps), 0) AS avg_steps,
    ROUND(AVG(calories), 0) AS avg_calories
FROM daily_activity_clean
GROUP BY user_id
ORDER BY days_tracked DESC, avg_steps DESC;

