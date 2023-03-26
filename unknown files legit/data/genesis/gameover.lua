local voiceRand = 1
function onCreate()
	voiceRand = getRandomInt(1, 7)
end

function onGameOver()
	openCustomSubstate('deadLol', true)
	return Function_Stop;
end

function onCustomSubstateCreate(deadLol)
	makeLuaSprite('black', 'black', -500, -500)
	makeGraphic('black', 2500, 1500, '000000')
	setObjectCamera('black', 'other')
	setObjectOrder('black', 50)
	addLuaSprite('black', true)

	runTimer('deathTimer', 8)
	for i = 1,7 do
		if voiceRand == i then
			playSound('moldVoice' ..i, 1)
		end
	end
end

function onCustomSubstateDestroy(deadLol)
	restartSong(true)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'deathTimer' then
		closeCustomSubstate()
	end
end