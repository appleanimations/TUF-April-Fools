function onEvent(name, value1, value2)
	if name == 'DefaultZoom' then
		zoom = tonumber(value1)
		tween = tonumber(value2)
		if not tween == 0 or nil then
		doTweenZoom('theepiczoom', 'camGame', zoom, tween, 'cubeOut')
		end
		setProperty('defaultCamZoom', zoom)

        if zoom == nil then
		setProperty('defaultCamZoom', 0.9)
		elseif zoom == 0 then
		setProperty('defaultCamZoom', 0.1)
		end
	end
end