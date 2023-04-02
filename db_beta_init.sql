
CREATE USER 'beta'@'%' IDENTIFIED BY 'password_beta';
GRANT ALL PRIVILEGES ON beta.* TO 'beta'@'%';

FLUSH PRIVILEGES;