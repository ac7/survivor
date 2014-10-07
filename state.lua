
function setState(newState)
	-- don't set state to newState until `setup()` has been called in case
	-- newState needs to reference the current state for some reason
	newState:setup()
	state = newState
end

