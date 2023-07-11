-- 1. Orchestras table:

CREATE TABLE Orchestras (
    orchestra_id INTEGER PRIMARY KEY,
    name TEXT
);


-- To insert data from the `orchestras.csv` file into the `Orchestras` table, you can use the following SQL query:

COPY Orchestras FROM 'csv/orchestras.csv' DELIMITER ',' CSV HEADER;


-- 2. Concerts table:

CREATE TABLE Concerts (
    concert_id INTEGER PRIMARY KEY,
    orchestra_id INTEGER,
    date TEXT,
    venue TEXT,
    location TEXT,
    time TEXT,
    event_type TEXT
);


-- To insert data from the `concerts.csv` file into the `Concerts` table, you can use the following SQL query:

COPY Concerts FROM 'csv/concerts.csv' DELIMITER ',' CSV HEADER;


-- 3. Composers table:

CREATE TABLE Composers (
    composer_id INTEGER PRIMARY KEY,
    name TEXT
);


-- To insert data from the `composers.csv` file into the `Composers` table, you can use the following SQL query:

COPY Composers FROM 'csv/composers.csv' DELIMITER ',' CSV HEADER;


-- 4. Works table:

CREATE TABLE Works (
    work_id INTEGER PRIMARY KEY,
    concert_id INTEGER,
    title TEXT,
    conductor TEXT,
    composer_id INTEGER,
    movement TEXT
);


-- To insert data from the `works.csv` file into the `Works` table, you can use the following SQL query:

COPY Works FROM 'csv/works.csv' DELIMITER ',' CSV HEADER;


-- 5. Soloists table:

CREATE TABLE Soloists (
    soloist_id INTEGER PRIMARY KEY,
    work_id INTEGER,
    name TEXT,
    roles TEXT,
    instrument TEXT
);


-- To insert data from the `soloists.csv` file into the `Soloists` table, you can use the following SQL query:

COPY Soloists FROM 'csv/soloists.csv' DELIMITER ',' CSV HEADER;


-- 6. Movements table:

CREATE TABLE Movements (
    movement_id INTEGER PRIMARY KEY,
    work_id INTEGER,
    title TEXT
);

-- To insert data from the `movements.csv` file into the `Movements` table, you can use the following SQL query:

COPY Movements FROM 'csv/movements.csv' DELIMITER ',' CSV HEADER;
