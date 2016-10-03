local PathFinder = require "Pathfinder/Maps_Pathfind"

function getLevelSpot()
	if LevelSpot == "Grass" then
		moveToGrass()
	elseif LevelSpot == "Water" then
		moveToWater()
	elseif LevelSpot == "Rectangle" then
		moveToRectangle(minX, minY, maxX, maxY)
	else
		fatal("ExpShare | Error on LevelSpot configuration !")
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

function isLevelLocation()
	if getMapName() == LevelLocation then
		return true
	else
		return false
	end
end

function startTraining()
	if trapped == "true" then
		trapped = "false"
		log("ExpShare | AntiTrap deactivated")
	end
	
	if advanceSorting() then
		return true
	elseif getTeamSize() >= 2 then
		if getUsablePokemonCount() > keepAlive then
			if isPokemonUsable(1) then
				if getPokemonLevel(1) < MaxLevel then
					if not isLevelLocation() then
						PathFinder.MoveTo(LevelLocation)
					else
						getLevelSpot()
					end
				else
					fatal("ExpShare | MaxLevel reached -> Training finished !")
					logout()
				end
			else
				fatal("ExpShare | ERRORCODE: P001")
			end
		else
			PathFinder.UseNearestPokecenter()
		end
	else
		fatal("ExpShare | You need atleast 2 Pokemon on your Team")
	end
end

function startBattle()

	if isLevelLocation() then
		if getActivePokemonNumber() == 1 and not needPokecenter() and isFightable() then
			if trapped == "true" then
				return attack() or sendUsablePokemon() or sendAnyPokemon()
			else
				return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
			end
		elseif getActivePokemonNumber() == 1 and not needPokecenter() and not isFightable() then
			if trapped == "true" then
				return attack()
			else
				sendPokemon(getUsablePokemonCount())
				log("ExpShare | "..getPokemonName(1).." has been switched with "..getPokemonName(getUsablePokemonCount()))
			end
		elseif getActivePokemonNumber() == getUsablePokemonCount() and isFightable() and not needPokecenter() then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		elseif getActivePokemonNumber() ~= getUsablePokemonCount() then
			if isFightable() then
				return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
			else
				if trapped == "true" then
					return attack()
				else
					sendPokemon(getUsablePokemonCount())
					log("ExpShare | "..getPokemonName(1).." has been switched with "..getPokemonName(getUsablePokemonCount()))
				end
			end
		elseif needPokecenter() then
			if trapped == "true" then
				return attack()
			else
				return run() or sendUsablePokemon() or sendAnyPokemon() or attack()
			end
		else
			fatal("ExpShare | ERRORCODE: B001")
		end
	else
		if trapped == "true" then
			return attack()
		else
			return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
		end
	end
end

function isFightable()
	if getPokemonLevel(getActivePokemonNumber()) >= (getOpponentLevel() + 10 ) then
		return true
	else
		return false
	end
end

function needPokecenter()
	if getUsablePokemonCount() <= keepAlive then
		return true
	else
		return false
	end
end