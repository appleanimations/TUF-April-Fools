function onCreate()
	makeLuaSprite('bg', 'bg', -5000, -5000)
	makeGraphic('bg', 10000, 10000, 'ffffff')
	addLuaSprite('bg', false)

	makeLuaSprite('borders', 'vhs/borders', 0, 0)
	setObjectCamera('borders', 'other')
	addLuaSprite('borders', true)

	makeLuaText('escore', '', 0, 5, 600)
	setTextSize('escore', 18)
	setObjectCamera('escore', 'other')
	setTextFont('escore', 'sonichud.ttf')
	setTextAlignment('escore', 'Left')
	addLuaText('escore')
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

	setTextString('escore', 'peak counter: '..score..'\nstupids: '..misses..'\nare you nerd?: '..(rating*100)..'%\n('..ratingFC..' and '..ratingName..')')
end

function onCreatePost()
	doTweenColor('bgColor', 'bg', '0x' .. string.format('%02x%02x%02x%02x', 255, getRandomInt(0, 255), getRandomInt(0, 255), getRandomInt(0, 255)), 2, 'linear')

	for i = 4,7 do
		noteTweenDirection('noteA'..i, i, (90-5), 2, 'cubeInOut')
	end
end

function onTweenCompleted(t)
	if t == 'bgColor' then
		doTweenColor('bgColor', 'bg', '0x' .. string.format('%02x%02x%02x%02x', 255, getRandomInt(0, 255), getRandomInt(0, 255), getRandomInt(0, 255)), 2, 'linear')
	end

	for i = 4,7 do
		if t == 'noteA'..i then
			noteTweenDirection('noteB'..i, i, (90+5), 2, 'cubeInOut')
		end

		if t == 'noteB'..i then
			noteTweenDirection('noteA'..i, i, (90-5), 2, 'cubeInOut')
		end
	end
end

function onBeatHit()
	scaleObject('boyfriend', 1.1, 1.1)
	doTweenX('bfx', 'boyfriend.scale', 1, 0.5, 'expoOut')
	doTweenY('bfy', 'boyfriend.scale', 1, 0.5, 'expoOut')

	scaleObject('dad', 1.1, 1.1)
	doTweenX('dadx', 'dad.scale', 1, 0.5, 'expoOut')
	doTweenY('dady', 'dad.scale', 1, 0.5, 'expoOut')
end