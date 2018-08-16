-- SELECT victims.name as Victim, zombies.name as Zombie, bitings.infected_on FROM victims
--   INNER JOIN bitings
--   ON bitings.victim_id = victims.id
--   INNER JOIN zombies
--   ON zombies.id = bitings.zombie_id;

-- place a letter after the table name to set that as the  new table name in the
-- view e.g. FROM victims v sets the table name  from victims to v.
-- This DOES NOT change the name of the original table.
SELECT v.name as Victim, z.name as Zombie, b.infected_on FROM victims v
  INNER JOIN bitings b
  ON b.victim_id = v.id
  INNER JOIN zombies z
  ON z.id = b.zombie_id;
