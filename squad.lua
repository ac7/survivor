
Squad = class{
	-- cannot be initialized to a table, although it is one
	entities = nil,
	captain = nil,
}

function Squad:__init(captain)
	assertIs("table", captain)
	self.captain = captain
	self.entities = {}
end

function Squad:addMember(member)
	assertIs("table", member)
	assert(member.orderTo)
	table.insert(self.entities, member)
end

function Squad:orderTo(x, y)
	local closestMember = closest(x, y, self.entities)
	closestMember:orderTo(x, y)
end

