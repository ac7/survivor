
-- Squad is an object which contains a captain and a list of members.
Squad = class{
	-- cannot be initialized to a table, although it is one
	members = nil,
	captain = nil,
}

function Squad:__init(captain)
	assertIs("table", captain)
	self.captain = captain
	self.members = {}
end

function Squad:addMember(member)
	assertIs("table", member)
	assertIs("function", member.orderTo)
	table.insert(self.members, member)
end

function Squad:orderTo(x, y)
	local closestMember = closest(x, y, self.members)
	closestMember:orderTo(x, y)
end

