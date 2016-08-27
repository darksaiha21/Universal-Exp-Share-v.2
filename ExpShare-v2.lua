name = "Universal ExpShare"
author = "imMigno"

description = [[
This script will automaticly level the weakest Pokemon on your Team with your strongest
and checks if booth of them are usable ! ]]

dofile "config.lua"

function onStart()
	log(" ")
	log("=========== WELCOME | START ============")
	log("Welcome to the Universal ExpSharing by imMigno")
	log("====================================")
	log(" ")

	path = 0

	if Map1 ~= "" then
		path = path + 1
	end
	if Map2 ~= "" then
		path = path + 1
	end
	if Map3 ~= "" then
		path = path + 1
	end
	if Map4 ~= "" then
		path = path + 1
	end
	if Map5 ~= "" then
		path = path + 1
	end
end

-- Config -> LevelSpot
function getLevelSpot()
	if LevelSpot == "Grass" then
		moveToGrass()
	elseif LevelSpot == "Water" then
		moveToWater()
	elseif LevelSpot == "Rectangle" then
		moveToRectangle(minX, minY, maxX, maxY)
	end
end

-- Shortcut -> GoToPokecenter
function healPokemon()
	if path == 0 then
		if getMapName() == LevelLocation then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Pokecenter)
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 1 then
		if getMapName() == LevelLocation then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Pokecenter)
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 2 then
		if getMapName() == LevelLocation then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Pokecenter)
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 3 then
		if getMapName() == LevelLocation then
			moveToMap(Map3)
		elseif getMapName() == Map3 then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Pokecenter)
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 4 then
		if getMapName() == LevelLocation then
			moveToMap(Map4)
		elseif getMapName() == Map4 then
			moveToMap(Map3)
		elseif getMapName() == Map3 then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Pokecenter)
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 5 then
		if getMapName() == LevelLocation then
			moveToMap(Map5)
		elseif getMapName() == Map5 then
			moveToMap(Map4)
		elseif getMapName() == Map4 then
			moveToMap(Map3)
		elseif getMapName() == Map3 then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Pokecenter)
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	end
end

-- Shortcut -> GoToLevelLocation
function moveToDestination()
	-- walk to Destination
	-- Path of 0 Maps between City and LevelSpot	
	if path == 0 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			getLevelSpot()
		end
	-- Path of 1 Maps between City and LevelSpot	
	elseif path == 1 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			getLevelSpot()
		end
	-- Path of 2 Maps between City and LevelSpot	
	elseif path == 2 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			getLevelSpot()
		end
	-- Path of 3 Maps between City and LevelSpot	
	elseif path == 3 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(Map3)
		elseif getMapName() == Map3 then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			getLevelSpot()
		end
	-- Path of 4 Maps between City and LevelSpot	
	elseif path == 4 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(Map3)
		elseif getMapName() == Map3 then
			moveToMap(Map4)
		elseif getMapName() == Map4 then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			getLevelSpot()
		end
	-- Path of 5 Maps between City and LevelSpot	
	elseif path == 5 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			moveToMap(Map1)
		elseif getMapName() == Map1 then
			moveToMap(Map2)
		elseif getMapName() == Map2 then
			moveToMap(Map3)
		elseif getMapName() == Map3 then
			moveToMap(Map4)
		elseif getMapName() == Map4 then
			moveToMap(Map5)
		elseif getMapName() == Map5 then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			getLevelSpot()
		end
	end
end

function getHealed()
	if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)

	elseif getMapName()=="Seafoam B4F" then
        talkToNpcOnCell(59, 13)

	else
		usePokecenter()
	end
end

function onPathAction()
	if getTeamSize() == 2 then
		if isPokemonUsable(1) and isPokemonUsable(2) and getPokemonHealthPercent(2) >= 15 then
			if isTeamRangeSortedByLevelAscending(1, 2) then
				if getPokemonLevel(1) >= StopLevel and getPokemonLevel(2) >= StopLevel then
					log(" ")
					log("============ FINISHED LEVELING ============")
					log("The StopLevel has been reached, Bot stopped")
					log("===========================================")
					fatal(" ")
				else
					moveToDestination()
				end
			else
				return sortTeamRangeByLevelAscending(1, 2)
			end
		else
			healPokemon()
		end

	elseif getTeamSize() == 3 then
		if isPokemonUsable(1) and isPokemonUsable(2) and isPokemonUsable(3) and getPokemonHealthPercent(3) >= 15 then
			if isTeamRangeSortedByLevelAscending(1, 3) then
				if getPokemonLevel(1) >= StopLevel and getPokemonLevel(2) >= StopLevel and getPokemonLevel(3) >= StopLevel then
					log(" ")
					log("============ FINISHED LEVELING ============")
					log("The StopLevel has been reached, Bot stopped")
					log("===========================================")
					fatal(" ")
				else
					moveToDestination()
				end
			else
				return sortTeamRangeByLevelAscending(1, 3)
			end
		else
			healPokemon()
		end

	elseif getTeamSize() == 4 then
		if isPokemonUsable(1) and isPokemonUsable(2) and isPokemonUsable(3) and isPokemonUsable(4) and getPokemonHealthPercent(4) >= 15 then
			if isTeamRangeSortedByLevelAscending(1, 4) then
				if getPokemonLevel(1) >= StopLevel and getPokemonLevel(2) >= StopLevel and getPokemonLevel(3) >= StopLevel and getPokemonLevel(4) >= StopLevel then
					log(" ")
					log("============ FINISHED LEVELING ============")
					log("The StopLevel has been reached, Bot stopped")
					log("===========================================")
					fatal(" ")
				else
					moveToDestination()
				end
			else
				return sortTeamRangeByLevelAscending(1, 4)
			end
		else
			healPokemon()
		end

	elseif getTeamSize() == 5 then
		if isPokemonUsable(1) and isPokemonUsable(2) and isPokemonUsable(3) and isPokemonUsable(4) and isPokemonUsable(5) and getPokemonHealthPercent(5) >= 15 then
		 	if isTeamRangeSortedByLevelAscending(1, 5) then
		 		if getPokemonLevel(1) >= StopLevel and getPokemonLevel(2) >= StopLevel and getPokemonLevel(3) >= StopLevel and getPokemonLevel(4) >= StopLevel and getPokemonLevel(5) >= StopLevel then
					log(" ")
					log("============ FINISHED LEVELING ============")
					log("The StopLevel has been reached, Bot stopped")
					log("===========================================")
					fatal(" ")
				else
					moveToDestination()
				end
		 	else
		 		return sortTeamRangeByLevelAscending(1, 5)
		 	end
		 else
			healPokemon()
		end

	elseif getTeamSize() == 6 then
		if isPokemonUsable(1) and isPokemonUsable(2) and isPokemonUsable(3) and isPokemonUsable(4) and isPokemonUsable(5) and isPokemonUsable(6) and getPokemonHealthPercent(6) >= 15 then
			if isTeamRangeSortedByLevelAscending(1, 6) then
				if getPokemonLevel(1) >= StopLevel and getPokemonLevel(2) >= StopLevel and getPokemonLevel(3) >= StopLevel and getPokemonLevel(4) >= StopLevel and getPokemonLevel(5) >= StopLevel and getPokemonLevel(6) >= StopLevel then
					log(" ")
					log("============ FINISHED LEVELING ============")
					log("The StopLevel has been reached, Bot stopped")
					log("===========================================")
					fatal(" ")
				else
					moveToDestination()
				end
			else
				return sortTeamRangeByLevelAscending(1, 6)
			end
		else
			healPokemon()
		end

	else
		log(" ")
		log("=========== FATAL ERROR LOG ===========")
		log("You need atleast 2 Pokemon in your Team")
		log("        - ExpSharing destoyed -        ")
		log("=======================================")
		fatal(" ")
	end
end

function onBattleAction()
	-- 2 Pokemon Usable
	if getUsablePokemonCount() == 2 and getPokemonHealthPercent(2) >= 15 then
		if getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 2) and getPokemonHealthPercent(2) >= 15 and getPokemonLevel(1) >= SwapCap then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		elseif getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 2) and getPokemonHealthPercent(2) >= 15 and getPokemonLevel(1) < SwapCap then
			sendPokemon(2)
			log(" ")
			log("Your ".. getPokemonName(1) .. " has been switched with ".. getPokemonName(2))
			log(" ")
		elseif getActivePokemonNumber() == 2 and isTeamRangeSortedByLevelAscending(1, 2) and getPokemonHealthPercent(2) >= 15 then
			return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
		else
			return run() or sendUsablePokemon() or sendAnyPokemon() or attack()
		end
		
	-- 3 Pokemon Usable
	elseif getUsablePokemonCount() == 3 and getPokemonHealthPercent(3) >= 15 then
		if getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 3) and getPokemonHealthPercent(2) >= 15 and getPokemonLevel(1) >= SwapCap then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		elseif getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 3) and getPokemonHealthPercent(3) >= 15 and getPokemonLevel(1) < SwapCap then
			sendPokemon(3)
			log(" ")
			log("Your ".. getPokemonName(1) .. " has been switched with ".. getPokemonName(3))
			log(" ")
		elseif getActivePokemonNumber() == 3 and isTeamRangeSortedByLevelAscending(1, 3) and getPokemonHealthPercent(3) >= 15 then
			return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
		else
			return run() or sendUsablePokemon() or sendAnyPokemon() or attack()
		end

	-- 4 Pokemon Usable
	elseif getUsablePokemonCount() == 4 and getPokemonHealthPercent(4) >= 15 then
		if getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 4) and getPokemonHealthPercent(2) >= 15 and getPokemonLevel(1) >= SwapCap then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		elseif getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 4) and getPokemonHealthPercent(4) >= 15 and getPokemonLevel(1) < SwapCap then
			sendPokemon(4)
			log(" ")
			log("Your ".. getPokemonName(1) .. " has been switched with ".. getPokemonName(4))
			log(" ")
		elseif getActivePokemonNumber() == 4 and isTeamRangeSortedByLevelAscending(1, 4) and getPokemonHealthPercent(4) >= 15 then
			return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
		else
			return run() or sendUsablePokemon() or sendAnyPokemon() or attack()
		end

	-- 5 Pokemon Usable
	elseif getUsablePokemonCount() == 5 and getPokemonHealthPercent(5) >= 15 then
		if getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 5) and getPokemonHealthPercent(2) >= 15 and getPokemonLevel(1) >= SwapCap then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		elseif getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 5) and getPokemonHealthPercent(5) >= 15 and getPokemonLevel(1) < SwapCap then
			sendPokemon(5)
			log(" ")
			log("Your ".. getPokemonName(1) .. " has been switched with ".. getPokemonName(5))
			log(" ")
		elseif getActivePokemonNumber() == 5 and isTeamRangeSortedByLevelAscending(1, 5) and getPokemonHealthPercent(5) >= 15 then
			return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
		else
			return run() or sendUsablePokemon() or sendAnyPokemon() or attack()
		end

	-- 6 Pokemon usable
	elseif getUsablePokemonCount() == 6 and getPokemonHealthPercent(6) >= 15 then
		if getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 6) and getPokemonHealthPercent(2) >= 15 and getPokemonLevel(1) >= SwapCap then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		elseif getActivePokemonNumber() == 1 and isTeamRangeSortedByLevelAscending(1, 6) and getPokemonHealthPercent(6) >= 15 and getPokemonLevel(1) < SwapCap then
			sendPokemon(6)
			log(" ")
			log("Your ".. getPokemonName(1) .. " has been switched with ".. getPokemonName(6))
			log(" ")
		elseif getActivePokemonNumber() == 6 and isTeamRangeSortedByLevelAscending(1, 6) and getPokemonHealthPercent(6) >= 15 then
			return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
		else
			return run() or sendUsablePokemon() or sendAnyPokemon() or attack()
		end
	else
		return run() or sendUsablePokemon() or sendAnyPokemon() or attack()
	end
end

function onLearningMove(moveName, pokemonIndex)
    local ForgetMoveName
    local ForgetMoveTP = 9999
    for moveId=1, 4, 1 do
        local MoveName = getPokemonMoveName(pokemonIndex, moveId)
        if MoveName == nil or MoveName == "cut" or MoveName == "surf" or MoveName == "rock smash" or MoveName == "rocksmash" then
        else
        local CalcMoveTP = math.modf((getPokemonMaxPowerPoints(pokemonIndex,moveId) * getPokemonMovePower(pokemonIndex,moveId))*(math.abs(getPokemonMoveAccuracy(pokemonIndex,moveId)) / 100))
            if CalcMoveTP < ForgetMoveTP then
                ForgetMoveTP = CalcMoveTP
                ForgetMoveName = MoveName
            end
        end
    end
    log("==== Learning new Move ====")
    log(" ")
    log("[Learned] ".. moveName)
    log("[Forgot ] ".. ForgetMoveName)
    log(" ")
    log("===========================")
    return ForgetMoveName
end