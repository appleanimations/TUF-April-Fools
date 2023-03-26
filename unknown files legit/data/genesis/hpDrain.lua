
function opponentNoteHit(id, direction, noteType, isSustainNote)
	-- Works the same as goodNoteHit, but for Opponent's notes being hit
	if  getHealth() > 0.02 then
		addHealth(-0.02)
	end
end
