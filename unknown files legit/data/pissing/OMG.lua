local fakeScratchOffets = {
    {-100,-20}, --idle
    {-200,10}, --left
    {-30,10}, --down
    {-120,-80}, --up
    {100,-150} --right
}

local fakeBFOffets = {
    {1100,420}, --idle
    {805,150}, --left
    {1160,450}, --down
    {1120,430}, --up
    {1090,390}, --right
    {1095,400}, --left miss
    {1120,440}, --down miss
    {1135,395}, --up miss
    {1135,400} --right miss
}

--ignore below vars

local BFCanIdle = true
local ScratchCanIdle = true
local duration = 0.5

function onCreatePost()
    --Scratch
    makeAnimatedLuaSprite('Scratch', 'characters/scratch', 0, 0)

    --animations
    addAnimationByPrefix('Scratch', 'idle', 'sonic-scratch idle', 24, false)
    addAnimationByPrefix('Scratch', 'singLEFT', 'sonic-scratch left', 24, false)
    addAnimationByPrefix('Scratch', 'singDOWN', 'sonic-scratch down', 24, false)
    addAnimationByPrefix('Scratch', 'singUP', 'sonic-scratch up', 24, false)
    addAnimationByPrefix('Scratch', 'singRIGHT', 'sonic-scratch right', 24, false)

    addLuaSprite('Scratch', true)
    setObjectOrder('Scratch', getObjectOrder('dadGroup')-1)
    setProperty('Scratch.visible', false)

    --Boyfriend
    makeAnimatedLuaSprite('BF', 'characters/BOYFRIEND', 0, 0)

    --animations
    addAnimationByPrefix('BF', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('BF', 'singLEFT', 'boyfriend attack', 24, false)
    addAnimationByPrefix('BF', 'singDOWN', 'bf pre attack', 24, false)
    addAnimationByPrefix('BF', 'singUP', 'boyfriend dodge', 24, false)
    addAnimationByPrefix('BF', 'singRIGHT', 'BF hit', 24, false)
    addAnimationByPrefix('BF', 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false)
    addAnimationByPrefix('BF', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false)
    addAnimationByPrefix('BF', 'singUPmiss', 'BF NOTE UP MISS', 24, false)
    addAnimationByPrefix('BF', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)

    addLuaSprite('BF', true)
    setObjectOrder('BF', getObjectOrder('boyfriendGroup')-1)
    setProperty('BF.visible', false)

    precacheImage('characters/BOYFRIEND')
    precacheImage('characters/scratch')
end

function onBeatHit()
    if curBeat == 548 then
        setProperty('Scratch.visible', true)
        setProperty('BF.visible', true)
        cameraFlash('game', 'FFFFFF', 1, false)
    end

    if ScratchCanIdle then
        if curBeat % 2 == 0 then
            playAnim('Scratch', 'idle', false)
        end
    end
    if BFCanIdle then
        if curBeat % 2 == 0 then
            playAnim('BF', 'idle', false)
        end
    end
end

--[[ ignore this lolll (unused)
    if curBeat % 2 == 0 and stringStartsWith(getProperty('BF.animation.curAnim.name'), 'sing') then
        if getProperty('BF.animation.curAnim.finished') then
            playAnim('BF', 'idle', false)
        end
    end
]]

function onUpdatePost() --updating offsets

    --for idle

    if getProperty('BF.animation.curAnim.name') == 'idle' then
        setProperty('BF.x', fakeBFOffets[1][1])
        setProperty('BF.y', fakeBFOffets[1][2])
    end

    if getProperty('Scratch.animation.curAnim.name') == 'idle' then
        setProperty('Scratch.x', fakeScratchOffets[1][1])
        setProperty('Scratch.y', fakeScratchOffets[1][2])
    end

    --for left

    if getProperty('BF.animation.curAnim.name') == 'singLEFT' then
        setProperty('BF.x', fakeBFOffets[2][1])
        setProperty('BF.y', fakeBFOffets[2][2])
    end

    if getProperty('Scratch.animation.curAnim.name') == 'singLEFT' then
        setProperty('Scratch.x', fakeScratchOffets[2][1])
        setProperty('Scratch.y', fakeScratchOffets[2][2])
    end

    --for down

    if getProperty('BF.animation.curAnim.name') == 'singDOWN' then
        setProperty('BF.x', fakeBFOffets[3][1])
        setProperty('BF.y', fakeBFOffets[3][2])
    end

    if getProperty('Scratch.animation.curAnim.name') == 'singDOWN' then
        setProperty('Scratch.x', fakeScratchOffets[3][1])
        setProperty('Scratch.y', fakeScratchOffets[3][2])
    end

    --for up

    if getProperty('BF.animation.curAnim.name') == 'singUP' then
        setProperty('BF.x', fakeBFOffets[4][1])
        setProperty('BF.y', fakeBFOffets[4][2])
    end

    if getProperty('Scratch.animation.curAnim.name') == 'singUP' then
        setProperty('Scratch.x', fakeScratchOffets[4][1])
        setProperty('Scratch.y', fakeScratchOffets[4][2])
    end

    --for right

    if getProperty('BF.animation.curAnim.name') == 'singRIGHT' then
        setProperty('BF.x', fakeBFOffets[5][1])
        setProperty('BF.y', fakeBFOffets[5][2])
    end

    if getProperty('Scratch.animation.curAnim.name') == 'singRIGHT' then
        setProperty('Scratch.x', fakeScratchOffets[5][1])
        setProperty('Scratch.y', fakeScratchOffets[5][2])
    end

    --for left miss

    if getProperty('BF.animation.curAnim.name') == 'singLEFTmiss' then
        setProperty('BF.x', fakeBFOffets[6][1])
        setProperty('BF.y', fakeBFOffets[6][2])
    end

    --for down miss

    if getProperty('BF.animation.curAnim.name') == 'singDOWNmiss' then
        setProperty('BF.x', fakeBFOffets[7][1])
        setProperty('BF.y', fakeBFOffets[7][2])
    end

    --for up miss

    if getProperty('BF.animation.curAnim.name') == 'singUPmiss' then
        setProperty('BF.x', fakeBFOffets[8][1])
        setProperty('BF.y', fakeBFOffets[8][2])
    end

    --for right miss

    if getProperty('BF.animation.curAnim.name') == 'singRIGHTmiss' then
        setProperty('BF.x', fakeBFOffets[9][1])
        setProperty('BF.y', fakeBFOffets[9][2])
    end
end

--note hit functions

function goodNoteHit(id, nd, nt, isn)
    if nt == 'BFSing' then
        if nd == 0 then
            playAnim('BF', 'singLEFT', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 1 then
            playAnim('BF', 'singDOWN', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 2 then
            playAnim('BF', 'singUP', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 3 then
            playAnim('BF', 'singRIGHT', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
    elseif nt == 'BFNPoifend' then
        if nd == 0 then
            playAnim('BF', 'singLEFT', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 1 then
            playAnim('BF', 'singDOWN', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 2 then
            playAnim('BF', 'singUP', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 3 then
            playAnim('BF', 'singRIGHT', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
    end
end

function opponentNoteHit(id, nd, nt, isn)
    if nt == 'ScratchSing' then
        if nd == 0 then
            playAnim('Scratch', 'singLEFT', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
        if nd == 1 then
            playAnim('Scratch', 'singDOWN', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
        if nd == 2 then
            playAnim('Scratch', 'singUP', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
        if nd == 3 then
            playAnim('Scratch', 'singRIGHT', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
    elseif nt == 'ScratchNPisog' then
        if nd == 0 then
            playAnim('Scratch', 'singLEFT', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
        if nd == 1 then
            playAnim('Scratch', 'singDOWN', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
        if nd == 2 then
            playAnim('Scratch', 'singUP', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
        if nd == 3 then
            playAnim('Scratch', 'singRIGHT', true)
            ScratchCanIdle = false
            runTimer('sgobacktoidle', duration, 1)
        end
    end
end

--miss functions

function noteMiss(id, nd, nt, isn)
    if nt == 'BFSing' then
        if nd == 0 then
            playAnim('BF', 'singLEFTmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 1 then
            playAnim('BF', 'singDOWNmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 2 then
            playAnim('BF', 'singUPmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 3 then
            playAnim('BF', 'singRIGHTmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
    elseif nt == 'BFNPoifend' then
        if nd == 0 then
            playAnim('BF', 'singLEFTmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 1 then
            playAnim('BF', 'singDOWNmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 2 then
            playAnim('BF', 'singUPmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
        if nd == 3 then
            playAnim('BF', 'singRIGHTmiss', true)
            BFCanIdle = false
            runTimer('bfgobacktoidle', duration, 1)
        end
    end
end

--gobacktoidle function

function onTimerCompleted(t)
    if t == 'bfgobacktoidle' then
        BFCanIdle = true
    end
    if t == 'sgobacktoidle' then
        ScratchCanIdle = true
    end
end