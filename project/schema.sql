-- Represent music tracks for swing dance.
CREATE TABLE "tracks" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "tonality" TEXT CHECK("tonality" IN ("Gb", "B", "E", "A", "D", "G", "C", "F", "Bb", "Eb", "Ab", "Db")),
    "key_quality" TEXT CHECK("key_quality" IN ("major", "minor")),
    "tempo" INTEGER NOT NULL,
    "band" TEXT NOT NULL,
    "year_released" INTEGER,
    PRIMARY KEY ("id")
);

-- Represent users who are going to create playlists or setlists and also the ratings.
CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

-- Represent playlists or setlists.
CREATE TABLE "lists" (
    "id" INTEGER,
    "list_name" TEXT NOT NULL,
    "user_id" INTEGER,
    PRIMARY KEY ("id")
);

-- Represent playlists or setlists.
CREATE TABLE "track_in_list" (
    "track_id" INTEGER,
    "list_id" INTEGER,
    "order" INTEGER NOT NULL,
    FOREIGN KEY("track_id") REFERENCES "tracks"("id")
    FOREIGN KEY("list_id") REFERENCES "lists"("id")
);

-- Represent the musicians
CREATE TABLE "musicians" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "birth_year" INTEGER,
    PRIMARY KEY ("id")
);

-- Represent the participations of musicians in tracks
CREATE TABLE "musician_in_track" (
    "musician_id" INTEGER,
    "track_id" INTEGER,
    "role" TEXT NOT NULL,
    FOREIGN KEY("track_id") REFERENCES "tracks"("id")
    FOREIGN KEY("musician_id") REFERENCES "musicians"("id")
);

-- Indexes to speed up frequently searches
CREATE INDEX "track_title_search" ON "tracks" ("title");
CREATE INDEX "username_search" ON "users" ("username");
CREATE INDEX "list_name_search" ON "lists" ("list_name");
