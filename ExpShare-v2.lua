name = "Universal ExpShare"
author = "imMigno"

description = [[
This script will automaticly level the weakest Pokemon on your Team with your strongest
and checks if booth of them are usable ! ]]

function onStart()
	
	-- Load Configurations
	dofile "libs/system.lua"
	dofile "config.lua"
	
	trapped = "false"

	log(" ")
	log("=========== WELCOME | START ============")
	log("Welcome to the Universal ExpSharing by imMigno")
	log("Version 2.0.9 | Updated: 09-20-2016 | 11.51 PM")
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
	startTraining()
end

function onBattleAction()

	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end

	startBattle()
	
end

function onBattleMessage(wild)
	if stringContains(wild, "wrapped") or stringContains(wild, "You can not switch this Pokemon!") or stringContains(wild, "You failed to run away!") or stringContains(wild, "You can not run away!")  then
		log("ExpShare | Trapped triggered - Activating Anti-Trap")
		trapped = "true"
	end		
end