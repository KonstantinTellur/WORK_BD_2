-- Создание таблицы "Артист"
CREATE TABLE IF NOT EXISTS Performers (
    performers_id SERIAL PRIMARY KEY,
    performers_name VARCHAR(60) NOT NULL
);

-- Создание таблицы "Жанр"
CREATE TABLE IF NOT EXISTS Genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(60) NOT null UNIQUE
);

-- Создание таблицы "Альбом"
CREATE TABLE IF NOT EXISTS Album (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(60) NOT NULL,
    created_at DATE NOT NULL CHECK (created_at>='2000-01-01')
);

-- Создание таблицы "Трек"
CREATE TABLE IF NOT EXISTS Track (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(60) NOT NULL,
    lasting INTEGER NOT NULL,
    album_id INTEGER REFERENCES Album(album_id),
    genre_id INTEGER REFERENCES Genre(genre_id)
);

-- Создание таблицы "Сборник"
CREATE TABLE IF NOT EXISTS Compilation (
    compilation_id SERIAL PRIMARY KEY,
    compilation_name VARCHAR(60) NOT NULL,
    created_at DATE NOT NULL CHECK (created_at>='2000-01-01')
);

-- Создание таблицы "Трек-сборник"
CREATE TABLE IF NOT EXISTS CompilationTrack (
    ct_id SERIAL PRIMARY KEY,
    track_id INTEGER REFERENCES Track(track_id),
    compilation_id INTEGER REFERENCES Compilation(compilation_id)
);

-- Создание таблицы "Артист-альбом"
CREATE TABLE IF NOT EXISTS PerformerAlbum (
    pa_id SERIAL PRIMARY KEY,
    performers_id INTEGER REFERENCES Performers(performers_id),
    album_id INTEGER REFERENCES Album(album_id)
);

-- Удаление таблицы "Артист-альбом"
DROP TABLE IF EXISTS AlbumPerformers;