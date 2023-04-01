CREATE USER 'alpha'@'%' IDENTIFIED BY 'password_alpha';
GRANT ALL PRIVILEGES ON alpha.* TO 'alpha'@'%';

CREATE USER 'beta'@'%' IDENTIFIED BY 'password_beta';
GRANT ALL PRIVILEGES ON alpha.* TO 'beta'@'%';

FLUSH PRIVILEGES;