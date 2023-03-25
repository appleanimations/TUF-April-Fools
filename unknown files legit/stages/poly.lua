function onCreate()
	makeLuaSprite('bg', 'bg', -500, -500)
	makeGraphic('bg', 2500, 1500, 'ffffff')
	addLuaSprite('bg', false)

	makeLuaSprite('borderL', 'aspect',0,0)
	setObjectCamera("borderL", 'other')
	addLuaSprite('borderL', false)
end

function onUpdate(elapsed)
	for i = 0,3 do
    	setPropertyFromGroup('strumLineNotes', i, "x", -400)
    end

    for i = 4,7 do
    	setPropertyFromGroup('strumLineNotes', i, "x", 120 * i - 80)
    end

	setProperty('showComboNum', false)
	setProperty('showRating', false)
	setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
end

function onBeatHit()
	if curBeat <= 1 then
		doTweenColor('bgColor', 'bg', '000000', 2, 'linear')
	end
	if curBeat == 32 then
		doTweenColor('bgColor', 'bg', 'ffffff', 2, 'linear')
	end
	if curBeat == 64 then
		doTweenColor('bgColor', 'bg', '555555', 2, 'linear')
	end
	if curBeat == 80 then
		doTweenColor('bgColor', 'bg', 'ffffff', 2, 'linear')
	end
	if curBeat == 88 then
		doTweenColor('bgColor', 'bg', 'bd0000', 2, 'linear')
	end
	if curBeat == 96 then
		doTweenColor('bgColor', 'bg', 'ffffff', 2, 'linear')
	end
	if curBeat == 128 then
		doTweenColor('bgColor', 'bg', '555555', 2, 'linear')
	end
	if curBeat == 160 then
		doTweenColor('bgColor', 'bg', 'bd0000', 2, 'linear')
	end
	if curBeat == 192 then
		doTweenColor('bgColor', 'bg', '000000', 2, 'linear')
	end
	if curBeat == 196 then
		doTweenColor('bgColor', 'bg', '6ef5ff', 2, 'linear')
	end
	if curBeat == 227 then
		doTweenColor('bgColor', 'bg', '000000', 0.001, 'linear')
	end
	if curBeat == 228 then
		doTweenColor('bgColor', 'bg', 'bd0000', 2, 'linear')
	end
	if curBeat == 260 then
		doTweenColor('bgColor', 'bg', '000000', 2, 'linear')
	end
	if curBeat == 292 then
		doTweenColor('bgColor', 'bg', 'ffffff', 2, 'linear')
	end
	if curBeat == 324 then
		doTweenColor('bgColor', 'bg', '555555', 2, 'linear')
	end
	if curBeat == 356 then
		doTweenColor('bgColor', 'bg', '000000', 1, 'linear')
	end
end