
function testSquadOrderTo()
	local unitOne = {
		orderTo = function()
			error("Unit one shouldn't have been ordered.")
		end,
		x = 12,
		y = 17,
	}

	local orderedCorrectly = false
	local unitTwo = {
		orderTo = function()
			orderedCorrectly = true
		end,
		x = -5,
		y = 5,
	}

	local squad = Squad({})
	squad:addMember(unitOne)
	squad:addMember(unitTwo)
	assertEq(2, #squad.members)

	squad:orderTo(0, 0)
	assert(orderedCorrectly == true,
		"Unit two was not ordered as it should have been.")
end

