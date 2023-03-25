--put "none" in it it doesn't apply
local song = "Molding Time"
local author = "Appleanimations"
local remixAuthor = "none"
local coverAuthor = "none"
function onCreate()
	makeLuaSprite('songNameBG', '', 430, 500)
	if remixAuthor == 'none' and coverAuthor == 'none' then
		makeGraphic('songNameBG', 400, 50, '000000')
	elseif remixAuthor == 'none' or coverAuthor == 'none' then
		makeGraphic('songNameBG', 400, 70, '000000')
	else
		makeGraphic('songNameBG', 400, 90, '000000')
	end
	setObjectCamera('songNameBG', 'camOther')
	setProperty('songNameBG.alpha', 0)
	addLuaSprite('songNameBG', false)


	makeLuaText('songName', song, 400, 430, 500)
	setTextSize('songName', 25)
	setObjectCamera('songName', 'camOther')
	setProperty('songName.alpha', 0)
	addLuaText('songName')

	makeLuaText('songAuthorName', 'Song: ' ..author, 400, 430, 525)
	setTextSize('songAuthorName', 20)
	setObjectCamera('songAuthorName', 'camOther')
	setProperty('songAuthorName.alpha', 0)
	addLuaText('songAuthorName')

	if remixAuthor == 'none' then

	else
		makeLuaText('remixAuthorName', 'Remix: ' ..remixAuthor, 400, 430, 545)
		setTextSize('remixAuthorName', 20)
		setObjectCamera('remixAuthorName', 'camOther')
		setProperty('remixAuthorName.alpha', 0)
		addLuaText('remixAuthorName')
	end

	if coverAuthor == 'none' then

	else
		if remixAuthor == 'none' then
			makeLuaText('coverAuthorName', 'Cover: ' ..coverAuthor, 400, 430, 545)
		else
			makeLuaText('coverAuthorName', 'Cover: ' ..coverAuthor, 400, 430, 565)
		end
		setTextSize('coverAuthorName', 20)
		setObjectCamera('coverAuthorName', 'camOther')
		setProperty('coverAuthorName.alpha', 0)
		addLuaText('coverAuthorName')
	end
end

function onSongStart()
	doTweenAlpha('songNameBGAlpha', 'songNameBG', 0.3, 1, 'linear')
	doTweenAlpha('songNameAlpha', 'songName', 1, 1, 'linear')
	doTweenAlpha('songAuthorNameAlpha', 'songAuthorName', 1, 1, 'linear')
	doTweenAlpha('remixAuthorNameAlpha', 'remixAuthorName', 1, 1, 'linear')
	doTweenAlpha('coverAuthorNameAlpha', 'coverAuthorName', 1, 1, 'linear')
	runTimer('creditsFade', 3)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'creditsFade' then
		doTweenAlpha('songNameBGAlpha', 'songNameBG', 0, 1, 'linear')
		doTweenAlpha('songNameAlpha', 'songName', 0, 1, 'linear')
		doTweenAlpha('songAuthorAlpha', 'songAuthorName', 0, 1, 'linear')
		doTweenAlpha('remixAuthorName', 'remixAuthorName', 0, 1, 'linear')
		doTweenAlpha('coverAuthorName', 'coverAuthorName', 0, 1, 'linear')
	end
end