-- SELECT lightsabers.colour FROM lightsabers;

-- SELECT characters.*, lightsabers.* FROM characters
--   INNER JOIN lightsabers
--   ON characters.id = lightsabers.character_id;

SELECT characters.name, lightsabers.colour FROM characters
  INNER JOIN lightsabers
  ON characters.id = lightsabers.character_id;
  
