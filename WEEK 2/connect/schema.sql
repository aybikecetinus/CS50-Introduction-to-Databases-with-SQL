CREATE TABLE "Users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Schools"(
    "id" INTEGER,
    "name_of_school" TEXT,
    "type" TEXT,
    "location" TEXT,
    "founded_year" INTEGER,
    PRIMARY KEY ("id")
);


CREATE TABLE "Companies" (
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE "People_Connection" (
    "user1" INTEGER,
    "user2" INTEGER,
    "mutual" INTEGER NOT NULL CHECK("mutual" != 0),
    FOREIGN KEY ("user1") REFERENCES "Users" ("id"),
    FOREIGN KEY ("user2") REFERENCES "Users" ("id")
);

CREATE TABLE "School_Connection" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "stardate" TEXT,
    "enddate" TEXT,
    "degree_type" TEXT,
    FOREIGN KEY ("user_id") REFERENCES "Users" ("id"),
    FOREIGN KEY ("school_id") REFERENCES "Schools" ("id")
);

CREATE TABLE "Company_Connection" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "stardate" TEXT,
    "enddate" TEXT,
    "title" TEXT,
    FOREIGN KEY ("user_id") REFERENCES "Users" ("id"),
    FOREIGN KEY ("company_id") REFERENCES "Companies" ("id")
);
