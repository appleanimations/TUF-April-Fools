function onCreate()
	-- background shit
	makeLuaSprite('sky', 'soncinet/soncisky', -400, -500);
	setScrollFactor('sky', 1.2, 1.2);
	scaleObject('sky', 2.7, 2.7);
	
	makeLuaSprite('hill', 'soncinet/soncihill', -650, -300);
	setScrollFactor('hill', 0.9, 0.9);
	scaleObject('hill', 2.6, 2.6);

	makeLuaSprite('tree', 'soncinet/soncitree', -650, -300);
	setScrollFactor('tree', 0.9, 0.9);
	scaleObject('tree', 2.5, 2.6);

	addLuaSprite('sky', false);
	addLuaSprite('hill', false);
	addLuaSprite('tree', false);

end