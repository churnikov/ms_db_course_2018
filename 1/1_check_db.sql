-- Тебуется логин под system
-- 1. Проверка наличия таблиц
SELECT TABLE_NAME FROM user_tables
-- 2. Проверка правил целостности
SELECT * FROM USER_CONSTRAINTS
-- 3. Проверка индексов
SELECT * FROM USER_INDEXES
-- 4. Проверка представлений
SELECT * FROM USER_VIEWS
-- 5. Проверка секвенций
SELECT * FROM USER_SEQUENCES
-- 6. Функций и процедур
SELECT * FROM USER_PROCEDURES