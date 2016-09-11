name = "Universal ExpShare"
author = "imMigno"

description = [[
This script will automaticly level the weakest Pokemon on your Team with your strongest
and checks if booth of them are usable ! ]]

function onStart()
	
	-- Load Configurations
	dofile "config.lua"
	dofile "includes/path_functions.lua"
	-- dofile "includes/log_functions.lua"
	dofile "includes/battle_functions.lua"

	log(" ")
	log("=========== WELCOME | START ============")
	log("Welcome to the Universal ExpSharing by imMigno")
	log("Version 2.1 a beta | Updated: xx-xx-xxxx | xx.xx AM")
	log("====================================")
	log(" ")

end

function onPause()
	log("ExpShare | Paused !")
end

function onResume()
	dofile "config.lua"
	log("ExpShare | Config successfully reloaded !")
end

function onPathAction()
	if getUsablePokemonCount() > keepAlive then
		mTD()
	else
		hP()
	end

end

function onBattleAction()

	if isWildBattle() and isOpponentShiny() then
		if getPokemonLevel(getActivePokemonNumber()) > getOpponentLevel() then
			return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball")
		else
			sendPokemon(getUsablePokemonCount())
		end
	end

	if lastMap() then
		if getUsablePokemonCount() > keepAlive then
			if getPokemonLevel(getActivePokemonNumber()) >= SwapCap then
				if trapped() then
					return attack()
				else
					return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
				end
			elseif getPokemonLevel(getActivePokemonNumber()) < SwapCap then
				if trapped() then
					return attack()
				else
					log("ExpShare | "..getPokemonName(getActivePokemonNumber()).." has been switched with "..getPokemonName(getUsablePokemonCount()))
					sendPokemon(getUsablePokemonCount())
				end
			elseif getActivePokemonNumber() == getUsablePokemonCount() then
				if trapped() then
					return attack()
				else
					return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
				end
			end
		else
			if getPokemonLevel(getActivePokemonNumber()) >= SwapCap then
				if trapped() then
					return attack()
				else
					return run()
				end
			else
				if trapped() then
					return attack()
				else
					log("ExpShare | "..getPokemonName(getActivePokemonNumber()).." has been switched with "..getPokemonName(getUsablePokemonCount()))
					sendPokemon(getUsablePokemonCount())
				end
			end
		end
	else
		if getPokemonLevel(getActivePokemonNumber()) >= SwapCap then
			if trapped() then
				return attack()
			else
				return run()
			end
		else
			if trapped() then
				return attack()
			else
				sendPokemon(getUsablePokemonCount())
			end
		end
	end
end