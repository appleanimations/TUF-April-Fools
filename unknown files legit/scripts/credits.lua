local duration = 5 --duration box in seconds
local tweenD = 2 --tween duration in seconds
local creditsTxtSize = 20 --credits text size

local credits = { --actual credits, just edit them lol
    { --Genesis
        {"Appleanimations", "", ""}, --CODERS
        {"Appleanimations", "", ""}, --ARTISTS
        {"Steffe", "", ""}, --MUSICIAN
        {"DuduGD2023", "", ""} --CHARTERS
    },
    { --molding-time
        {"Appleanimations", "", ""}, --CODERS
        {"Appleanimations", "", ""}, --ARTISTS
        {"Appleanimations", "", ""}, --MUSICIAN
        {"Appleanimations", "", ""} --CHARTERS
    },
    { --pissing
        {"Appleanimations", "", ""}, --CODERS
        {"Appleanimations", "TK", "KringleKrBy"}, --ARTISTS
        {"Appleanimations", "", ""}, --MUSICIAN
        {"Appleanimations", "", ""} --CHARTERS
    },
    { --polybius
        {"Appleanimations", "DuduGD2023", ""}, --CODERS
        {"KringleKrBy", "", ""}, --ARTISTS
        {"Ironik", "", ""}, --MUSICIAN
        {"", "", ""} --CHARTERS
    }
}
local d = 1
function onCreatePost()

    --this detect every song duhh (elseif supremacy)
    if songName == 'Genesis' then
        d = 1
    elseif songName == 'molding-time' then
        d = 2
    elseif songName == 'pissing' then
        d = 3
    elseif songName == 'polybius' then
        d = 4
    end

    --the box
    makeLuaSprite('box', 'tuf/creditbox', -600, 0)
    setObjectCamera('box', 'other')
    scaleObject('box', 0.72, 0.72)
    addLuaSprite('box', true)

    makeLuaText('title', 'Credits', 0, 0, 20)
    setTextSize('title', 50)
    setTextFont('title', 'sonichud.ttf')
    setObjectCamera('title', 'other')
    setTextAlignment('title', 'left')
    addLuaText('title')

    makeLuaText('c', 'Coder', 0, 0, 110)
    setTextSize('c', 30)
    setTextFont('c', 'sonichud.ttf')
    setObjectCamera('c', 'other')
    setTextAlignment('c', 'Center')
    addLuaText('c')

    makeLuaText('a', 'Artist', 0, 0, 260)
    setTextSize('a', 30)
    setTextFont('a', 'sonichud.ttf')
    setObjectCamera('a', 'other')
    setTextAlignment('a', 'Center')
    addLuaText('a')

    makeLuaText('m', 'Musician', 0, 0, 410)
    setTextSize('m', 30)
    setTextFont('m', 'sonichud.ttf')
    setObjectCamera('m', 'other')
    setTextAlignment('m', 'Center')
    addLuaText('m')

    makeLuaText('ch', 'Charter', 0, 0, 560)
    setTextSize('ch', 30)
    setTextFont('ch', 'sonichud.ttf')
    setObjectCamera('ch', 'other')
    setTextAlignment('ch', 'Center')
    addLuaText('ch')

    for i = 1,3 do
        makeLuaText('coder'..i, credits[d][1][i], 0, 0, 0)
        setTextSize('coder'..i, creditsTxtSize)
        setTextFont('coder'..i, 'sonichud.ttf')
        setObjectCamera('coder'..i, 'other')
        setTextAlignment('coder'..i, 'Center')
        addLuaText('coder'..i)

        makeLuaText('artist'..i, credits[d][2][i], 0, 0, 0)
        setTextSize('artist'..i, creditsTxtSize)
        setTextFont('artist'..i, 'sonichud.ttf')
        setObjectCamera('artist'..i, 'other')
        setTextAlignment('artist'..i, 'Center')
        addLuaText('artist'..i)

        makeLuaText('musician'..i, credits[d][3][i], 0, 0, 0)
        setTextSize('musician'..i, creditsTxtSize)
        setTextFont('musician'..i, 'sonichud.ttf')
        setObjectCamera('musician'..i, 'other')
        setTextAlignment('musician'..i, 'Center')
        addLuaText('musician'..i)

        makeLuaText('charter'..i, credits[d][4][i], 0, 0, 0)
        setTextSize('charter'..i, creditsTxtSize)
        setTextFont('charter'..i, 'sonichud.ttf')
        setObjectCamera('charter'..i, 'other')
        setTextAlignment('charter'..i, 'Center')
        addLuaText('charter'..i)
    end
end
function onUpdatePost()
    for i = 1,3 do
        setProperty('title.x', getProperty('box.x')+80)
        setProperty('c.x', getProperty('box.x')+20)
        setProperty('a.x', getProperty('box.x')+20)
        setProperty('m.x', getProperty('box.x')+20)
        setProperty('ch.x', getProperty('box.x')+20)

        setProperty('coder'..i..'.y', (i*(getTextSize('coder'..i)+5))+130)
        setProperty('artist'..i..'.y', (i*(getTextSize('artist'..i)+5))+280)
        setProperty('musician'..i..'.y', (i*(getTextSize('musician'..i)+5))+430)
        setProperty('charter'..i..'.y', (i*(getTextSize('charter'..i)+5))+580)

        setProperty('coder'..i..'.x', (getProperty('box.x')+getProperty('box.width')/8))
        setProperty('artist'..i..'.x', (getProperty('box.x')+getProperty('box.width')/8))
        setProperty('musician'..i..'.x', (getProperty('box.x')+getProperty('box.width')/8))
        setProperty('charter'..i..'.x', (getProperty('box.x')+getProperty('box.width')/8))
    end
end
function onSongStart()
    doTweenX('hi', 'box', 0, tweenD, 'expoOut')
    runTimer('byetimer', duration, 1)
end
function onTimerCompleted(t)
    if t == 'byetimer' then
        doTweenX('bye', 'box', -600, tweenD, 'expoIn')
    end
end