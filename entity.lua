
Entity = class{
	x = 0,
	y = 0,
}

function Entity:update(dt)
end

function Entity:draw()
end

function testEntity()
	local e = Entity()
	assert(type(e.update) == "function", "Entity doesn't have an update method")
end

