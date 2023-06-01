CREATE TABLE
  item (
    id SERIAL PRIMARY KEY,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    label_id INT NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genre (id),
    FOREIGN KEY (label_id) REFERENCES label (id),
    FOREIGN KEY (author_id) REFERENCES author (id)
  );

CREATE TABLE
  books (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    publisher VARCHAR(30) NOT NULL,
    cover_state VARCHAR(10) NOT NULL,
    label_ID INTEGER,
    genre_ID INTEGER,
    CONSTRAINT fk_label FOREIGN KEY (label_ID) REFERENCES label (ID),
    CONSTRAINT fk_genre FOREIGN KEY (genre_ID) REFERENCES genre (ID)
  );

CREATE TABLE
  label (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL
  );

  CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  item_id INT,
  on_spotify BOOL NOT NULL,
  FOREIGN KEY(item_id) REFERENCES item(id)
);

CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  PRIMARY KEY(id)
);

CREATE TABLE game (
  multiplayer BOOLEAN,
  last_played_at DATE,
)