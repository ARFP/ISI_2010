

CREATE TABLE teams(
   t_id INT,
   t_name VARCHAR(50) NOT NULL,
   t_points INT NOT NULL,
   PRIMARY KEY(t_id)
);

CREATE TABLE games(
   g_id VARCHAR(50),
   g_date DATETIME NOT NULL,
   g_stadium VARCHAR(50),
   PRIMARY KEY(g_id)
);

CREATE TABLE players(
   p_id INT,
   p_position VARCHAR(50) NOT NULL,
   p_lastname VARCHAR(50) NOT NULL,
   p_firstname VARCHAR(50) NOT NULL,
   p_goals INT NOT NULL,
   p_assists INT NOT NULL,
   t_id INT NOT NULL,
   PRIMARY KEY(p_id),
   FOREIGN KEY(t_id) REFERENCES teams(t_id)
);

CREATE TABLE soccer_match(
   p_id INT,
   t_id INT,
   g_id VARCHAR(50),
   PRIMARY KEY(p_id, t_id, g_id),
   FOREIGN KEY(p_id) REFERENCES players(p_id),
   FOREIGN KEY(t_id) REFERENCES teams(t_id),
   FOREIGN KEY(g_id) REFERENCES games(g_id)
);
