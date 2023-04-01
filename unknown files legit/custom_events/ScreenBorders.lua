function onCreatePost()
	makeLuaSprite('bartop','bartop',-500,-1000)
	makeGraphic('bartop',5000,600,'000000')
	addLuaSprite('bartop',true)

	makeLuaSprite('barbot','barbot',-500,1000)
	makeGraphic('barbot',5000,600,'000000')
	addLuaSprite('barbot',true)
	setScrollFactor('bartop',0,0)
	setScrollFactor('barbot',0,0)
end
-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "ScreenBorders" then
		switch = tonumber(value1)
		tweenduration = tonumber(value2)
		if switch == 0 then
		doTweenY('funnytween1', 'bartop', -500, tweenduration, 'cubeOut')
		doTweenY('funnytween2', 'barbot', 650, tweenduration, 'cubeOut')
		    if songName == 'Network' then
			doTweenY('funnytween1', 'bartop', -425, tweenduration, 'cubeOut')
			doTweenY('funnytween2', 'barbot', 575, tweenduration, 'cubeOut')
		    end
		if tweenduration == 0 then
		setProperty('bartop.y', -500)
		setProperty('barbot.y', 650)
		end
		if tweenduration == null then
			setProperty('bartop.y', -500)
			setProperty('barbot.y', 650)
			end
	    end
		if switch == 1 then
		doTweenY('funnytween1', 'bartop', -1000, tweenduration, 'cubeOut')
		doTweenY('funnytween2', 'barbot', 1000, tweenduration, 'cubeOut')
		if tweenduration == 0 then
		setProperty('bartop.y', -1000)
		setProperty('barbot.y', 1000)
	    end
		if tweenduration == null then
			setProperty('bartop.y', -1000)
			setProperty('barbot.y', 1000)
			end
	    end
	end
end