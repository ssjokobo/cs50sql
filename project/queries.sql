-- To list and order all track titles in a list
SELECT "title" FROM "tracks"
WHERE "id" in (
    SELECT "track_id" FROM "list"
    WHERE "id" = 1
    ORDER BY "order"
);

-- To list all track titles that have tempo faster than 120
SELECT "title" FROM "tracks"
WHERE "tempo" > 120
ORDER BY "tempo" DESC;

-- To list all track titles released before 1940.
SELECT "title" FROM "tracks"
WHERE "year_released" < 1940
ORDER BY "year_released" DESC;

-- To list all tracks that Benny Goodman participated in
SELECT "title" FROM "tracks"
WHERE "id" in (
    SELECT "track_id" in "roles"
    WHERE "musician_id" = (
        SELECT "id" FROM "musicians"
        WHERE "first_name" = "Benny"
        AND "last_name" = "Goodman"
    )
);

-- Add a new track
INSERT INTO "tracks" ("title", "tonality", "key_quality", "tempo", "band", "year_released")
VALUES ('Shiny Stockings', 'Ab', 'major', 120, 'Count Basie Orchestra', 1957);

-- Add a new list
INSERT INTO "lists" ("list_name", "user_id")
VALUES ('Lindy Hop I', (
    SELECT "id" FROM "users"
    WHERE "username" = "sompop"
    LIMIT 1
));

-- Add a new song into a list
INSERT INTO "lists" ("track_id", "list_id", "order")
VALUES (
    (SELECT "id" FROM "tracks" WHERE "title" = "Shiny Stockings"),
    (SELECT "id" FROM "lists" WHERE "listname" = "Lindy Hop I"),
    '1'
);
