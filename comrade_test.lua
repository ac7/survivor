
function testComradeUpdate()
	local c = Comrade(-12, -10)

	c:orderTo(-14, -9)
	assertEq(-14, c.targetX)
	assertEq(-9, c.targetY)
	assert(c.moving == true)

	for i=0,100 do
		c:update(0.0005)
	end

	assertEq(-14, math.floor(c.x+0.5))
	assertEq(-9, math.floor(c.y+0.5))
end

