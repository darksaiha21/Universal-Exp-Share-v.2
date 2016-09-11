function firstMap()
	if getMapName() == Path[1] then
		return true
	else
		return false
	end
end

function lastMap()
	if getMapName() == Path[#Path] then
		return true
	else
		return false
	end
end

function getCurrentMap()
	for i = 1, #Path, 1 do
		if getMapName() == Path[i] then
			return i
		end
	end
end

function mTD()
	if not lastMap() then
		if not isTeamRangeSortedByLevelDescending(1, getTeamSize()) then
			sortTeamByLevelDescending(1, getTeamSize())
		elseif isTeamRangeSortedByLevelDescending(1, getTeamSize()) then
			moveTo(getCurrentMap() + 1)
		end
	elseif lastMap() then
		if advanceSorting() then
			return true
		elseif isPokemonUsable(1) then
			if getPokemonLevel(1) >= StopLevel then
				log(" ")
				log("ExpShare | StopLevel reached - ExpShare finished !")
                fatal(" ")
            else
            	getLevelSpot()
            end
        end
    end
end

function hP()
	if not firstMap() then
		moveTo(getCurrentMap() - 1)
	elseif firstMap() then
		getHealed()
	else
		log(" ")
		log("ExpShare | ErrorCode: 003 - Please report on the forum !")
		fatal(" ")
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

function onBattleMessage(wild)
	function trapped()
		if stringContains(wild, "wrapped") or stringContains(wild, "You can not switch this Pokemon!") or stringContains(wild, "You failed to run away!") or stringContains(wild, "You can not run away!")  then
			return true
		else
			return false
		end
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
    log(" ")
    log("ExpShare | Learning new Move: "..moveName.." (replaced with: "..ForgetMoveName..")")
    log(" ")
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