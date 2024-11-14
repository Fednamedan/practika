DELIMITER //
CREATE TRIGGER `update_birthdate` AFTER INSERT ON `zakazi` FOR EACH ROW BEGIN
  UPDATE sotrudniki
  SET data_rozjden = CURDATE()
  WHERE idsotrudniki = NEW.sotrudniki_idsotrudniki;
END //
DELIMITER ;