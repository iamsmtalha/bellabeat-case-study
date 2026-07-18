CREATE DATABASE IF NOT EXISTS bellabeat_case_study;
USE bellabeat_case_study;

DROP TABLE IF EXISTS daily_activity_raw;
CREATE TABLE daily_activity_raw (
    Id BIGINT,
    ActivityDate VARCHAR(20),
    TotalSteps INT,
    TotalDistance DOUBLE,
    TrackerDistance DOUBLE,
    LoggedActivitiesDistance DOUBLE,
    VeryActiveDistance DOUBLE,
    ModeratelyActiveDistance DOUBLE,
    LightActiveDistance DOUBLE,
    SedentaryActiveDistance DOUBLE,
    VeryActiveMinutes INT,
    FairlyActiveMinutes INT,
    LightlyActiveMinutes INT,
    SedentaryMinutes INT,
    Calories INT
);

DROP TABLE IF EXISTS sleep_day_raw;
CREATE TABLE sleep_day_raw (
    Id BIGINT,
    SleepDay VARCHAR(30),
    TotalSleepRecords INT,
    TotalMinutesAsleep INT,
    TotalTimeInBed INT
);

DROP TABLE IF EXISTS hourly_steps_raw;
CREATE TABLE hourly_steps_raw (
    Id BIGINT,
    ActivityHour VARCHAR(30),
    StepTotal INT
);

DROP TABLE IF EXISTS hourly_calories_raw;
CREATE TABLE hourly_calories_raw (
    Id BIGINT,
    ActivityHour VARCHAR(30),
    Calories INT
);

DROP TABLE IF EXISTS hourly_intensities_raw;
CREATE TABLE hourly_intensities_raw (
    Id BIGINT,
    ActivityHour VARCHAR(30),
    TotalIntensity INT,
    AverageIntensity DOUBLE
);

DROP TABLE IF EXISTS weight_log_raw;
CREATE TABLE weight_log_raw (
    Id BIGINT,
    Date VARCHAR(30),
    WeightKg DOUBLE,
    WeightPounds DOUBLE,
    Fat VARCHAR(10),
    BMI DOUBLE,
    IsManualReport VARCHAR(10),
    LogId BIGINT
);
