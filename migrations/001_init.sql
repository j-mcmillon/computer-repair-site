-- 001_init.sql
CREATE DATABASE IF NOT EXIST repairshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE repairshop;

-- Staff/users (simple auth foundation)
CREATE TABLE users (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNUQUE,
    password_hash VARCHAR(255) NOT NULL,
    display_name VARCHAR(120) NOT NULL,
    role ENUM('admin', 'tech', 'frontdesk') NOT NULL DEFAULT 'tech',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Customers
CREATE TABLE customers (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    email VARCHAR(255) NULL,
    phone VARCHAR(30) NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_customers_email (email)
);

-- Devices owned by customers
    CREATE TABLE devices (
        id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        customer_id BIGINT UNSIGNED NOT NULL
        device_type ENUM('laptop', 'desktop', 'phon', 'tablet', 'console', 'other') NOT NULL,
        brand VARCHAR(80) NULL,
        model VARCHAR(120) NULL,
        serial_number VARCHAR(120) NULL,
        notes TEXT NULL,
        created at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_devices_customer FOREIGN KEY (customer_id) REFERENCES customers(id)
                         ON DELETE CASCADE,
        UNIQUE KEY uq_devices_serial (serial_number)
    );

-- Service catalog (labor menu)
CREATE TABLE services (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(40) NOT NULL UNIQUE,
    name VARCHAR(160) NOT NULL,
    description TEXT NULL,
    base_price_cents INT UNSIGNED NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

