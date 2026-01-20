-- 1. ENABLE VECTOR EXTENSION
CREATE EXTENSION IF NOT EXISTS vector;

-- 2. Table for Users to Watch
CREATE TABLE IF NOT EXISTS monitored_users (
    user_id BIGINT PRIMARY KEY,
    username TEXT,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Table for Admin Preferences
CREATE TABLE IF NOT EXISTS user_preferences (
    admin_id BIGINT PRIMARY KEY,
    topics TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);