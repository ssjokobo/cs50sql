CREATE INDEX "title_index" ON "courses" ("title");
CREATE INDEX "course_requirement_index" ON "satisfies" ("course_id", "requirement_id");
