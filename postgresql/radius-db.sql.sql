CREATE USER USUARIO WITH PASSWORD 'SENHA';
CREATE DATABASE BANCO OWNER USUARIO;
GRANT ALL PRIVILEGES ON DATABASE BANCO TO USUARIO;




CREATE USER radius WITH PASSWORD 'WIFICHECK_123_XYZ';
CREATE DATABASE radius OWNER radius;
GRANT ALL PRIVILEGES ON DATABASE radius TO radius;