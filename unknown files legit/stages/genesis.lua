function onCreate()
	makeLuaSprite('bg', 'bg', -500, -500)
	makeGraphic('bg', 2500, 1500, '000000')
	addLuaSprite('bg', false)

	makeAnimatedLuaSprite('vhsoverlay', 'vhs/vhs', 150, 0)
	addAnimationByPrefix('vhsoverlay', 'vhs', 'vhs', 24, true)
	setObjectCamera('vhsoverlay', 'other')
	setGraphicSize('vhsoverlay', 1000, 730)
	setProperty('vhsoverlay.alpha', 0.7)
	addLuaSprite('vhsoverlay', true)

	makeLuaSprite('borders', 'vhs/borders', 0, 0)
	setObjectCamera('borders', 'other')
	addLuaSprite('borders', true)

	setProperty('boyfriendGroup.alpha', 0)
end

function onUpdate(elapsed)
	setProperty('camFollow.x', 400)
	setProperty('camFollow.y', 400)

	for i = 0,3 do
    	setPropertyFromGroup('strumLineNotes', i, "x", -400)
    end

    for i = 4,7 do
    	setPropertyFromGroup('strumLineNotes', i, "x", 120 * i - 80)
    end

    setProperty('showComboNum', false)
	setProperty('showRating', false)
    setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
end