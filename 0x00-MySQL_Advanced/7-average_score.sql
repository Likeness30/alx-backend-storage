/**
 * Computes the average score for a given user and updates the user's average score in the database.
 *
 * @param p_user_id The ID of the user for whom the average score needs to be computed.
 */
-- Create the procedure
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE avg_score DECIMAL(10,2);

    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = p_user_id;

    UPDATE users
    SET average_score = avg_score
    WHERE id = p_user_id;

END $$

DELIMITER ;
