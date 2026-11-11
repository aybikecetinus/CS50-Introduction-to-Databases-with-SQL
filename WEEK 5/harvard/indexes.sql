CREATE INDEX "index"
ON "enrollments" ("course_id", "student_id");

CREATE INDEX "index2"
ON "satisfies" ("course_id", "requirement_id");

CREATE INDEX "index3"
ON "courses"("semester","department")
WHERE "semester" IN ('Fall 2024', 'Spring 2024', 'Fall 2023');
