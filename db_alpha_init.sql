
CREATE USER 'beta'@'%' IDENTIFIED BY 'password_beta';
GRANT ALL PRIVILEGES ON alpha.* TO 'beta'@'%';

FLUSH PRIVILEGES;