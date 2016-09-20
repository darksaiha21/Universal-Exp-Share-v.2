name = "Universal ExpShare"
author = "imMigno"

description = [[
This script will automaticly level the weakest Pokemon on your Team with your strongest
and checks if booth of them are usable ! ]]

function onStart()
	
	-- Load Configurations
	dofile "config.lua"
	dofile "libs/AntiBan.lua"

	log(" ")
	log("=========== WELCOME | START ============")
	log("Welcome to the Universal ExpSharing by imMigno")
	log("Version 2.0.8b | Updated: 08-31-2016 | 03.39 AM")
	log("====================================")
	log(" ")

	path = 0
	trapped = "false"

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

function onPause()
	log("ExpShare | Paused !")
end

function onResume()
	dofile "config.lua"
	log("ExpShare | Config successfully reloaded !")
end

-- Shortcut -> GoToPokecenter
function healPokemon()
	if path == 0 and City == "" and Pokecenter == LevelLocation then
		if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
			log("ExpShare | Using ".. Mount)
			useItem(Mount)
		elseif isMounted() then
			getHealed()
		else
			getHealed()
		end
	elseif path == 0 then
		if getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(City)
			else
				moveToMap(City)
			end
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Pokecenter)
			else
				moveToMap(Pokecenter)
			end
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 1 then
		if getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(City)
			else
				moveToMap(City)
			end
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Pokecenter)
			else
				moveToMap(Pokecenter)
			end
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 2 then
		if getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(City)
			else
				moveToMap(City)
			end
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Pokecenter)
			else
				moveToMap(Pokecenter)
			end
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 3 then
		if getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map3)
			else
				moveToMap(Map3)
			end
		elseif getMapName() == Map3 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(City)
			else
				moveToMap(City)
			end
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Pokecenter)
			else
				moveToMap(Pokecenter)
			end
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 4 then
		if getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map4)
			else
				moveToMap(Map4)
			end
		elseif getMapName() == Map4 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map3)
			else
				moveToMap(Map3)
			end
		elseif getMapName() == Map3 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(City)
			else
				moveToMap(City)
			end
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Pokecenter)
			else
				moveToMap(Pokecenter)
			end
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	elseif path == 5 then
		if getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map5)
			else
				moveToMap(Map5)
			end
		elseif getMapName() == Map5 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map4)
			else
				moveToMap(Map4)
			end
		elseif getMapName() == Map4 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map3)
			else
				moveToMap(Map3)
			end
		elseif getMapName() == Map3 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(City)
			else
				moveToMap(City)
			end
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Pokecenter)
			else
				moveToMap(Pokecenter)
			end
		elseif getMapName() == Pokecenter then
			getHealed()
		end
	end
end

-- Shortcut -> GoToLevelLocation
function moveToDestination()
	-- walk to Destination
	-- No City & LevelLocation == Pokecenter
	if path == 0 and City == "" and Pokecenter == LevelLocation then
		if getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using".. Mount)
				useItem(Mount)
			elseif isMounted() then
				getLevelSpot()
			else
				getLevelSpot()
			end
		else
			getHealed()
		end

	-- Path of no City between Pokecenter and LevelSpot
	elseif path == 0 and City == "" then
		if getMapName() == Pokecenter then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			getLevelSpot()
		end
	-- Path of 0 Maps between City and LevelSpot
	elseif path == 0 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(LevelLocation)
			else
				moveToMap(LevelLocation)
			end
		elseif getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				getLevelSpot()
			else
				getLevelSpot()
			end
		end
	-- Path of 1 Maps between City and LevelSpot	
	elseif path == 1 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(LevelLocation)
			else
				moveToMap(LevelLocation)
			end
		elseif getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				getLevelSpot()
			else
				getLevelSpot()
			end
		end
	-- Path of 2 Maps between City and LevelSpot	
	elseif path == 2 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(LevelLocation)
			else
				moveToMap(LevelLocation)
			end
		elseif getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				getLevelSpot()
			else
				getLevelSpot()
			end
		end
	-- Path of 3 Maps between City and LevelSpot	
	elseif path == 3 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map3)
			else
				moveToMap(Map3)
			end
		elseif getMapName() == Map3 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(LevelLocation)
			else
				moveToMap(LevelLocation)
			end
		elseif getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				getLevelSpot()
			else
				getLevelSpot()
			end
		end
	-- Path of 4 Maps between City and LevelSpot	
	elseif path == 4 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map3)
			else
				moveToMap(Map3)
			end
		elseif getMapName() == Map3 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map4)
			else
				moveToMap(Map4)
			end
		elseif getMapName() == Map4 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(LevelLocation)
			else
				moveToMap(LevelLocation)
			end
		elseif getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				getLevelSpot()
			else
				getLevelSpot()
			end
		end
	-- Path of 5 Maps between City and LevelSpot	
	elseif path == 5 then
		if getMapName() == Pokecenter then
			moveToMap(City)
		elseif getMapName() == City then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map1)
			else
				moveToMap(Map1)
			end
		elseif getMapName() == Map1 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map2)
			else
				moveToMap(Map2)
			end
		elseif getMapName() == Map2 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map3)
			else
				moveToMap(Map3)
			end
		elseif getMapName() == Map3 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map4)
			else
				moveToMap(Map4)
			end
		elseif getMapName() == Map4 then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				moveToMap(Map5)
			else
				moveToMap(Map5)
			end
		elseif getMapName() == Map5 then
			moveToMap(LevelLocation)
		elseif getMapName() == LevelLocation then
			if hasItem(Mount) and not isMounted() and isOutside() and not isSurfing() then
				log("ExpShare | Using ".. Mount)
				useItem(Mount)
			elseif isMounted() then
				getLevelSpot()
			else
				getLevelSpot()
			end
		end
	end
end

function getHealed()
	if getMapName() == "Indigo Plateau Center" then
		talkToNpcOnCell(4, 22)

	elseif getMapName() == "Seafoam B4F" then
		pushDialogAnswer(1)
		pushDialogAnswer(1)
        talkToNpcOnCell(59, 13)

	else
		usePokecenter()
	end
end

function onPathAction()

	if trapped == "true" then
		trapped = "false"
	end

	if  advanceSorting() then 
		return true
	elseif getTeamSize() >= 2 then
        if getUsablePokemonCount() > keepAlive then
            if isPokemonUsable(1) then
                    if getPokemonLevel(1) >= StopLevel then
                        log(" ")
                        log("============ FINISHED LEVELING ============")
                        log("The StopLevel has been reached, Bot stopped")
                        log("===========================================")
                        fatal(" ")
                    else 
					   moveToDestination()
						
                    end
			else
				log(" ")
				log("===== ERROR LOG =====")
				log(" Error on pathing    ")
				log(" ErrorCode: Path001  ")
				log("=====================")
				fatal(" ")
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

	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end

	if getMapName() == LevelLocation then
		if getActivePokemonNumber() == 1 and getUsablePokemonCount() > keepAlive and getPokemonLevel(1) >= SwapCap then
			if trapped == "true" then
				return attack() or sendUsablePokemon() or SendAnyPokemon() or run()
			else
				return attack()
			end

		elseif getActivePokemonNumber() == 1 and getUsablePokemonCount() > keepAlive and getPokemonLevel(1) < SwapCap then
			if trapped == "true" then
				return attack()
			else
				sendPokemon(getUsablePokemonCount())
				log("ExpShare | ".. getPokemonName(1) .. " has been switched with ".. getPokemonName(getUsablePokemonCount()))
			end

		elseif getActivePokemonNumber() == getUsablePokemonCount() and getUsablePokemonCount() > keepAlive then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()

		elseif getActivePokemonNumber() ~= getUsablePokemonCount() then
				if getPokemonLevel(getActivePokemonNumber()) >= SwapCap then
					return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
				else
					if trapped == "true" then
						return attack()
					else
						sendPokemon(getUsablePokemonCount())
						log("ExpShare | ".. getPokemonName(getActivePokemonNumber()) .. " has been switched with ".. getPokemonName(getUsablePokemonCount()))
					end
				end

		elseif getUsablePokemonCount() <= keepAlive then
			if trapped == "true" then
				return attack()
			else
				return run() or sendUsablePokemon() or sendAnyPokemon() or attack() 
			end

		else
			log(" ")
			log("============ ERROR ============")
			log("Please report this on the Forum")
			log("     Error Code: Battle01      ")
			log("===============================")
			fatal(" ")
		end
	else
		if trapped == "true" then
			return attack()
		else
			return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
		end
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

function onBattleMessage(wild)
	if stringContains(wild, "wrapped") or stringContains(wild, "You can not switch this Pokemon!") or stringContains(wild, "You failed to run away!") or stringContains(wild, "You can not run away!")  then
		log("ExpShare | Trapped triggered - Activating Anti-Trap")
		trapped = "true"
	end		
end

function advanceSorting()
	local pokemonsUsable = getUsablePokemonCount()
	for pokemonId=1, pokemonsUsable, 1 do
		if not isPokemonUsable(pokemonId) then --Move it at bottom of the Team
			for pokemonId_ = pokemonsUsable + 1, getTeamSize(), 1 do
				if isPokemonUsable(pokemonId_) then
					swapPokemon(pokemonId, pokemonId_)
					return true
				end
			end
			
		end
	end
	if not isTeamRangeSortedByLevelAscending(1, pokemonsUsable) then --Sort the team without not usable pokemons
		return sortTeamRangeByLevelAscending(1, pokemonsUsable)
	end
	return false
end