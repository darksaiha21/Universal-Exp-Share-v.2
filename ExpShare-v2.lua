name = "Universal ExpShare"
author = "imMigno"

description = [[
This script will automaticly level the weakest Pokemon on your Team with your strongest
and checks if booth of them are usable ! ]]

function onStart()
	
	-- Load Configurations
	dofile "config.lua"
	dofile "includes/path_functions.lua"
	dofile "includes/battle_functions.lua"

	log(" ")
	log("=========== WELCOME | START ============")
	log("Welcome to the Universal ExpSharing by imMigno")
	log("Version 2.0.8b | Updated: 08-31-2016 | 03.39 AM")
	log("====================================")
	log(" ")

	Maps = 0
	pathcount = 0
	trapped = "false"
	startMap = mapId()

	if Maps == 0 then
		getMaps()
	end

	log("Maps: "..Maps)

end

function onPause()
	log("ExpShare | Paused !")
end

function onResume()
	dofile "config.lua"

	getMaps()

	log("ExpShare | Config successfully reloaded !")
end

function onPathAction()

	if trapped == "true" then
		trapped = "false"
	end

	if getTeamSize() >= 2 then
		if getUsablePokemonCount() > keepAlive then
			moveToDestination()
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

function onBattleMessage(wild)
	if stringContains(wild, "wrapped") or stringContains(wild, "You can not switch this Pokemon!") or stringContains(wild, "You failed to run away!") or stringContains(wild, "You can not run away!")  then
		log("ExpShare | Trapped triggered - Activating Anti-Trap")
		trapped = "true"
	end		
end