-- SQL Learning Journey - Database Setup
-- This file sets up the complete database

-- Enable better output format
.mode column
.headers on

-- Execute all practice files
.read sql-practice/basic_operations.sql
.read sql-practice/joins_practice.sql

-- Show final state
.tables
SELECT 'Database setup complete!' as status;
