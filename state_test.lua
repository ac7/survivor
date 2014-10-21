
function testSetState()
	local a = 10
	local mockState = {
		setup = function() a = a + 1 end,
	}
	setState(mockState)
	-- ensure that newState.setup is called
	assertEq(11, a)
end

