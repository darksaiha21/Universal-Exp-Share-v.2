-- ##########################################################
-- #              -- CONFIGURATION FILE --                  #
-- #      Please edit this config to match your needs       #
-- #              Copyright © 2016 imMigno                  #
-- ##########################################################

-- The Bot will heal your Pokemon when the Count of usable Pokemon get to this number
keepAlive = 3

-- The Bot will stop when your whole team achieve that level.
StopLevel = 87

-- Once the pokemon hit that level, it will stop switching and fighting by himself.
SwapCap = 50

-- Map specific configurations
-- Please insert the Mapnames of your Leveling routine

Mount = "Latios"

Path = {
    "Pokecenter Cinnabar",
    "Cinnabar Island",
    "Cinnabar mansion 1",
    "Cinnabar mansion 2",
    "Cinnabar mansion 3",
}

-- Please choose the method of moving on your Level Location : "Grass", "Water" or "Rectangle".
LevelSpot = "Rectangle"

-- Modify below only if you're using Rectangle as movement method.
minX = 4
minY = 15
maxX = 11
maxY = 19