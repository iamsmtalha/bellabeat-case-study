# Power BI Build Notes

This document summarizes the Power BI build approach used for the Bellabeat Smart Device Usage case study. The dashboard was built from SQL-prepared views and designed to communicate activity, sleep, sedentary behavior, and wellness recommendations.

## Data Connection

The Power BI model was designed around prepared MySQL views from the `bellabeat_case_study` database:

- `vw_powerbi_daily_activity`
- `vw_powerbi_daily_activity_sleep`
- `vw_powerbi_weekday_summary`
- `vw_powerbi_hourly_steps`
- `vw_powerbi_sleep_by_activity`
- `vw_powerbi_user_summary`

the same view outputs were exported as tab-delimited files and imported through the Text/CSV connector.

## Data Type Review

Key fields were checked after import to keep chart behavior and aggregations accurate:

| Field | Type |
|---|---|
| `activity_date` | Date |
| `weekday_num` | Whole number |
| `hour_of_day` | Whole number |
| `total_steps` | Whole number |
| `calories` | Whole number |
| `sedentary_minutes` | Whole number |
| `active_minutes` | Whole number |
| `sleep_hours` | Decimal number |
| `activity_level` | Text |

## Dashboard Measures

```DAX
Users = DISTINCTCOUNT(vw_powerbi_daily_activity[user_id])

Average Steps = ROUND(AVERAGE(vw_powerbi_daily_activity[total_steps]), 0)

Average Calories = ROUND(AVERAGE(vw_powerbi_daily_activity[calories]), 0)

Average Sedentary Hours = ROUND(DIVIDE(AVERAGE(vw_powerbi_daily_activity[sedentary_minutes]), 60), 1)

Average Active Minutes = ROUND(AVERAGE(vw_powerbi_daily_activity[active_minutes]), 0)

Average Sleep Hours = ROUND(AVERAGE(vw_powerbi_daily_activity_sleep[sleep_hours]), 1)

Tracked Days = COUNTROWS(vw_powerbi_daily_activity)
```

## Report Pages

### Overview

The overview page summarizes user count, average steps, calories, active minutes, sedentary hours, sleep hours, activity-level distribution, weekday step behavior, and daily step trends.

### Activity Patterns

The activity page focuses on hourly step behavior, weekday calorie patterns, active minutes by activity level, and sedentary minutes by activity level.

### Sleep and Wellness

The sleep page connects sleep tracking with activity behavior. It includes average sleep hours by activity level, a steps-vs-sleep scatter plot, and sleep tracking user counts.

### Recommendations

The final page translates the analysis into marketing recommendations for Bellabeat's app positioning and wellness engagement strategy.

## Design Direction

The dashboard uses a clean, light analytical layout with short titles, KPI cards, simple chart types, and a soft wellness-focused color palette.
