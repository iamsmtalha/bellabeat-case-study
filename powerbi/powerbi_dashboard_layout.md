# Power BI Dashboard Layout

This layout document captures the final structure of the Bellabeat dashboard. The report was designed to move from high-level wellness metrics into activity behavior, sleep patterns, and marketing recommendations.

## Required Measures

Measures created in `vw_powerbi_daily_activity`:

```DAX
Users = DISTINCTCOUNT(vw_powerbi_daily_activity[user_id])

Average Steps = ROUND(AVERAGE(vw_powerbi_daily_activity[total_steps]), 0)

Average Calories = ROUND(AVERAGE(vw_powerbi_daily_activity[calories]), 0)

Average Sedentary Hours = ROUND(DIVIDE(AVERAGE(vw_powerbi_daily_activity[sedentary_minutes]), 60), 1)

Average Active Minutes = ROUND(AVERAGE(vw_powerbi_daily_activity[active_minutes]), 0)

Tracked Days = COUNTROWS(vw_powerbi_daily_activity)
```

Measure created in `vw_powerbi_daily_activity_sleep`:

```DAX
Average Sleep Hours = ROUND(AVERAGE(vw_powerbi_daily_activity_sleep[sleep_hours]), 1)
```

## Page 1: Overview

The overview page presents the core smart-device usage metrics.

### KPI Cards

| Card | Field |
|---|---|
| Users | `Users` |
| Avg Steps | `Average Steps` |
| Avg Calories | `Average Calories` |
| Avg Sedentary Hours | `Average Sedentary Hours` |
| Avg Active Minutes | `Average Active Minutes` |
| Avg Sleep Hours | `Average Sleep Hours` |

### Visuals

- Activity Level Distribution: donut chart using `activity_level`.
- Average Steps by Weekday: column chart using `day_name` and `avg_steps`.
- Daily Step Trend: line chart using `activity_date` and average `total_steps`.

## Page 2: Activity Patterns

This page focuses on when users are most active and how activity differs by behavior segment.

### Visuals

- Average Steps by Hour: line chart using `hour_of_day` and `avg_steps`.
- Average Calories by Weekday: column chart using `day_name` and `avg_calories`.
- Active Minutes by Activity Level: bar chart using `activity_level` and average `active_minutes`.
- Sedentary Minutes by Activity Level: bar chart using `activity_level` and average `sedentary_minutes`.

## Page 3: Sleep & Wellness

This page connects sleep behavior with activity patterns.

### Visuals

- Average Sleep Hours by Activity Level: bar chart using `activity_level` and `avg_sleep_hours`.
- Steps vs Sleep Hours: scatter chart using `total_steps`, `sleep_hours`, `user_id`, and `activity_level`.
- KPI cards for sleep hours, sedentary hours, and sleep tracking users.

## Page 4: Recommendations

The recommendations page summarizes the business actions from the analysis:

1. Position Bellabeat as a holistic wellness companion, not only a step tracker.
2. Use movement reminders for users with high sedentary time.
3. Time motivational messages around 12 PM and 5 PM to 7 PM.
4. Encourage more consistent sleep tracking.
5. Create weekly wellness summaries combining steps, sleep, sedentary time, hydration, and mindfulness.

## Formatting Notes

- Page size: 16:9
- Background: light gray
- Card background: white
- Primary visual color: teal
- Accent color: coral or soft pink
- Font: Segoe UI
- Layout style: clean, compact, and business-focused
