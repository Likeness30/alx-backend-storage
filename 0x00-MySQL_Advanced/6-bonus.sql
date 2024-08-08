-- This SQL script to create a stored procedure named AddBonus. This procedure adds a new correction record for a student
-- Inputs:
-- 1. user_id: An existing user's ID from the users table.
-- 2. project_name: Name of a project. If the project does not exist in the projects table, it will be created.
-- 3. score: The score value for the correction.

-- delete the trigger if it exists
DROP PROCEDURE IF EXISTS AddBonus;

-- Change the delimiter to avoid conflicts with semicolons in the procedure
DELIMITER $$

CREATE PROCEDURE AddBonus(
    IN p_user_id INT,          -- User ID from the users table
    IN p_project_name VARCHAR(255), -- Project name, can be new or existing
    IN p_score INT             -- Score for the correction
)
BEGIN
    DECLARE project_id INT;    -- Variable to store the project ID

    -- Attempt to find the project by name and store its ID
    SELECT id INTO project_id
    FROM projects
    WHERE name = p_project_name;

    -- If the project does not exist, create a new entry in the projects table
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (p_project_name);
        -- Update project_id with the ID of the newly created project
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Insert the correction record into the corrections table
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (p_user_id, project_id, p_score);

END $$

-- Reset the delimiter back to the default semicolon
DELIMITER ;
