DELIMITER //

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done boolean DEFAULT FALSE;
    DECLARE subName VARCHAR(100);

    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    CREATE TEMPORARY TABLE IF NOT EXISTS Sub (Subscriber VARCHAR(100));
    TRUNCATE TABLE Sub;

    OPEN cur;

    subLoop: LOOP
        FETCH cur INTO subName;
        IF done THEN
            LEAVE subLoop;
        END IF;
        INSERT INTO Sub VALUES (subName);
    END LOOP;

    CLOSE cur;

    SELECT * FROM Sub;
END //

DELIMITER ;
