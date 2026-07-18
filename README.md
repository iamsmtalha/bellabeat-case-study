# Bellabeat Smart Device Usage Case Study

This case study analyzes Fitbit smart-device data to understand daily activity, sleep behavior, sedentary time, and user engagement patterns. The findings were applied to Bellabeat's app positioning and wellness marketing strategy.

## Business Objective

Bellabeat needed a high-level view of smart-device usage trends that could support product messaging, user engagement, and wellness-focused marketing recommendations.

## Tools

- Excel
- MySQL
- Power BI

## Data Source

The project uses the public FitBit Fitness Tracker dataset from Kaggle. The selected tables cover daily activity, sleep, hourly steps, hourly calories, hourly intensities, and weight logging.

## Repository Structure

sql/
  01_create_tables.sql
  02_clean_and_transform.sql
  03_analysis_queries.sql
  04_powerbi_views.sql

powerbi/
  powerbi_build_steps.md
  powerbi_dashboard_layout.md

README.md
```

## Project Workflow

The analysis started with file review and field validation in Excel. MySQL was used for table creation, cleaning, calculated fields, joins between activity and sleep tables, and analysis queries. Power BI was used for the final dashboard covering activity overview, usage patterns, sleep and wellness, and recommendations.

## Key Insights

- Users averaged around 7,638 steps per day.
- Average sedentary time was high, at around 991 minutes per day.
- Sleep tracking was less consistent than activity tracking.
- Activity level, sleep duration, and hourly movement patterns can support targeted wellness messaging.

## Recommendations

- Use reminders and app prompts to reduce long sedentary periods.
- Encourage more consistent sleep tracking through habit-based messaging.
- Segment users by activity level so Bellabeat can deliver more relevant wellness recommendations.
