CREATE USER 'alpha'@'%' IDENTIFIED BY 'password_alpha';
GRANT ALL PRIVILEGES ON beta.* TO 'alpha'@'%';
FLUSH PRIVILEGES;