INSERT INTO radcheck (id, username, attribute, op, value) VALUES (1,'joeuser','Cleartext-Password',':=','somepassword');
INSERT INTO radreply  (username, attribute, op, value) VALUES ('joeuser', 'Mikrotik-Rate-Limit', '=', '512k/512k');
