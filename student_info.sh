#!/bin/bash
# Info about my computer science students from students database
echo -e "\n~~ My Computer Science Students ~~\n"

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo -e "\nFirst name, last name, and GPA of students with a 4.0 GPA:"
QUERY="
SELECT first_name,
    last_name,
    gpa
FROM students
WHERE gpa = 4.0;"
echo "$($PSQL "$QUERY")"

echo -e "\nAll course names whose first letter is before 'D' in the alphabet:"
QUERY="
SELECT course
FROM courses
WHERE course < 'D';"
echo "$($PSQL "$QUERY")";

echo -e "\nFirst name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:";
QUERY="
SELECT first_name,
    last_name,
    gpa
FROM students
WHERE last_name >= 'R'
    AND gpa > 3.8
    OR gpa < 2.0;"
echo "$($PSQL "$QUERY")";

echo -e "\nLast name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:";
QUERY="
SELECT last_name
FROM students
WHERE last_name ILIKE '%sa%'
    OR last_name LIKE '%r_';";
echo "$($PSQL "$QUERY")";

echo -e "\nFirst name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:";
QUERY="
SELECT first_name,
    last_name,
    gpa
FROM students
WHERE major_id IS NULL
    AND (
        first_name LIKE 'D%'
        OR gpa > 3.0
    );";
echo "$($PSQL "$QUERY")";

echo -e "\nCourse name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':";
QUERY="
SELECT course
FROM courses
WHERE course LIKE '_e%'
    OR course LIKE '%s'
ORDER BY course DESC
LIMIT 5;";
echo "$($PSQL "$QUERY")";
