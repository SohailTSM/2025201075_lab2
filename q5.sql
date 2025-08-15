DELIMITER //

CREATE PROCEDURE ListAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subID INT;
    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    subLoop: LOOP
        FETCH cur INTO subID;
        IF done THEN
            LEAVE subLoop;
        END IF;
        CALL GetWatchHistoryBySubscriber(subID);
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;
