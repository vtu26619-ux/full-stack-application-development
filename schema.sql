-- Campus Event Management System Database Schema

CREATE DATABASE IF NOT EXISTS campus_events;
USE campus_events;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL, -- 'ADMIN', 'STUDENT'
    department VARCHAR(100),
    enabled BOOLEAN DEFAULT FALSE,
    auth_provider VARCHAR(50) DEFAULT 'LOCAL',
    email_notifications BOOLEAN DEFAULT TRUE,
    push_notifications BOOLEAN DEFAULT TRUE,
    event_reminders BOOLEAN DEFAULT TRUE,
    marketing_emails BOOLEAN DEFAULT FALSE
);

-- Events (Courses) Table
CREATE TABLE IF NOT EXISTS events (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    department VARCHAR(100),
    type VARCHAR(100),
    venue VARCHAR(255),
    event_date DATETIME,
    event_time VARCHAR(20) NOT NULL,
    capacity INT NOT NULL,
    registered_count INT DEFAULT 0,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Registrations (Enrollments) Table
CREATE TABLE IF NOT EXISTS registrations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    event_id BIGINT NOT NULL,
    registration_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (event_id) REFERENCES events(id),
    UNIQUE(user_id, event_id) -- Prevent duplicate enrollments
);

-- OTP Records Table
CREATE TABLE IF NOT EXISTS otp_records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    otp_code VARCHAR(255) NOT NULL,
    expiry_time DATETIME NOT NULL,
    failed_attempts INT DEFAULT 0,
    locked BOOLEAN DEFAULT FALSE
);
