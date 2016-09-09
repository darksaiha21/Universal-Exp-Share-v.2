lastMap = Maps

function moveToDestination()
	if mapId() ~= lastMap then
		if not isTeamRangeSortedByLevelDescending(1, getTeamSize()) then
			sortTeamRangeByLevelDescending(1, getTeamSize())
		elseif isTeamRangeSortedByLevelDescending(1, getTeamSize()) then
			log("DDDD")
			Maps = Maps + 1
			moveTo(startMap + Maps)
		else
			log(" ")
			log("==== ERROR ====")
			log("  _Error Code_ ")
			log(" -> Sort 01 <- ")
			log("===============")
			fatal(" ")
		end

	elseif mapId() == lastMap then
		if advanceSorting() then
			return true
		elseif isPokemonUsable(1) then
			if getPokemonLevel(1) >= StopLevel then
				log(" ")
                log("============ FINISHED LEVELING ============")
                log("The StopLevel has been reached, Bot stopped")
                log("===========================================")
                fatal(" ")
            else
            	getLevelSpot()
            end
        end
	end
end

function healPokemon()
	if mapId() ~= startMap then
		Maps = Maps - 1
		moveTo(lastMap - Maps)
	else
		healPokemon()
	end
end


function getMaps()
	for i = 1, #Path do
		Maps = Maps + 1
	end
end

function mapId()
	for i = 1, #Path do
		if getMapName() == Path[i] then
			return i
		end
	end
end

function moveTo(id)
	return moveToMap(Path[id])
end

function getLevelSpot()
	if LevelSpot == "Grass" then
		moveToGrass()
	elseif LevelSpot == "Water" then
		moveToWater()
	elseif LevelSpot == "Rectangle" then
		moveToRectangle(minX, minY, maxX, maxY)
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

-- Move Learning
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

-- Advanced Sorting
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