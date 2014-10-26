
-- Calculate the hypotenuse of a right triangle with the ends of the legs at
-- (x1,y1) and (x2,y2). In other words, calculate the distance between (x1,y1)
-- and (x2,y2)
function distance(x1, y1, x2, y2)
	assertIs("number", x1)
	assertIs("number", y1)
	assertIs("number", x2)
	assertIs("number", y2)

	return math.sqrt((x1 - x2)^2 + (y1 - y2)^2)
end

function testDistance()
	assertEq(0, distance(0, 0, 0, 0))
	assertEq(1, distance(0, 0, 1, 0))
	assertEq(0, distance(1, 0, 1, 0))
	assertEq(3, distance(1, 3, 1, 0))

	assertApprox(math.sqrt(2), distance(0, 1, 1, 0))
	assertApprox(math.sqrt(2) * 8, distance(0, 8, 8, 0))
end

-- closest returns the object in the list that has an `x` and `y` closest to the
-- list. If the list is empty, closest returns nil.
function closest(x, y, list)
	assertIs("number", x)
	assertIs("number", y)
	assertIs("table", list)

	local closestMember
	local closestDistance

	for _, member in pairs(list) do
		local dist = distance(member.x, member.y, x, y)
		if closestMember == nil or dist < closestDistance then
			closestMember = member
			closestDistance = dist
		end
	end

	return closestMember
end

function testClosest()
	local expected = {x = 14, y = 8}
	local list = {
		{x = 10, y = 10},
		{x = -7, y = -8},
		expected,
		{x = 0, y = 0},
	}
	local result = closest(13, 9, list)
	assertEq(expected, result)

	assertEq(nil, closest(0, 0, {}))
end

