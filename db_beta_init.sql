
CREATE USER 'alpha'@'%' IDENTIFIED BY 'password_beta';
GRANT ALL PRIVILEGES ON beta.* TO 'alpha'@'%';

FLUSH PRIVILEGES;