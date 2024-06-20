CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE schools (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN ("Elementary School", "Middle School", "High School", "Lower School", "Upper School", "College", "University")),
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE companies (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL CHECK("industry" IN ("Education", "Technology", "Finance")),
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE people_connections (
    "id" INTEGER,
    "user_id" INTEGER,
    "another_user_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("another_user_id") REFERENCES "users"("id")
);

CREATE TABLE schools_connections (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start" DATE NOT NULL,
    "end" DATE NOT NULL,
    "degree" TEXT NOT NULL CHECK("degree" IN ("BA", "MA", "PhD")),
    PRIMARY KEY("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE companies_connections (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start" DATE NOT NULL,
    "end" DATE NOT NULL,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
